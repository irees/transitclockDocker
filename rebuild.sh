TCDIR=$HOME/src/other/transitime
OUTDIR=${PWD}/target
(cd $TCDIR/transitime       && mvn install -DskipTests -Dmaven.javadoc.skip=true && cp target/transitimeCore-*-Core.jar ${OUTDIR}/Core.jar)
(cd $TCDIR/transitimeApi    && mvn install -DskipTests -Dmaven.javadoc.skip=true && cp target/api.war ${OUTDIR}/api.war)
(cd $TCDIR/transitimeWebapp && mvn install -DskipTests -Dmaven.javadoc.skip=true && cp target/web.war ${OUTDIR}/web.war)
