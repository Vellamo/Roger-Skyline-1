#!/bin/bash
FILE=cronsum.md5
if [ ! -f cronsum.md5 ]; then
	echo "Cronsum.md5 was not yet initialised to test for changes. It has now been created." | sudo sendmail root
else
checkmd5=$(md5sum -c cronsum.md5 2>/dev/null)
	if [[ $checkmd5 == *"FAILED"* ]]; then
		echo "Cron has been modified since last call!" | sudo sendmail root
	fi
fi
md5sum /var/spool/cron/crontabs/root > cronsum.md5 &
