#!/usr/bin/env bash

set -e

ambari-agent start
tail -F /var/log/ambari-agent/ambari-agent.log

