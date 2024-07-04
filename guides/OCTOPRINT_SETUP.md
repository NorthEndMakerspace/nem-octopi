# Initial OctoPrint Setup

With a configured OctoPi system, you can open OctoPrint in a web browser from any PC on the makerspace WiFi network.

Given, for example, the OctoPi for printer `pinky`, go to [http://pinky.local/](http://pinky.local/).

## Wizard

On first access, you'll be greeted with the Setup Wizard.  Let's go through it together.

### Restore Backup?

We have no backup to restore.

### Access Control

Create user `steward` and use the appropriate NEM OctoPrint password.  This will be the admin user for OctoPrint, with full access to its settings.

> TODO: This password should be stored somewhere safe where OctoPrint stewards have access to it.  Unsure if NEM has a secret sharing solution in place.

### Online Connectivity Check

Set the `Check interval` to `30 min`.

Ensure that the connectivity check is `enabled`.  This will prevent the system getting angry if e.g. it thinks it should check for updates but can't reach update servers.

### Anonymous Usage Tracking

In the spirit of supporting this excellent open source software, click `Enable Anonymous Usage Tracking`.

### Plugin Blacklist

Click `Enable Plugin Blacklist Processing` to increase system reliability.

### Classic Webcam Wizard

Make no changes here.

### Default Printer Profile

#### General

- Add the printer's `Name` (all lowercase)
- Update `Model` with the model of this printer

#### Print bed & build volume

Enter the appropriate values for the printer.  You'll probably need to look these up online.

#### Axes

Same as above, look them up online.

#### Hotend & extruder

Same as above, look them up online.

### Finish

Read the notices and check the boxes marking acceptance of each, then click `Finish`!

If prompted, click to Reload the page.

## Add the makerspace user

In normal operation, people will interact with OctoPrint as the less-privileged user `nem` with password `nem` and the login page will be set to remember the user.

In the upper-right corner, click the gear icon to open settings.

1. Find and click on `Features -> Access Control`
2. Click `+ Add user...`
3. Create user `nem` with password `nem`
4. Mark it as `Active`
5. On the `Groups` tab, *only* assign group `Operator`
6. Click `Confirm` to add the user

Click `Save` to save and close the settings.

## Configuring the API for Badgers

1. In settings, click on `Features -> API`
2. Check the box for `Allow Cross Origin Resource Sharing (CORS)` so that remote API calls can be made
3. **DO NOT use the Global API Key**
4. Click on `Features -> Application Keys`
5. Select user `nem` (so that the API key will have reduced privileges)
6. For `Application identifier` enter `Badger` or other relevant and informative description of the use case
7. Copy the generated API key and store it somewhere safe.  You can come back to the application keys list to view the API key at any time.

See [OctoPrint_API.md](/guides/OctoPrint_API.md) for more information about using the API.

Click `Save` to save and close the settings.

## General server configuration

1. In settings, click on `Printer -> Serial Connection`
2. Click the checkbox for `Auto-connect to printer on server start`
3. Click on `Features -> Features` and *clear* the checkbox for `Enable model size detection and warn if model exceeds print bed`
4. Click on `Features -> Webcam & Timelapse` and
   1. *Clear* the checkbox for `Enable webcam support`
   2. *Clear* the checkbox for `Enable timelapse support`
5. Click on `OctoPrint -> Appearance` and set `Title` to the printer's name, e.g. `pinky`.  This will provide a visual cue to users of OctoPrint which printer they're working with.
6. Click on `OctoPrint -> Announcements` and *clear* all of the announcements.  We don't want makerspace users to see announcements and think there's something they should do.

Click `Save` to save and close the settings.

## Log on as makerspace user

1. Log off from the steward account
2. At the login prompt, enter username and password `nem`
3. **Click the `Remember me` checkbox!
4. Log on

The `nem` username and password can be stored on the wiki or wherever people may need it if OctoPrint gets logged out for some reason.  Non-steward members should not access the `steward` account as settings will become changed, resulting in unreliable operation.

## Discord integration

If the OctoPrint and 3d printing stewards agree to have OctoPrint instances send print job status updates to Discord channels, follow the steps here to set it up.

> TODO pending discussion with 3d printing stewards.
