#!/bin/bash
if [[ "$SCHEDULE" == "ON" ]]; then
if [[ "$TIME" == "" ]]; then
echo "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin" >> /etc/cron.d/cdl-autorun
echo "0 0 * * * root /cyberdrop-dl/silent_run.sh > /proc/1/fd/1 2>&1" >> /etc/cron.d/cdl-autorun
else
echo "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin" >> /etc/cron.d/cdl-autorun
echo "$TIME root /cyberdrop-dl/silent_run.sh > /proc/1/fd/1 2>&1" >> /etc/cron.d/cdl-autorun
fi
chmod 777 /cyberdrop-dl/silent_run.sh
cron
fi
if [[ "$SETUP" == "YES" ]]; then
cd /cyberdrop-dl
cyberdrop-dl
exit
fi
exec /bin/bash
