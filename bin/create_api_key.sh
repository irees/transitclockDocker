#!/usr/bin/env bash
echo 'THETRANSITCLOCK DOCKER: Create API key.'
java -cp /usr/local/transitclock/Core.jar ${TCPROJECT}.applications.CreateAPIKey -c "/usr/local/transitclock/config/transitclock.properties" -d "foo" -e "og.crudden@gmail.com" -n "Sean Og Crudden" -p "123456" -u "http://www.transitclock.org"
