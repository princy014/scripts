#!/bin/bash

<<help
this is a shell script to take a backups
can also b used with crone

this shell script will take periodic backups


eg.
./backup.sh <source> <dest>
src /home/ubuntu/scripts
help

src=$1 
dest=$2

timestamp=$(date '+%Y-%m-%d-%H-%M')

zip -r  "$dest/backup-$timestamp.zip" $src


aws s3 sync "$dest" s3://princy-backups


echo  "backup completed and uploaded to s3"
