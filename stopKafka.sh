#!/bin/bash
echo -e "Removing the kafka topics"
docker exec -it brokerA /bin/kafka-topics --zookeeper zookeeperA:2181 --list
docker exec -it brokerA /bin/kafka-topics --zookeeper zookeeperA:2181 --delete --topic TestTopic1 
docker exec -it brokerA /bin/kafka-topics --zookeeper zookeeperA:2181 --delete --topic TestTopic2

echo -e "Stopping the kafka and zookeeper"
docker-compose stop 
sleep 5

echo -e "Remove the Docker containers and images"
docker container rm -f brokerA
docker container rm -f brokerB
docker container rm -f zookeeperA
docker container rm -f zookeeperB

docker volume prune -f


#docker image rm -f confluentinc/cp-zookeeper:6.2.0
#docker image rm -f confluentinc/cp-kafka:6.2.0