#!/bin/bash
sudo docker run -d \
-e MYID=1 \
-e JMXPORT=8989 \
-e JMXSSL=false \
-e JMXAUTH=false -e JMXLOG4J=true  \
-e SERVERS=172.19.0.21,172.19.0.22,172.19.0.23 \
-e ZOODATADIR=/var/zookeeper/data \
-e ZOODATALOGDIR=/var/zookeeper/log \
-v /home/ryan/data/dockerHub/zk-data/log:/var/zookeeper/log \
-v /home/ryan/data/dockerHub/zk-data/data:/var/zookeeper/data \
--name=MyZookeeper1  --net shadownet --ip 172.19.0.21  rainbow954/docker-zk 

sudo docker run -d \
-e MYID=2 \
-e JMXPORT=8989 \
-e JMXSSL=false \
-e JMXAUTH=false -e JMXLOG4J=true  \
-e SERVERS=172.19.0.21,172.19.0.22,172.19.0.23 \
--name=MyZookeeper2  --net shadownet --ip 172.19.0.22  --restart=always rainbow954/docker-zk 

sudo docker run -d \
-e MYID=3 \
-e JMXPORT=8989 \
-e JMXSSL=false \
-e JMXAUTH=false -e JMXLOG4J=true  \
-e SERVERS=172.19.0.21,172.19.0.22,172.19.0.23 \
--name=MyZookeeper3  --net shadownet --ip 172.19.0.23  --restart=always rainbow954/docker-zk 