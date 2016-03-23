# this script depends on coreutils-touch, the GNU full version of touch

OPT_BIN=/opt/bin
LOG=/opt/var/log/castget.log
PC_HOME_DL="/mnt/storage/music/podcasts/downloads/"
DATE_TIME_DIR=`date +%Y_%m_%d_%H_%M`
PUB_PODCAST="/mnt/storage/public/podcasts/downloads/"
PUBLIC_OUT=$PUB_PODCAST/$DATE_TIME_DIR
TEMPLATE_GEN_SCRIPT="/opt/my_scripts/web_player/render_tmpl.py"


echo "-----------------------------------------------------------------" >> $LOG 
echo `date +%Y-%m-%d-%R\:`  "Begin..." >> $LOG

# first clean up podcasts dir: remove files that are 7 days older
# https://www.quora.com/What-is-the-difference-between-mtime-atime-and-ctime
$OPT_BIN/find $PC_HOME_DL -type f -mtime +7 -exec rm -rf {} \; >> $LOG 2>&1
$OPT_BIN/find $PC_HOME_DL -type d -mtime +7 -exec rm -rf {} \; >> $LOG 2>&1

# download files
castget -rv1 >> $LOG 2>&1

# clean up public podcast dir
$OPT_BIN/find $PUB_PODCAST -type d -mtime +7 -exec rm -rf {} \; >> $LOG 2>&1

# find the current 1 day files and system link them to out dir
mkdir $PUBLIC_OUT
echo "created out dir at: $PUBLIC_OUT" >> $LOG

# this touch needs to be full version of touch, not the busybox one
$OPT_BIN/touch -t `date +%m%d0000` $PC_HOME_DL/time
sleep 300

# make soft links to newly downloaded files
$OPT_BIN/find $PC_HOME_DL -type f -newer $PC_HOME_DL/time -exec ln -s {} $PUBLIC_OUT \; >> $LOG 2>&1

$OPT_BIN/touch $PUBLIC_OUT/finish_time

# Generate html template
python $TEMPLATE_GEN_SCRIPT >> $LOG

echo `date +%Y-%m-%d-%R\:` "Finished." >> $LOG

