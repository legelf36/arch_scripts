#!/bin/bash

rsync_options="-arpEv --mkpath --super --delete"

$(which rsync) $rsync_options /home/kim/.scripts /mnt/wd2tb/Backups/
$(which rsync) $rsync_options /home/kim/.config /mnt/wd2tb/Backups/
$(which rsync) $rsync_options /home/kim/.projects /mnt/wd2tb/Backups/
$(which rsync) $rsync_options /home/kim/Documents /mnt/wd2tb/Backups/
$(which rsync) $rsync_options /home/kim/Downloads /mnt/wd2tb/Backups/
$(which rsync) $rsync_options /home/kim/Pictures /mnt/wd2tb/Backups/
$(which rsync) $rsync_options /home/kim/Videos /mnt/wd2tb/Backups/
$(which rsync) $rsync_options /home/kim/Cad /mnt/wd2tb/Backups/
