# http://tomatousb.org/forum/t-366101/starting-services-from-optware-at-startup
# This script will be auto-run during system boot time
# So.....lets just sleep until the sysup signal or we've been up for 5 minutess.
A=600
while [ $A -gt 0 ] && [ $(cut -f1 -d"." /proc/uptime) -lt 300 ]  ; do
A=$(( $A - 1 ))
if [ -f /var/notice/sysup ] ; then  break; fi
sleep 1
done

#load env variables 
source /opt/my_scripts/lib/load_env_vars.sh

# real work begin here
/opt/etc/init.d/S16sdidle start
/opt/etc/init.d/S80lighttpd start
/opt/etc/init.d/S90minidlna start

