# Tutorial 6
Implementation of tutorial 5: https://www.rabbitmq.com/tutorials/tutorial-six-go.html, with Docker.

### Additional Info
I used swarm for simplicity, since the objective of this tutorial is to have some workers that consume jobs from one queue. Here, we create workers as different services, so we are able to pass different arguments to the bindings. 

You may have to wait a few seconds before it works properly.

***

## Running the Containers

#### Make sure you have a node and swarm initialized
```
docker swarm init
```

#### Run 
```
docker build -t client --no-cache ./client
docker build -t server --no-cache ./server
docker-compose build && docker stack deploy --compose-file=docker-compose.yml rmq06
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

#### For Debugging purposes, seeing the services and their logs may help:
```
docker service ls
```

***

```
docker service logs <service_id>
```

#### Cleanup
```
docker stack rm rmq06
```