#!/bin/bash
docker run -d \
-e MYID=1 \
-e JMXPORT=8989 \
-e JMXSSL=false \
-e JMXAUTH=false -e JMXLOG4J=true  \
-e SERVERS=172.19.0.21,172.19.0.22,172.19.0.23 \
-e ZOODATADIR=/var/zookeeper/data \
-e ZOODATALOGDIR=/var/zookeeper/log \
-v /home/ryan/work/tools/docker/zk/zk_3.4.8/ubuntu/14.04/log:/var/zookeeper/log \
-v /home/ryan/work/tools/docker/zk/zk_3.4.8/ubuntu/14.04/data:/var/zookeeper/data \
--name=MyZookeeper1  --net shadownet --ip 172.19.0.21  --restart=always rainbow954/zk:v1 

docker run -d \
-e MYID=2 \
-e JMXPORT=8989 \
-e JMXSSL=false \
-e JMXAUTH=false -e JMXLOG4J=true  \
-e SERVERS=172.19.0.21,172.19.0.22,172.19.0.23 \
--name=MyZookeeper2  --net shadownet --ip 172.19.0.22  --restart=always rainbow954/zk:v1 

docker run -d \
-e MYID=3 \
-e JMXPORT=8989 \
-e JMXSSL=false \
-e JMXAUTH=false -e JMXLOG4J=true  \
-e SERVERS=172.19.0.21,172.19.0.22,172.19.0.23 \
--name=MyZookeeper3  --net shadownet --ip 172.19.0.23  --restart=always rainbow954/zk:v1 
