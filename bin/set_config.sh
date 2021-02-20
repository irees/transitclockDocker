#!/usr/bin/env bash
echo 'THETRANSITCLOCK DOCKER: Set Config.'

find /usr/local/transitclock/config/ -type f -exec sed -i s#"DBHOST"#"$DBHOST"#g {} \;
find /usr/local/transitclock/config/ -type f -exec sed -i s#"DBPORT"#"$DBPORT"#g {} \;
find /usr/local/transitclock/config/ -type f -exec sed -i s#"PGPASSWORD"#"$PGPASSWORD"#g {} \;
find /usr/local/transitclock/config/ -type f -exec sed -i s#"AGENCYNAME"#"$AGENCYNAME"#g {} \;
find /usr/local/transitclock/config/ -type f -exec sed -i s#"GTFSRTVEHICLEPOSITIONS"#"$GTFSRTVEHICLEPOSITIONS"#g {} \;
find /usr/local/transitclock/config/ -type f -exec sed -i s#"DBTYPE"#"$DBTYPE"#g {} \;
find /usr/local/transitclock/config/ -type f -exec sed -i s#"TCPROJECT"#"$TCPROJECT"#g {} \;
