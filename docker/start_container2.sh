echo "hadoop-master"
docker run -itd --restart=always \--net spark \--ip 172.16.0.2 \--privileged \-p 18032:8032 \-p 28080:18080 \-p 29888:19888 \-p 17077:7077 \-p 51070:50070 \-p 18888:8888 \-p 19000:9000 \-p 11100:11000 \-p 51030:50030 \-p 18050:8050 \-p 18081:8081 \-p 18900:8900 \-p 12222:22 \--name hadoop-maste \--hostname hadoop-master \--add-host hadoop-node1:172.16.0.3 \--add-host hadoop-node2:172.16.0.4 kkhadoop:v1 #/bin/bash
echo "hadoop-node1"
docker run -itd --restart=always \--net spark \--ip 172.16.0.3 \--privileged \-p 18042:8042 \-p 51010:50010 \-p 51020:50020 \-p 12223:22 \--name hadoop-node1 \--hostname hadoop-node1 \--add-host hadoop-maste:172.16.0.2 \--add-host hadoop-node2:172.16.0.4 kkhadoop:v1 #/bin/bash
echo "hadoop-node2"
docker run -itd --restart=always \--net spark \--ip 172.16.0.4 \--privileged \-p 18043:8043 \-p 51011:50011 \-p 51021:50021 \-p 12224:22 \--name hadoop-node2 \--hostname hadoop-node2 \--add-host hadoop-maste:172.16.0.2 \--add-host hadoop-node1:172.16.0.3 kkhadoop:v1 #/bin/bash
