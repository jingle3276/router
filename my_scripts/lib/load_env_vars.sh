# This script will be loaded in after the USB drive mounted from webui

SCRIPT_HOME=/opt/my_scripts
LOG_HOME=/opt/var/log
UFS3T=/tmp/mnt/ufs3t

export SCRIPT_HOME
export LOG_HOME
export UFS3T

logger "Loaded root user environment variables"

