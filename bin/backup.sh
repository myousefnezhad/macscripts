# Backup Script
##################################### Parameters ###################################
LOG_FILE_FORMAT=$(date +%Y.%m.itonymax)
LOG_PATH="/IRONMAN/logs/$LOG_FILE_FORMAT"
RSY_ROOT=("/Users/tony/Backup" )
RST_NAME=("Documents" )
RSY_SCR=("/IRONMAN20/Documents" )
RSY_DST=("/Users/tony/Backup/. " )
#RCO_ROOT=()
#RCO_NAME=()
#RCO_SCR=()
#RCO_DST=()
####################################################################################
####################################################################################
####################################################################################
####################################################################################
####################################################################################
####################################################################################
####################################################################################
####################################################################################
####################################################################################
####################################################################################
####################################################################################
####################################################################################
# Functions
function write_log() {
	printf "%-50s[%-22s]\n" $1 $(date +%Y/%m/%d_%a_%H:%M:%S) >> "$LOG_PATH.txt"
}
# Start Backup
write_log "BACKUP::START"
## RSYNC Backup
write_log "BACKUP::RSYNC::START"
for i in ${!RSY_ROOT[@]}; do
	rsync_root=${RSY_ROOT[$i]}
	rsync_name=${RST_NAME[$i]}
	rsync_source=${RSY_SCR[$i]}
	rsync_destination=${RSY_DST[$i]}
	if [ -d $sync_root ]
	then
		write_log "BACKUP::RSYNC::SYNCING::$rsync_name"
		rsync -razvh --checksum --progress --update --delete $rsync_source $rsync_destination >> "$LOG_PATH.$rsync_name.txt"
		write_log "BACKUP::RSYNC::SYNCED::$rsync_name"
	else
		write_log "BACKUP::RSYNC::ROOT_NOT_FOUND::$rsync_name"
	fi
done
write_log "BACKUP::RSYNC::STOP"
## RCLONE BACKUP
#write_log "BACKUP::RCLONE::START"
#for j in ${!RCO_ROOT[@]}; do
#	rclone_root=${RCO_ROOT[$j]}
#	rclone_name=${RCO_NAME[$j]}
#	rclone_source=${RCO_SCR[$j]}
#	rclone_destination=${RCO_DST[$j]}
#	if [ -d $rclone_root ]
#	then
#		write_log "BACKUP::RCLONE::SYNCING::$rclone_name"
#                rclone -v sync $rclone_source $rclone_destination
#		write_log "BACKUP::RCLONE::SYNCED::$rclone_name"
#	else
#		write_log "BACKUP::RCLONE::ROOT_NOT_FOUND::$rclone_name"
#	fi
#done
#write_log "BACKUP::RCLONE::STOP"
#write_log "BACKUP::STOP"
# Stop Backup
