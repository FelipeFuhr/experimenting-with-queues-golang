# Tutorial 2
Implementation of tutorial 2: https://www.rabbitmq.com/tutorials/tutorial-two-go.html, with Docker.

### Additional Info
I used swarm for simplicity, since the objective of this tutorial is to have 2 workers that consume jobs from one queue.

***

## Running the Containers

#### Make sure you have a node and swarm initialized
```
docker swarm init
```

#### Run 
```
docker build -t receiver --no-cache ./receive
docker build -t sender --no-cache ./send
docker-compose build && docker stack deploy --compose-file=docker-compose.yml rmq03
```

#### Or
```
./local-deploy.sh
```

#### See if the replicas are ok
- See if the service replicas are running
```
docker service ls
```

#### Accessing and seeing the results
- See the ids attributed to your different containers
```
docker container ls
```

- As you see the different ids for the receiver processes, open 2 aditional terminals and run:
```
docker container logs <receiver_id> --follow
```

- You can see what the sender is sending by running:
```
docker container logs <sender_id> --follow
```

#### Cleanup
```
docker stack rm rmq03
```