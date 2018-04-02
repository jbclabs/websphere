#! /bin/sh
# jbc labs generic websphere build script


#Log everything in /src/build.log
logfile=/tmp/build.log
exec > $logfile 2>&1
set -x

#check inside code artifact for /code/tomcat-conf/server.xml and use it if exists
if [ -e /code/websphere-conf/server.xml ]
then
 cp -f /code/websphere-conf/server.xml /config/
else
 #if non of the above, default config file inside the image will be used
 echo "Could not find /code/websphere-conf/server.xml, going to use the default server.xml"
fi

#Clean up potential leftovers
rm -rf /config/dropins/*

#Check for *.war files and throw error if not present
if ls /code/*.war 1> /dev/null 2>&1
then
 cp -rf /code/*.war /config/dropins
else
 echo "ERROR! did not find any *.war file"
 exit 1
fi

#Cleaning up after ourselves
rm -rf /code
#rm -rf /conf
