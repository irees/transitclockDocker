#!/bin/sh
set -x
check_db_up.sh
create_tables.sh
import_gtfs.sh
create_api_key.sh
create_webagency.sh
# import_avl.sh
# process_avl.sh
