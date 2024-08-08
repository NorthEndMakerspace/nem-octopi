# Set up OctoPi for a NEM printer

There are a few phases to setting up a fresh install of OctoPi.

## Image the SD card

1. Connect the MicroSD card to your computer
2. Download, install and run [Raspberry Pi Imager](https://www.raspberrypi.com/software/)
3. In Imager, select the type of Raspberry Pi device
4. In Imager, select `Operating System -> Other specific-purpose OS -> 3D printing -> OctoPi -> OctoPi (stable)`
5. In Imager, select the USB connection for the MicroSD card
6. When prompted if you'd like to apply OS customization, choose `EDIT SETTINGS` and configure:
   1. Set hostname: all-lowercase hostname equal to the name of the printer this instance will use
   2. Set username and password:
      1. User `pi`
      2. Use the established password for this (ask octoprint steward if unsure)
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
      1. *Enable* - Eject media when finished
      2. *Disable* other options
7. Click `Save`
8. When asked if you want to apply OS customization settings, click `YES`
9. When asked if you're sure, click `YES`

The imager will write to the memory card; this will take several minutes. After
writing to the card, the imager will verify the consistency of data written to
the card.  All told this will take a few minutes.

When Raspberry Pi Imager is finished, remove the microSD card from your computer
and you can now quit the imager.

## Prepare and mount the Raspberry Pi

1. Put the Raspberry Pi into its 3D printed case if it's not there already.
2. Insert the Micro SD card into its slot in the Raspberry Pi.
3. Mount the case to the printer.
4. Connect the USB cable using any available USB-A port on the Raspberry Pi.
5. Connect the other end of the USB cable to the USB port on the printer.
6. Connect the Raspberry Pi power cable to a power source (either AC plug or a
   DC power supply, depending on the power setup).
7. Finally, connect the power cable to the Raspberry Pi.
8. Observe that the power light is lit on the Raspberry Pi.
9. Use velcro or other cable ties to tidy the USB and power cables, ensuring they
   won't interfere with the printer's cable looms and axis range of motion.
10. Give the Raspberry Pi a couple minutes to boot up.  Return to your computer
   for the rest of setup.
11. After a few minutes, confirm you can ping the Raspberry Pi on the NEM WiFi
    network:
    1. Say for example you just set up printer `pinky`.
    2. Open PowerShell (Windows), or Terminal (Mac, Linux)
    3. Run `ping pinky`
    4. You should get a successful response. If not, wait longer and try again.
       If after 5 minutes you are not getting a response, escalate to an
       OctoPrint steward (Mike H in Discord).
12. After the Raspberry Pi responds to ping by name, you are finished setting up
    the base OctoPi image!
13. Go back to the [main page](/README.md) to continue configuring NEM OctoPrint.
