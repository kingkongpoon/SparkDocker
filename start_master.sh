docker run -itd --restart=always --net=mcv --net docker-br0 --ip 172.172.0.100 -p 8080:8080 -v /root/tool/SparkDocker/docker/:/tmp/ --name hadoop-master --hostname hadoop-master kkspark:v1 /bin/bash

docker run -itd --restart=always --net=mcv --net docker-br0 --ip 172.172.0.101 -v /root/tool/SparkDocker/docker/:/tmp/ --name hadoop-node1 --hostname hadoop-node1 kkspark:v1 /bin/bash

docker run -itd --restart=always --net=mcv --net docker-br0 --ip 172.172.0.102 -v /root/tool/SparkDocker/docker/:/tmp/ --name hadoop-node2 --hostname hadoop-node2 kkspark:v1 /bin/bash

docker run -itd --restart=always --net=mcv --net docker-br0 --ip 172.172.0.103 -v /root/tool/SparkDocker/docker/:/tmp/ --name hadoop-node3 --hostname hadoop-node3 kkspark:v1 /bin/bash

docker exec hadoop-master /bin/bash -c '/tmp/hosts_slaves.sh && /usr/sbin/sshd'
docker exec hadoop-node1 /bin/bash -c '/tmp/hosts_slaves.sh && /usr/sbin/sshd'
docker exec hadoop-node2 /bin/bash -c '/tmp/hosts_slaves.sh && /usr/sbin/sshd'
docker exec hadoop-node3 /bin/bash -c '/tmp/hosts_slaves.sh && /usr/sbin/sshd'
