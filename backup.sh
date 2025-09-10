#!/usr/bin/env fish

############################
#       VARIABLES          #
############################

# Directory
set DIRECTORY /backups

# File extension
set EXTENSION tar.gz

# Limit
set LIMIT 5

############################
#          UPDATE          #
############################

echo "Updating system"
sudo apt update -y
sudo apt upgrade -y

############################
#         TEMPORALS        #
############################

echo "Delete temporal files"
sudo rm -rf /tmp/*
sudo apt clean -y
sudo apt autoclean -y
sudo apt autoremove -y
sudo rm -rf ~/.cache/*
sudo journalctl --vacuum-time=7d

############################
#          BACKUP          #
############################

echo "Making backups /etc/ /home/"
sudo tar -czf "$DIRECTORY/etc/etc-backup-"(date +%d%m%Y)".tar.gz" /etc/
sudo tar -czf "$DIRECTORY/home/home-backup-"(date +%d%m%Y)".tar.gz" /home/

############################
#          PURGE           #
############################

echo "Purging old backups..."

for SUBDIR in $DIRECTORY/*/
    echo "Checking directory: $SUBDIR"

    # Archivos con la extensión
    set FILES (echo $SUBDIR*.$EXTENSION ^ /dev/null)
    set QUANTITY (count $FILES)

    if test $QUANTITY -gt $LIMIT
        echo "Found $QUANTITY files in $SUBDIR (limit $LIMIT). Deleting oldest..."

        # Borrar archivo más viejo
        set OLDEST (ls -1tr $SUBDIR*.$EXTENSION ^ /dev/null | head -n 1)
        if test -n "$OLDEST"
            echo "Deleting: $OLDEST"
            rm -f $OLDEST
        end
    end
end

