#!/bin/bash
# Copyright (c) 2018 fithwum
# All rights reserved

# Variables.
echo " "
echo "Checking for latest Minecraft server version."
MC_VERSION=1.16.1
CHANGELOG=/MCserver/minecraft_server_${MC_VERSION}.jar
echo "Installed server version is:$MC_VERSION"

# Main install (debian).
# Check for files in /ts3server and download/create if needed.
if [ -e "${CHANGELOG}" ]
	then
		echo "INFO ! minecraft server found starting server."
	else
		echo " "
		echo "WARNING ! minecraft server not found/outdated downloading new copy."
			echo " "
			echo "INFO ! Checking old files."
			rm -f /MCserver/minecraft_server_*
			wget --no-cache https://launcher.mojang.com/v1/objects/a412fd69db1f81db3f511c1463fd304675244077/server.jar -O /MCserver/minecraft_server_${MC_VERSION}.jar
			wget --no-cache https://raw.githubusercontent.com/fithwum/minecraft/master/files/run.sh -O /MCserver/run.sh
			sleep 1
fi

sleep 1

# Set permissions.
chown 99:100 -R /MCserver
chmod 777 -R /MCserver
chmod +x /MCserver/run.sh
chmod +x /MCserver/minecraft_server_${MC_VERSION}.jar

# Run teamspeak server.
echo " "
echo "INFO ! Starting Minecraft server ${MC_VERSION}"
exec /MCserver/run.sh

exit
