#!/usr/bin/env bash
echo 'TRANSIIIME DOCKER: Update travel times : '+$1+'==>'+$2+'.'
# This is to substitute into config file the env values. 
find /usr/local/transitime/config/ -type f -exec sed -i s#"POSTGRES_PORT_5432_TCP_ADDR"#"$POSTGRES_PORT_5432_TCP_ADDR"#g {} \;
find /usr/local/transitime/config/ -type f -exec sed -i s#"POSTGRES_PORT_5432_TCP_PORT"#"$POSTGRES_PORT_5432_TCP_PORT"#g {} \;
find /usr/local/transitime/config/ -type f -exec sed -i s#"PGPASSWORD"#"$PGPASSWORD"#g {} \;
find /usr/local/transitime/config/ -type f -exec sed -i s#"AGENCYNAME"#"$AGENCYNAME"#g {} \;
find /usr/local/transitime/config/ -type f -exec sed -i s#"GTFSRTVEHICLEPOSITIONS"#"$GTFSRTVEHICLEPOSITIONS"#g {} \;

java -Xmx2048m -Xss12m -Duser.timezone=EST -Dtransitime.configFiles=/usr/local/transitime/config/test/transiTimeConfig1.xml -Dtransitime.core.agencyId=$AGENCYID -Dtransitime.logging.dir=/usr/local/transitime/logs/ -jar $TRANSITIMECORE/transitime/target/UpdateTravelTimes.jar $1 $2
