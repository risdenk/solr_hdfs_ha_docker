FROM centos:7

RUN yum install -y wget

RUN wget -nv http://public-repo-1.hortonworks.com/ambari/centos7/2.x/updates/2.4.2.0/ambari.repo -O /etc/yum.repos.d/ambari.repo && yum repolist && yum install -y ambari-agent

RUN sed -i'' -e 's/localhost/ambari/' /etc/ambari-agent/conf/ambari-agent.ini

RUN yum -y install lsof && useradd solr && mkdir /opt/solr && chown solr /opt/solr

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

