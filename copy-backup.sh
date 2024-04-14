#!/bin/bash
curr_date=$(date +%D)
backup_dir=/.snapshots/daily.0
zip_name=daily0.zip
dest_dir=/media/$USER/Transcend/backup-new

if test -d $backup_dir
then
    dir_date=$(date -r $backup_dir +%D)
    if [ $dir_date == $curr_date ];
    then
        echo "Creating $zip_name"
        zip -r $zip_name $backup_dir/localhost/home/$USER --exclude=*/.* --symlinks
        echo "$zip_name created"
    fi
else
    echo "$backup_dir has no backup for $curr_date. Try runnning this script with sudo."
fi

if test -d $dest_dir
then
    echo "Copying $zip_name to $dest_dir"
    rsync -avvz --progress $zip_name $dest_dir
else
    echo "$dest_dir does not exist. Is your drive plugged in?"
fi
