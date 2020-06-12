# Tutorial 2
Implementation of tutorial 3: https://www.rabbitmq.com/tutorials/tutorial-three-go.html, with Docker.

### Additional Info
I used swarm for simplicity, since the objective of this tutorial is to have 5 workers that consume messages that come from one exchange. Each one has its own queue

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
docker-compose build && docker stack deploy --compose-file=docker-compose.yml rmq02
```

#### Or
```
./local-deploy.sh
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
docker stack rm rmq02
```