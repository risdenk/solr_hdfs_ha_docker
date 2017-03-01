# Solr HDFS HA Docker

## Overview
SOLR-10215 found that the HDFS HA support for Solr 6.4.0 and 6.4.1 was broken. This repository has tools can help test Solr against HDFS.

### Features
* Ambari 2.4.2
* HDP 2.5
* Blueprints (HDFS HA)

## Getting Started
1. `docker-compose pull`
2. `docker-compose build --pull`
3. `./run.sh`

## Testing Solr Versions
```bash
docker-compose exec --user=solr solr1 bash
export JAVA_HOME=/usr/jdk64/jdk1.8.0_77
cd /opt/solr
```

### Solr 6.3.0 - Works
```bash
wget -nc -O solr-6.3.0.tgz http://archive.apache.org/dist/lucene/solr/6.3.0/solr-6.3.0.tgz
tar zxvf solr-6.3.0.tgz
cd /opt/solr/solr-6.3.0/
HADOOP_USER_NAME=hdfs hdfs dfs -mkdir -p /apps/solr630
HADOOP_USER_NAME=hdfs hdfs dfs -chown solr /apps/solr630
./bin/solr start -c -z zk1 -a "-Dsolr.directoryFactory=HdfsDirectoryFactory -Dsolr.lock.type=hdfs -Dsolr.hdfs.home=$(hdfs getconf -confKey fs.defaultFS)/apps/solr630 -Dsolr.hdfs.confdir=/etc/hadoop/conf"
./bin/solr create -c solr630
./bin/solr delete -c solr630 || true
./bin/solr stop -all
HADOOP_USER_NAME=hdfs hdfs dfs -rm -r -f /apps/solr630
cd /opt/solr
rm -rf /opt/solr/solr-6.3.0/
```

### Solr 6.4.0 and 6.4.1 - Doesn't Work
```bash
wget -nc -O solr-6.4.1.tgz http://apache.mirrors.lucidnetworks.net/lucene/solr/6.4.1/solr-6.4.1.tgz
tar zxvf solr-6.4.1.tgz
cd /opt/solr/solr-6.4.1/
HADOOP_USER_NAME=hdfs hdfs dfs -mkdir -p /apps/solr641
HADOOP_USER_NAME=hdfs hdfs dfs -chown solr /apps/solr641
./bin/solr zk mkroot /solr641 -z zk1
./bin/solr start -c -z zk1/solr641 -a "-Dsolr.directoryFactory=HdfsDirectoryFactory -Dsolr.lock.type=hdfs -Dsolr.hdfs.home=$(hdfs getconf -confKey fs.defaultFS)/apps/solr641 -Dsolr.hdfs.confdir=/etc/hadoop/conf"
./bin/solr create -c solr641
./bin/solr delete -c solr641 || true
./bin/solr stop -all
./bin/solr zk rm -r /solr641 -z zk1
HADOOP_USER_NAME=hdfs hdfs dfs -rm -r -f /apps/solr641
cd /opt/solr
rm -rf /opt/solr/solr-6.4.1/
```

### Solr 6.5.0-254 - Works
```bash
wget -nc -O solr-6.5.0-254.tgz https://builds.apache.org/job/Solr-Artifacts-6.x/lastStableBuild/artifact/solr/package/solr-6.5.0-254.tgz
tar zxvf solr-6.5.0-254.tgz
cd /opt/solr/solr-6.5.0-254/
HADOOP_USER_NAME=hdfs hdfs dfs -mkdir -p /apps/solr650
HADOOP_USER_NAME=hdfs hdfs dfs -chown solr /apps/solr650
./bin/solr zk mkroot /solr650 -z zk1
./bin/solr start -c -z zk1/solr650 -a "-Dsolr.directoryFactory=HdfsDirectoryFactory -Dsolr.lock.type=hdfs -Dsolr.hdfs.home=$(hdfs getconf -confKey fs.defaultFS)/apps/solr650 -Dsolr.hdfs.confdir=/etc/hadoop/conf"
./bin/solr create -c solr650
./bin/solr delete -c solr650 || true
./bin/solr stop -all
./bin/solr zk rm -r /solr650 -z zk1
HADOOP_USER_NAME=hdfs hdfs dfs -rm -r -f /apps/solr650
cd /opt/solr
rm -rf /opt/solr/solr-6.5.0-254/
```

