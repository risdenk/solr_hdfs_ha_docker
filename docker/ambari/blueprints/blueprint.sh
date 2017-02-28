#!/usr/bin/env bash

set -e

curl -i -uadmin:admin -H 'X-Requested-By: ambari' -X POST http://localhost:8080/api/v1/blueprints/hdfs_ha -d @blueprint.json

curl -i -uadmin:admin -H 'X-Requested-By: ambari' -X PUT http://localhost:8080/api/v1/stacks/HDP/versions/2.5/operating_systems/redhat7/repositories/HDP-2.5 -d '{"Repositories":{"base_url":"http://localrepo/HDP/centos7/","verify_base_url":true}}'
curl -i -uadmin:admin -H 'X-Requested-By: ambari' -X PUT http://localhost:8080/api/v1/stacks/HDP/versions/2.5/operating_systems/redhat7/repositories/HDP-UTILS-1.1.0.21 -d '{"Repositories":{"base_url":"http://localrepo/HDP-UTILS-1.1.0.21/repos/centos7/","verify_base_url":true}}'

curl -i -uadmin:admin -H 'X-Requested-By: ambari' -X POST http://localhost:8080/api/v1/clusters/hdfs_ha -d @node-mapping.json

