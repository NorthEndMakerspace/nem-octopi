# Set up OctoPi for a NEM printer

I use a Mac; some of the commands described here are Mac-centric.

Download the latest image of [Octopi](https://octopi.OctoPrint.org/latest).

## NEM and printer details

Set up some parameters for our overall configuration:

```bash
set -k
WIFI_NAME=NEM         # Update to current NEM wifi SSID
WIFI_PASSWORD='blah'  # Update to current NEM wifi password
```

## Write image to MicroSD card

Do not yet connect the MicroSD card to your computer.  First, follow the instructions below:

```bash
# Starting in this project directory, remember the location so we can switch back later
pushd .

# Unzip the compressed image
cd ~/Desktop
mv ../Downloads/octopi* .
unzip octopi*.zip && rm octopi*.zip

# Enumerate the filename so we can pass it to the imager later
image=$(ls -t1 octopi*.img | head -1)

# Identify the external disk and eject it
diskutil list > /tmp/nodisk
```

Insert the MicroSD card into your computer and continue:

```bash
diskutil list > /tmp/yesdisk
microsd=$(diff /tmp/nodisk /tmp/yesdisk | sed -nr 's/^> \/dev\/(.*) \(external, physical\).*/\1/p')
rm -f /tmp/nodisk /tmp/yesdisk
diskutil unmountDisk /dev/$microsd

# Write the image
sudo dd if=$image of=/dev/r${microsd} bs=1M
#rm -f $image

# Return to the project directory
popd
```

## Set up the operating system

Ensure SSH is enabled:

```bash
touch /Volumes/boot/ssh
```

Configure WiFi:

```bash
sed -e "s/WIFI_NAME/$WIFI_NAME/" \
    -e "s/WIFI_PASSWORD/$WIFI_PASSWORD/" \
    templates/template-octopi-wpa-supplicant.txt \
    > /Volumes/boot/octopi-wpa-supplicant.txt
```

## Boot up the Raspberry Pi

Eject the MicroSD card from your system and insert it into the Raspberry PI.

Connect power to boot the system.  After it connects to WiFi you'll be able to SSH to it using hostname `octopi.local` with username `pi` and password `raspberry`.

## Change password

Change the password for user `pi`:

```bash
pi@octopi:~ $ passwd
Changing password for pi.
Current password:  # raspberry
New password: 
Retype new password: 
passwd: password updated successfully
```

> TODO: This password should be stored somewhere safe where OctoPrint stewards have access to it.  Unsure if NEM has a secret sharing solution in place.

## Configure the system

1. Run `sudo raspi-config`.
   1. Go to `System Options -> Hostname` and set the hostname to the associated printer's name, e.g. `pinky`.
   2. Go to `Localisation Options -> Timezone` and select `America -> Los Angeles`.
2. Select `<Finish>` and reboot when prompted.

Update the hostname in `/etc/hosts`:

```bash
sudo sed -ie 's/octoprint/pinky/g' /etc/hosts
```
