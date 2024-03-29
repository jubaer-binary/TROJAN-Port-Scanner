#!/bin/bash
#Colors
RED=$(echo -en '\001\033[00;31m\002')
GREEN=$(echo -en '\001\033[00;32m\002')
WHITE=$(echo -en '\001\033[01;37m\002')

echo "${WHITE}
 _______         _                ______                      ______
(_______)       (_)              (_____ \             _      / _____)
    _  ____ ___  _ _____ ____     _____) ___   ____ _| |_   ( (____   ____ _____ ____  ____  _____  ____
   | |/ ___/ _ \| (____ |  _ \   |  ____/ _ \ / ___(_   _)   \____ \ / ___(____ |  _ \|  _ \| ___ |/ ___)
   | | |  | |_| | / ___ | | | |  | |   | |_| | |     | |_    _____) ( (___/ ___ | | | | | | | ____| |
   |_|_|   \____| \_____|_| |_|  |_|    \___/|_|      \__)  (______/ \____\_____|_| |_|_| |_|_____|_|
              (__/

${GREEN}Trojan Port Scanner Basically Tries To Detect All The Ports Which Could Have Been Opened By The Trojan To Establish Connection.
Victim Can Run This Tool To Check If Any Unusual Port Is Getting Used By Any Malicious Software. Also We Have Added Details For Each
Port So You Can Even Assume Which Trojan Is In Your System And Verify It's Existence.

${RED} Press Ctrl + C to skip between the domains

By Jubaer Alnazi
Enter IP/Domain File Location-"
read location
input="$location"
while IFS= read -r line
do
domains=$line
echo "...................................................................."
paste Data.txt | (
while read col1 col2 ; do

echo "${WHITE}Domain: ${GREEN}$domains ${RED}Port:${col1} ${WHITE}Known Trojans:${col2}"

NMAP=$(nmap -p ${col1} $domains | if GREP_COLORS='mt=01;32' egrep --color=always 'open|\closed'
then
echo "${GREEN}PORT FOUND!"
else
echo "${RED}PORT DOES NOT EXIST"
fi)
echo "$NMAP"
echo "...................................................................."

done
)
done < "$input"
