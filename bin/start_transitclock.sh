#!/usr/bin/env bash
echo 'THETRANSITCLOCK DOCKER: Start TheTransitClock.'
rmiregistry &

#set the API as an environment variable so we can set in JSP of template/includes.jsp in the transitime webapp
export APIKEY=$(get_api_key.sh)

# make it so we can also access as a system property in the JSP
export JAVA_OPTS="$JAVA_OPTS -Dtransitclock.apikey=$(get_api_key.sh)"

export JAVA_OPTS="$JAVA_OPTS -Dtransitclock.configFiles=/usr/local/transitclock/config/transitclock.properties"

echo JAVA_OPTS $JAVA_OPTS

/usr/local/tomcat/bin/startup.sh

java -Xss12m -Xms16g -Xmx32g -Duser.timezone=EST -Dtransitclock.configFiles=/usr/local/transitclock/config/transitclock.properties -Dtransitclock.core.agencyId=$AGENCYID -Dtransitclock.logging.dir=/usr/local/transitclock/logs/ -jar /usr/local/transitclock/Core.jar > /usr/local/transitclock/logs/output.txt &

tail -f /dev/null
