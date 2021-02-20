#!/usr/bin/env bash
echo 'THETRANSITCLOCK DOCKER: Create Tables'

java -cp /usr/local/transitclock/Core.jar ${TCPROJECT}.applications.SchemaGenerator -p ${TCPROJECT}.db.structs -o /usr/local/transitclock/db
java -cp /usr/local/transitclock/Core.jar ${TCPROJECT}.applications.SchemaGenerator -p ${TCPROJECT}.db.webstructs -o /usr/local/transitclock/db

createdb -h "$DBHOST" -p "$DBPORT" -U postgres $AGENCYNAME
psql \
	-h "$DBHOST" \
	-p "$DBPORT" \
	-U postgres \
	-d $AGENCYNAME \
	-f /usr/local/transitclock/db/ddl_postgres_*_db_structs.sql
psql \
	-h "$DBHOST" \
	-p "$DBPORT" \
	-U postgres \
	-d $AGENCYNAME \
	-f /usr/local/transitclock/db/ddl_postgres_*_db_webstructs.sql
