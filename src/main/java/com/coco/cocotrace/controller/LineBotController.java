package com.coco.cocotrace.controller;

import com.coco.cocotrace.CocotraceApplication;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.linecorp.bot.client.LineMessagingClient;
import com.linecorp.bot.model.PushMessage;
import com.linecorp.bot.model.event.Event;
import com.linecorp.bot.model.event.MessageEvent;
import com.linecorp.bot.model.event.message.TextMessageContent;
import com.linecorp.bot.model.message.TextMessage;
import com.linecorp.bot.model.message.Message;
import com.linecorp.bot.model.response.BotApiResponse;
import com.linecorp.bot.spring.boot.annotation.EventMapping;
import com.linecorp.bot.spring.boot.annotation.LineMessageHandler;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.concurrent.ExecutionException;

@RequestMapping(value = "/callback")
@LineMessageHandler
public class LineBotController {
    private final Logger log = LoggerFactory.getLogger(CocotraceApplication.class);

    @Value(value = "${spring.application.channel.token}")
    String token;

    @EventMapping
    public Message handleTextMessage(MessageEvent<TextMessageContent> e) {
        System.out.println("event: " + e);
        TextMessageContent message = e.getMessage();
        return new TextMessage(message.getText());
    }

    @EventMapping
    public Message handleTextMessageEvent(MessageEvent<TextMessageContent> event) {
        log.info("event: " + event);
        final String originalMessageText = event.getMessage().getText();
        return new TextMessage(originalMessageText);
    }

    @EventMapping
    public void handleDefaultMessageEvent(Event event) {
        System.out.println("event: " + event);
    }

    @CrossOrigin
    @PostMapping(value = "/pushMessage")
    public void pushMessage(@RequestHeader(value = "X-Custom-Header", required = false) String userId, @RequestBody String requestStr) {

        final String CHANNEL_TOKEN = System.getenv().get("CHANNEL_TOKEN");
        ObjectMapper mapper = new ObjectMapper().configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
        ModelMap map = new ModelMap();
        try {
            map = mapper.readValue(requestStr, ModelMap.class);
        } catch (Exception e) {
            System.out.println(e);
        }
        String data = map.getAttribute("data").toString();

        final LineMessagingClient client = LineMessagingClient
                .builder(CHANNEL_TOKEN != null ? CHANNEL_TOKEN : token) // TODO Add token on environment variables
                .build();

        final TextMessage textMessage = new TextMessage(data);
        final PushMessage pushMessage = new PushMessage(
                userId,
                textMessage);


        final BotApiResponse botApiResponse;
        try {
            botApiResponse = client.pushMessage(pushMessage).get();
        } catch (InterruptedException | ExecutionException e) {
            e.printStackTrace();
            return;
        }

        System.out.println(botApiResponse);
    }
}
