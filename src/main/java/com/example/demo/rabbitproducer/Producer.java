/*
 * Copyright (C) 2024
 *
 * https://github.com/michaellihs/spring-rabbitmq/blob/master/src/main/java/ch/lihsmi/rabbitproducer/Producer.java
 */
package com.example.demo.rabbitproducer;

import com.example.demo.config.GlobalConfig;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class Producer {

    public final static String ROUTING_KEY = "device-sample";

    @Autowired
    RabbitTemplate rabbitTemplate;

    public void send(String message) throws Exception {
        send(new Message(message));
    }

    public void send(Message message) throws Exception {
        System.out.println("Sending message...");
        rabbitTemplate.convertAndSend(GlobalConfig.DISTRIBUTION_EXCHANGE,
                message.getMessageType(),
                message.getMessageBody());
    }
}
