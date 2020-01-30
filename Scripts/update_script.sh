sudo apt-get update -y && sudo apt-get upgrade -y >> /var/log/update_script.log
echo "Update_Script was ran." | sudo sendmail root
