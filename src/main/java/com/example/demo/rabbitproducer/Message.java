/*
 * Copyright (C) 2024
 *
 * https://github.com/michaellihs/spring-rabbitmq/blob/master/src/main/java/ch/lihsmi/rabbitproducer/Message.java
 */
package com.example.demo.rabbitproducer;

public class Message {

    private String messageType;

    private String messageBody;

    /**
     * The dummy constructor is necessary to map JSON data from the POST method
     * see
     * http://stackoverflow.com/questions/7625783/jsonmappingexception-no-suitable-constructor-found-for-type-simple-type-class
     */
    public Message() {
    }

    public Message(String message) {
        this("simples", message);
    }

    public Message(String messageType, String messageBody) {
        this.messageType = messageType;
        this.messageBody = messageBody;
    }

    public String getMessageType() {
        return messageType;
    }

    public void setMessageType(String messageType) {
        this.messageType = messageType;
    }

    public String getMessageBody() {
        return messageBody;
    }

    public void setMessageBody(String messageBody) {
        this.messageBody = messageBody;
    }
}
