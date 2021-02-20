#!/usr/bin/env bash
echo 'THETRANSITCLOCK DOCKER: Create WebAgency.'
java -Dtransitclock.db.dbName=$AGENCYNAME -Dtransitclock.hibernate.configFile=/usr/local/transitclock/config/hibernate.cfg.xml -Dtransitclock.db.dbHost=$DBHOST:$DBPORT -Dtransitclock.db.dbUserName=postgres -Dtransitclock.db.dbPassword=$PGPASSWORD -Dtransitclock.db.dbType=postgresql -cp /usr/local/transitclock/Core.jar ${TCPROJECT}.db.webstructs.WebAgency $AGENCYID 127.0.0.1 $AGENCYNAME postgresql $DBHOST postgres $PGPASSWORD
