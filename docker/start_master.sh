docker run -itd --restart=always --net=mcv --ip 192.168.12.20 --name hadoop-master --hostname hadoop-master kkhadoop:v1 /bin/bash

docker run -itd --restart=always --net=mcv --ip 192.168.12.21 --name hadoop-node1 --hostname hadoop-node1 kkhadoop:v1 /bin/bash


docker run -itd --restart=always --net=mcv --ip 192.168.12.22 --name hadoop-node2 --hostname hadoop-node2 kkhadoop:v1 /bin/bash

docker run -itd --restart=always --net=mcv --ip 192.168.12.23 --name hadoop-node3 --hostname hadoop-node3 kkhadoop:v1 /bin/bash

docker exec hadoop-master /bin/bash -c '/tmp/hosts.sh && /usr/sbin/sshd'
docker exec hadoop-node1 /bin/bash -c '/tmp/hosts.sh && /usr/sbin/sshd'
docker exec hadoop-node2 /bin/bash -c '/tmp/hosts.sh && /usr/sbin/sshd'
docker exec hadoop-node3 /bin/bash -c '/tmp/hosts.sh && /usr/sbin/sshd'

