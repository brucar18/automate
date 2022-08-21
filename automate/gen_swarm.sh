#!/bin/bash

cp agent.yaml swarm.yaml

echo "generate swarm yaml for agents"
token=$(docker swarm join-token -q worker)
IP=$(hostname -I | cut -d' ' -f1)

sed -i "s/changeme/docker swarm join --token ${token} ${IP}/g" swarm.yaml
