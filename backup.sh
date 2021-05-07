#!/bin/sh
# incremantal daily backups
# ali oguzhan yildiz <aoguzhanyildiz@gmail.com>
# expects a backup.excludes file that contains list of files/folders to be ignored
# same format as .gitignore file.

set -e

_TODAY=$(date +"%d-%m-%Y")

echo "Mime Tachine 2021"
echo "Starting daily backup ${_TODAY}"
echo "-----------------------------------"

_RSYNC="/usr/bin/sudo /usr/bin/rsync"
_YESTERDAY=$(date -d "1 day ago" +"%d-%m-%Y")
_OLDEST_BACKUP=$(date -d "15 days ago" +"%d-%m-%Y")
_NOW=$(date +"%d-%m-%Y %H:%M:%S")

readonly _YESTERDAY
readonly _OLDEST_BACKUP
readonly _NOW
readonly _RSYNC
readonly _TODAY

readonly _BACKUP_DIR="/media/ali/MIME_TACHINE"
readonly _EXCLUDES="backup.excludes"
readonly _LOGFILE="$_BACKUP_DIR/BACKUP_success.log"

readonly _DESTINATION="${_BACKUP_DIR}/${_TODAY}"
readonly _LATEST=${_BACKUP_DIR}/latest

mkdir -p ${_BACKUP_DIR}/"${_YESTERDAY}"

rsync -avxp \
    --progress \
    --delete \
    --rsync-path="$_RSYNC" \
    --exclude-from=$_EXCLUDES \
    --numeric-ids \
    --delete -r \
    --link-dest=../"$_YESTERDAY" \
    -a \
    "$HOME" "$_DESTINATION"

rm -rf $_LATEST
ln -fs "$_DESTINATION" $_LATEST

rm -rf "${_BACKUP_DIR:?}/${_OLDEST_BACKUP}"

echo "BACKUP: success ${_NOW}" >>$_LOGFILE
