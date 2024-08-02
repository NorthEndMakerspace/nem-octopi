# Set up OctoPi on NEM Printers

OctoPi is a full OS intended for running OctoPrint, and is based on Raspbian.  It's a perfect choice for running OctoPrint on Raspberry Pi systems.

## Bill of Materials

You need the following for each printer:

1. Raspberry Pi 3B or newer [Example](https://www.canakit.com/raspberry-pi/pi-3-model-b-plus-kits)
2. Power supply providing 5V and >= 2.5A [Example](https://www.canakit.com/official-raspberry-pi-power-supply.html)
3. MicroSD card of at least 32GB size [Example](https://www.amazon.com/s?k=micro+sd+card+128GB)
4. 3D printed case for Raspberry Pi to attach to its printer's frame [Prusa Example](https://www.thingiverse.com/thing:2334119) / [Ender Example](https://www.thingiverse.com/thing:4586351)
5. A USB-A to USB-B cable [Example](https://www.amazon.com/s?k=usb-a+to+usb-b)

## Set up OctoPi

Follow [guides/SYSTEM_SETUP.md](guides/SYSTEM_SETUP.md) to set up a new OctoPi system.

## Prepare for a new printer

The Ansible playbook is pre-configured with details about each current printer.  When adding a new printer for the space, one must *first* update the Ansible playbook before configuring OctoPrint on its corresponding Raspberry Pi system.

This has to be done by a developer on [the Github repo](https://github.com/mikeymakesit/nem-octopi/):

```bash
export ANSIBLE_VAULT_PASSWORD="" # octoprint "steward" user's password
export ANSIBLE_VAULT_PASSWORD_FILE=ansible/.vault_password
ansible-vault edit nem-octopi/ansible/roles/octoprint/vars/main.yaml
```

Then push your commit and open a PR on the project.  After it's been merged, one can continue on to setting up OctoPrint for that printer.

## Set up OctoPrint

Log on to the OctoPi instance as user `pi` and run:

```bash
# Clone/update the repo for NEM-OctoPi
if [[ ! -d nem-octopi ]]; then
  git clone https://github.com/mikeymakesit/nem-octopi.git
  cd nem-octopi
else
  cd nem-octopi
  git pull
fi

# Install or upgrade Ansible then run the playbook
bin/setup.sh
```

If needed, manual configuration is documented at [guides/OctoPrint_SETUP.md](guides/OctoPrint_SETUP.md).

## Other Guides

Look in [guides/](guides/) for more docs around managing OctoPi and OctoPrint.

Examples of [sending webhooks from OctoPrint](guides/OCTOPRINT_WEBHOOKS.md).

## Non-Steward HowTo Documentation

[Here's basic documentation for members who want to use OctoPrint](https://docs.google.com/document/d/19koeQdrWI8UM_GHkYruB8IRlSfDRL1jBYS-6IkQEMAU/edit?usp=sharing)

## Reference

<https://github.com/guysoft/OctoPi>
