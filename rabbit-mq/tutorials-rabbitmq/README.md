# Experiments with Tutorials

## Following the RabbitMQ tutorials 1-7 in Golang:

### 01-07:
- https://www.rabbitmq.com/tutorials/tutorial-one-go.html
- https://www.rabbitmq.com/tutorials/tutorial-two-go.html
- https://www.rabbitmq.com/tutorials/tutorial-three-go.html
- https://www.rabbitmq.com/tutorials/tutorial-four-go.html
- https://www.rabbitmq.com/tutorials/tutorial-five-go.html
- https://www.rabbitmq.com/tutorials/tutorial-six-go.html
- https://www.rabbitmq.com/tutorials/tutorial-seven-go.html

## Notes from these tutorials:
### 01: Introduction
### 02: Simple Work Queue
ref: https://www.rabbitmq.com/tutorials/tutorial-two-go.html
#### Rabbit supports message acknowledgement
An ack, when sent back by the consumer, tells the sender that the message has been received. This can be achieved by setting the parameter <i>auto-ack</i> to <i>false</i> and then sending the ack with <i>d.Ack(false)</i> when done. 
Warning: missing the ack, messages will be redelivered and eat memory continuously, even when your client quits.
#### Message durability
By setting the queue's parameter <i>durable</i> to <i>true</i> (this makes queues survive a RabbitMQ node restart) and setting the messages <i>DeliveryMode</i> to amqp.Persistent, makes the messages sent to be persistent (saves it to disk).
Warning: it doesn't guarantee they will not be lost. There can be a time window when the queue has accepted a message and hasn't saved it yet.
#### Fair Dispatch
RabbitMQ by default doesn't look at the number of unacked messages sent to a consumer. It just sends the ith message to the ith consumer. By setting <i>prefetch count</i> to <i>1</i>,  RabbitMQ will not give another message to a worker that hasn't sent an ack for the previous job. The tutorial suggests to see the following links before considering putting RabbitMQ to production:
- https://www.rabbitmq.com/confirms.html
- https://www.rabbitmq.com/production-checklist.html
- https://www.rabbitmq.com/monitoring.html
- https://www.rabbitmq.com/documentation.html

### 03: How to deliver the same message to many consumers
ref: https://www.rabbitmq.com/tutorials/tutorial-three-go.html
#### Use <i>exclusive</i> to make unique queues.
#### The exchange types available are: direct, topic, headers and fanout. Fanout, for example, sends the same message to all who subscribe.

### 04: How to listen for a subset of messages
ref: https://www.rabbitmq.com/tutorials/tutorial-four-go.htmls
#### We can specify through bindings which messages goes to which queues. This is done with the routing key. 

### 05: How to listen for messages based on a pattern
ref: https://www.rabbitmq.com/tutorials/tutorial-four-go.htmls
#### Direct can't do routing basing on multiple criteria
#### Attribute <i>routing key</i> must be a list of words, delimited by dots, when sent to a topic exchange. "*" can represent exactly one word. "#" can represent zero or more words. 
#### 

### 06: How to do a round trip message as a remote procedure call