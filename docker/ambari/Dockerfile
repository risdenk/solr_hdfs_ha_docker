FROM centos:7

RUN yum install -y nmap-ncat wget

RUN wget -nv http://public-repo-1.hortonworks.com/ambari/centos7/2.x/updates/2.4.2.0/ambari.repo -O /etc/yum.repos.d/ambari.repo && yum repolist && yum install -y ambari-server

RUN wget -nv http://public-repo-1.hortonworks.com/ARTIFACTS/jdk-8u77-linux-x64.tar.gz -O /var/lib/ambari-server/resources/jdk-8u77-linux-x64.tar.gz
RUN wget -nv http://public-repo-1.hortonworks.com/ARTIFACTS/jce_policy-8.zip -O /var/lib/ambari-server/resources/jce_policy-8.zip

COPY blueprints/ /blueprints/

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

