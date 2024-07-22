# Set up OctoPi for a NEM printer

1. Connect the MicroSD card to your computer
2. Download, install and run [Raspberry Pi Imager](https://www.raspberrypi.com/software/)
3. In Imager, select the type of Raspberry Pi device
4. In Imager, select `Operating System -> Other specific-purpose OS -> 3D printing -> OctoPi -> OctoPi (stable)`
5. In Imager, select the USB connection for the MicroSD card
6. When prompted if you'd like to apply OS customization, choose `EDIT SETTINGS` and configure:
   1. Set hostname: all-lowercase hostname equal to the name of the printer this instance will use
   2. Set username and password:
      1. User `pi`
      2. Use the established password for this (ask stewards if unsure)
   3. Configure wireless:
      1. SSID: `NEM`
      2. Add the password
      3. Wireless LAN country: `US`
   4. Set locale settings:
      1. Time zone: `America/Los_Angeles`
      2. Keyboard layout: `us`
   5. Services tab:
      1. Enable SSH and use password authentication
   6. Options:
      1. Eject media when finished

Put the microSD card into the Raspberry Pi and boot it up!
