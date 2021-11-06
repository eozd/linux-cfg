#!/usr/bin/env bash


sudo rsync -aAXv --delete --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/opt/*","/lost+found/*","/var/cache/pacman/pkg/*","/home/eozd/.cache","/home/eozd/Games","/home/eozd/.local/share/Steam"} / /mnt/hdd/backup
