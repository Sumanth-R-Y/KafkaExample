#!/bin/bash

echo "Bringing up kafka and zookeeper on docker"
echo "-----------------------------------------"
echo "-----------------------------------------"
docker ps -a 
echo "-----------------------------------------"
echo "-----------------------------------------"

docker-compose up -d
echo "-----------------------------------------"
echo "-----------------------------------------"
docker image ls -a 
echo "-----------------------------------------"
echo "-----------------------------------------"
docker container ls -a
echo "-----------------------------------------"
echo "-----------------------------------------"

sleep 10
# brokerA, brokerB, zookeeperA, zookeeperB containers
# create two topics
docker exec -it brokerA /bin/kafka-topics --zookeeper zookeeperA:2181 --create --topic TestTopic1 --partitions 3 --replication-factor 1
echo "-----------------------------------------"
echo "-----------------------------------------"
docker exec -it brokerB /bin/kafka-topics --zookeeper zookeeperB:2181 --create --topic TestTopic2 --partitions 3 --replication-factor 1
echo "-----------------------------------------"
echo "-----------------------------------------"
docker exec -it brokerB /bin/kafka-topics --zookeeper zookeeperB:2181 --list
echo "-----------------------------------------"
echo "-----------------------------------------"
docker exec -it brokerA /bin/kafka-topics --zookeeper zookeeperA:2181 --list

echo "-------------ENDED-----------------------"