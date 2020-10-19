#!/usr/bin/env bash
echo 'THETRANSITCLOCK DOCKER: Import test AVL.'

psql \
	-h "$DBHOST" \
	-p "$DBPORT" \
	-U postgres \
	-d $AGENCYNAME \
	-c "\COPY avlreports FROM '/usr/local/transitclock/data/avl.csv';"
