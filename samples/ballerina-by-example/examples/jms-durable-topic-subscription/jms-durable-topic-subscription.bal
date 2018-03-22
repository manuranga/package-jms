import ballerina.net.jms;

endpoint jms:ServiceEndpoint ep1 {
    initialContextFactory: "wso2mbInitialContextFactory",
    providerUrl: "amqp://admin:admin@carbon/carbon?brokerlist='tcp://localhost:5672'",
    connectionFactoryName: "TopicConnectionFactory",
    connectionFactoryType: "topic"
};

@jms:serviceConfig {
    destination: "MyTopic",
    subscriptionId: "mySub"
}
service<jms:Service> jmsService bind ep1 {

    onMessage (endpoint client, jms:JMSMessage message) {

        // Retrieve the string payload using native function.
        string stringPayload = m.getTextMessageContent();

        // Print the retrieved payload.
        println("Payload: " + stringPayload);
    }
}
