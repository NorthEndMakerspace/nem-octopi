# Backing up the system

The most recoverable way to back up the OctoPi system is to take a full image of the SD card and store the image somewhere safe where unauthorized people cannot access it.

Barring a backup of the system, any SD card or other failure will necessitate setting up from scratch.  While not a lot of work, restoring from SD card backup is *much* faster.

## Make a backup

Shut down the OctoPi system and remove its MicroSD card.

On a Mac or Linux system, connect the MicroSD card and identify its device name.  In this example the connected MicroSD card  is `/dev/disk6`.

```bash
sudo dd if=/dev/rdisk6 of=/path/to/backup/location bs=1M
```

After this, put the MicroSD card back into the OctoPi system and boot it back up.

## Restore from a backup

If the system or MicroSD card fails, procure new hardware and do the following.  In this example the connected MicroSD card  is `/dev/disk6`.

```bash
sudo dd if=/path/to/backup/location of=/dev/rdisk6 bs=1M
```
