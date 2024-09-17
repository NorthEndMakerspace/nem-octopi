# Set up OctoPi on NEM Printers

OctoPi is a full OS intended for running OctoPrint, and is based on Raspbian.  It's a perfect choice for running OctoPrint on Raspberry Pi systems.

## Bill of Materials

You need the following for each printer:

1. Raspberry Pi 3B or newer [Example](https://www.canakit.com/raspberry-pi/pi-3-model-b-plus-kits)
2. Power supply providing 5V and >= 2.5A [Example](https://www.canakit.com/official-raspberry-pi-power-supply.html)
3. MicroSD card of at least 32GB size [Example](https://www.amazon.com/s?k=micro+sd+card+128GB)
4. 3D printed case for Raspberry Pi to attach to its printer's frame [Prusa Example](https://www.thingiverse.com/thing:2334119) / [Ender Example](https://www.thingiverse.com/thing:4586351)
5. A USB-A to USB-B cable [Example](https://www.amazon.com/s?k=usb-a+to+usb-b)
6. Miscellaneous hardware for mounting the Pi case to its printer
7. One or more velcro or other cable ties to tidy wiring

## Set up OctoPi

Follow [guides/SYSTEM_SETUP.md](guides/SYSTEM_SETUP.md) to set up a new OctoPi system.

## Set up OctoPrint

1. SSH to the OctoPi instance as user `pi`:
   1. Say you just set up OctoPrint for a printer called `pinky`
   2. In Powershell (Windows) or Terminal (Mac, Linux), run `ssh pi@pinky`
   3. You'll be asked if you really want to connect to the host, where you will say `yes`
   4. You will be prompted for the password for user `pi`.  If you don't know
      this password, get it from the OctoPrint steward (e.g. Mike H on Discord)
2. After logging in successfully using SSH, copy and paste the entire following
   block into your PowerShell or Terminal window:

```bash
# Clone/update the repo for NEM-OctoPi
if [[ ! -d nem-octopi ]]; then
  git clone https://github.com/NorthEndMakerspace/nem-octopi.git
  cd nem-octopi
else
  cd nem-octopi
  git pull
fi

# Install or upgrade Ansible then run the playbook
bin/setup.sh
```

The above code will run the automation to configure OctoPrint for a NEM printer.

> NOTE: The above automation can take ~10 minutes or so depending on network
> speed.  *Do not worry* if your SSH connection looks idle; it's working!

When you're returned to the command prompt on your SSH connection, you're
finished!  You can log out of your SSH connection by typing `exit` and close
your PowerShell/Terminal window.

Finally, open a web browser and connect to `http://printername`.
You *have to* type the `http://` prefix.  You're now ready to log
on as the admin user `steward`.  If you need the admin user `steward`
password, get it from an OctoPrint steward (e.g. Mike H on Discord).

## Configure the 3D Printing Room PC

On the 3D Printing Room PC:

1. Open `http://printername` in the browser and confirm it opens.
2. Add a bookmark to the bookmarks bar.  Make sure the bookmark is for the base
   URL `http://printername`.
3. Log on as user `steward`.
4. Click the wrench (upper right corner) to open OctoPrint settings.
5. Click on `Features -> Application Keys`
6. Click the magnifying glass to the right of the application key for `PrusaSlicer`
7. Note the API key and copy it to the clipboard.
8. Open PrusaSlicer and add a `Physical printer`:
   1. Click `Printers` on the top bar
   2. From the drop-down selector, choose the default system preset people
      normally use on this printer.
   3. Click the gear icon to the right of the printer profile drop-down.  It's
      pop-over text says `Add physical printer`
   4. For the `Descriptive name for the printer` type, all lowercase, the name
      of the printer you're configuring, e.g. `pinky`
   5. Change `Host Type` to `OctoPrint`
   6. Enter the printer name for `Hostname` e.g. `pinky`
   7. Paste the API key from the clipboard into the `API Key / Password` prompt
   8. Click `Test` and it should succeed.
   9. Click `OK` and you're done!  You'll see the new physical printer in the
      printer profile drop-selection list.
9. Log out of `OctoPrint`.
10. Log in as user `nem` with password `nem` and tick the box to `Remember me`.
   1. This is the user members will use on a day-to-day basis; it
   does not have access to OctoPrint settings.

## Other Guides

If needed, manual configuration is documented at [guides/OctoPrint_SETUP.md](guides/OctoPrint_SETUP.md).

Look in [guides/](guides/) for more docs around managing OctoPi and OctoPrint.

Examples of [sending webhooks from OctoPrint](guides/OCTOPRINT_WEBHOOKS.md).

## Non-Steward HowTo Documentation

[Here's basic documentation for members who want to use OctoPrint](https://docs.google.com/document/d/19koeQdrWI8UM_GHkYruB8IRlSfDRL1jBYS-6IkQEMAU/edit?usp=sharing)

## Prepare for a new printer

The Ansible playbook is pre-configured with details about each current printer.  When adding a new printer for the space, one must *first* update the Ansible playbook before configuring OctoPrint on its corresponding Raspberry Pi system.

This has to be done by a developer on [the Github repo](https://github.com/NorthEndMakerspace/nem-octopi):

```bash
export ANSIBLE_VAULT_PASSWORD="" # octoprint "steward" user's password
export ANSIBLE_VAULT_PASSWORD_FILE=ansible/.vault_password
ansible-vault edit nem-octopi/ansible/roles/octoprint/vars/main.yaml
```

Then push your commit and open a PR on the project.  After it's been merged, one can continue on to setting up OctoPrint for that printer.

## Reference

<https://github.com/guysoft/OctoPi>
