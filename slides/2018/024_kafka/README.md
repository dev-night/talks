# #024 /dev/night - Kafka :: how deep does the rabbit hole go?

By: [Stefan](https://twitter.com/stesie23)

* Talk-related repository: https://github.com/stesie/kafka-talk-en
* rendered slides: https://stesie.github.io/kafka-talk-en/

* simple producer written in Python: https://github.com/stesie/kafka-talk-en/blob/master/examples/python_producer.py
* the same with spring-kafka in Java: https://github.com/stesie/kafka-talk-en/tree/master/examples/simpleproducer

### Kafka Streams

* example of a stateless processor: https://github.com/stesie/kafka-talk-en/tree/master/streams-demo/stateless-processor
* ... [the actual stream definition is here](https://github.com/stesie/kafka-talk-en/blob/master/streams-demo/stateless-processor/src/main/java/de/brokenpipe/kafkatalk/streamsdemo/logparser/StreamDefinition.java)
* example of a stateful processor: https://github.com/stesie/kafka-talk-en/tree/master/streams-demo/stateful-processor
* ... [the actual stream definition is here](https://github.com/stesie/kafka-talk-en/blob/master/streams-demo/stateful-processor/src/main/java/de/brokenpipe/kafkatalk/streamsdemo/bytessentaggregator/StreamDefinition.java)
