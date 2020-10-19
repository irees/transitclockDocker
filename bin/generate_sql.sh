#!/usr/bin/env bash

echo 'THETRANSITCLOCK DOCKER: Generate SQL to create tables.'

java -cp /usr/local/transitclock/Core.jar ${TCPROJECT}.applications.SchemaGenerator -p ${TCPROJECT}.db.structs -o /usr/local/transitclock/db
java -cp /usr/local/transitclock/Core.jar ${TCPROJECT}.applications.SchemaGenerator -p ${TCPROJECT}.db.webstructs -o /usr/local/transitclock/db
