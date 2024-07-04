# OctoPi System Maintenance

Applying updates keeps the system and software healthy.

## OS Patching

Occasionally the operating system should be updated.

1. SSH into the system as `pi` with the corresponding password
2. Run `sudo apt update` and provide the `pi` user's password when prompted
3. Run `sudo apt -y dist-upgrade`
4. Run `sudo apt -y autoremove`
5. Run `sudo reboot` to restart the system

## Update OctoPrint

Occasionally OctoPrint should be updated.

1. Log on to OctoPrint as user `steward`
2. Open `Settings -> Octoprint -> Software Update`
3. Click `Check for updates`
4. If any updates were found, click `Update all` and follow the instructions
