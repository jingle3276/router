SRC_DIR=root@192.168.2.125::ufs3t/media/music
OUT_DIR=/mnt/e_store/music
LOG_FILE=/opt/var/log/rsync.log

# empty log file
cat /dev/null > $LOG_FILE

# rsync dirs one by one. note utf-8 filenames can be used
rsync -av --out-format="%t %f %b" $SRC_DIR/交响管弦 $OUT_DIR >> $LOG_FILE 2>&1
rsync -av --out-format="%t %f %b" $SRC_DIR/民乐 $OUT_DIR >> $LOG_FILE 2>&1
rsync -av --out-format="%t %f %b" $SRC_DIR/歌曲 $OUT_DIR >> $LOG_FILE 2>&1
rsync -av --out-format="%t %f %b" $SRC_DIR/相声 $OUT_DIR >> $LOG_FILE 2>&1

