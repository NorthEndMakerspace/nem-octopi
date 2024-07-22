#!/bin/bash
# Configure local OctoPrint instance

backupDir=$HOME/.octoprint/data/backup
preConfigBackup=$backupDir/octoprint-$(date +%Y%m%d)-pre.zip
postConfigBackup=$backupDir/octoprint-$(date +%Y%m%d)-post.zip
hostname=$(hostname)


# Make a backup
function do_backup {
  backupFile=$1
  if [[ -f $backupFile ]]; then
    echo "Removing existing backup $backupFile"
    rm -f $backupFile
  fi
  octoprint plugins backup:backup --exclude uploads --path $backupFile
}


# Get the steward user's password, which is also the Ansible vault password
echo -n "Enter password for OctoPrint user 'steward': "
read -s ANSIBLE_VAULT_PASSWORD
export ANSIBLE_VAULT_PASSWORD
echo

# Initialize OctoPrint's Python virtualenv
source $HOME/oprint/bin/activate

# Back up before applying configs...just in case
echo "Making OctoPrint backup before configuring"
do_backup $preConfigBackup

# Install/upgrade ansible and run the playbook
pip install -U ansible
export ANSIBLE_VAULT_PASSWORD_FILE=ansible/.vault_password

# Verify there's config for this host in the role's variables
ansible-vault view ansible/roles/octoprint/vars/main.yaml | grep -qw $hostname
if [[ $? -gt 0 ]]; then
  echo "You need to put config for this printer in ansible/roles/octoprint/vars/main.yaml"
  exit 1
fi
ansible-playbook -i ansible/inventory.yaml ansible/configure.yaml

deactivate
exit 0
