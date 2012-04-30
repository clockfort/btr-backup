#!/bin/dash
EXCLUDE_FILE=/mnt/clockfort/snapshots/.exclude


#Local homedir backup
rsync -axv --stats --exclude-from=${EXLUDE_FILE} --delete-after /home/clockfort /mnt/clockfort/storage/backups/jolt-home
btrfsctl -s /mnt/clockfort/snapshots/jolt-home-backup-$( date +%Y%m%d-%H%M ) /mnt/clockfort/storage/backups/jolt-home/

#Keep more Windows backups (as Windows Backup only keeps one on network drive backups)
btrfsctl -s /mnt/clockfort/snapshots/amp-windows-backup-$( date +%Y%m%d--%H%M ) /mnt/clockfort/storage/backups/WindowsImageBackup/amp/

#VPS Backup
rsync -axv --stats --exclude-from=${EXCLUDE_FILE} --delete-after /mnt/clockfort-vps/ /mnt/clockfort/storage/backups/vps/
btrfsctl -s /mnt/clockfort/snapshots/vps-backup-$( date +%Y%m%d--%H%M ) /mnt/clockfort/storage/backups/vps/

