#! /bin/sh
# jbc labs generic tomcat entrypoint.sh

echo "Printing build log"
cat /tmp/build.log

exec /opt/ibm/docker/docker-server run defaultServer