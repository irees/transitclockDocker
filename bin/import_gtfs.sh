#!/usr/bin/env bash
echo 'THETRANSITCLOCK DOCKER: Import GTFS file.'
java -Xmx4g -Dtransitclock.core.agencyId=$AGENCYID -Dtransitclock.configFiles=/usr/local/transitclock/config/transitclock.properties -Dtransitclock.logging.dir=/usr/local/transitclock/logs/ -Dlogback.configurationFile=$TRANSITCLOCK_CORE/transitclock/src/main/resouces/logbackGtfs.xml -cp /usr/local/transitclock/Core.jar ${TCPROJECT}.applications.GtfsFileProcessor -gtfsUrl $GTFS_URL  -maxTravelTimeSegmentLength 100

psql \
	-h "$DBHOST" \
	-p "$DBPORT" \
	-U postgres \
	-d $AGENCYNAME \
	-c "update activerevisions set configrev=0 where configrev = -1; update activerevisions set traveltimesrev=0 where traveltimesrev = -1;"
