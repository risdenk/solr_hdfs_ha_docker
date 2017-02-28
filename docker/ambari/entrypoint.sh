#!/usr/bin/env bash

set -e

ambari-server setup --database=postgres --databasehost=postgres --databaseport=5432 --databasename=ambari --postgresschema=ambari --databaseusername=ambari --databasepassword=ambari -s
ambari-server start
tail -F /var/log/ambari-server/ambari-server.log

