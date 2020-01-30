#!/bin/bash
echo -e "\033[1;37mWelcome to DebianHelper! How may I be of service?\033[0m"
echo ""
echo "(1) Display time since last boot."
echo "(2) Display current user."
echo ""
echo "(3) Display SSH state."
echo -e "\033[0;33m(4) Reboot SSH service."
echo -e "\033[0;31m(5) Kill SSH service.\033[0m"
echo "(6) Display PID of the SSHD service."
echo "(7) Display connections to the system."
echo ""
echo "(8) Display partition tables."
echo "(9) Display used storage space."
echo ""
echo "(10) Display ALL users."
echo "(11) Display 'real' users."
echo -e "\033[0;32m(12) Create new local user."
echo -e "\033[0;32m(13) Add user to sudo group.\033[0m"
echo -e "\033[0;31m(14) Kill (and delete) an ACTIVE user.\033[0m"
echo ""
echo "(15) Check running services."


read -e -p "Please enter your choice: " userinput

if [ -z "$userinput" ] ; then
	echo "Usage: DebianHelper.sh, <#>"
elif [ "$userinput" == "a number between 1-15" ] ; then
	echo "Why must you torment me this way??"
elif [[ -n ${userinput//[0-9]/} ]]; then
    echo "Please input a number between 1-15"
elif [ "$userinput" -ge 1 -a "$userinput" -le 15 ] ; then
	if [ "$userinput" == "1" ] ; then
		uptime
	elif [ "$userinput" == "2" ] ; then
		whoami
	elif [ "$userinput" == "3" ] ; then
		sudo service ssh status
	elif [ "$userinput" == "4" ] ; then
		sudo restart ssh
	elif [ "$userinput" == "5" ] ; then
		sudo service ssh stop
	elif [ "$userinput" == "6" ] ; then
		cat /var/run/sshd.pid
	elif [ "$userinput" == "7" ] ; then
		who
	elif [ "$userinput" == "8" ] ; then
		sudo fdisk -l
	elif [ "$userinput" == "9" ] ; then
		df -H
	elif [ "$userinput" == "10" ] ; then
		cut -d: -f1 /etc/passwd
	elif [ "$userinput" == "11" ] ; then
		getent passwd $(ls /home) | grep -o '^[^:]*'
	elif [ "$userinput" == "12" ] ; then
		read -p "Please provide a username to create: " newusr
		sudo adduser newusr
	elif [ "$userinput" == "13" ] ; then
		read -p "Please provide a username to add to the sudo group: " theusr
		sudo usermod -aG sudo $theusr
	elif [ "$userinput" == "14" ] ; then
		read -p "Please input the user's name: " killusr
		sudo pkill -KILL -u $killusr
		sudo userdel -r $killusr
	elif [ "$userinput" == "15" ] ; then
		sudo service --status-all
	fi
else
	clear
	echo "Seems you didn't heed the instructions! You were warned!"
	echo "Please enjoy this ASCII art, strange one:"
	sleep 2
	echo ""
echo ' /\_/\ ??'
echo '( o.o )'
echo ' > ^ <'
sleep 1
fi
