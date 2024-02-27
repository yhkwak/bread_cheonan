package com.bread.service.sms;

import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.service.DefaultMessageService;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

@Service
public class SmsService {
    private DefaultMessageService messageService;

    @Value("${coolsms.api-key}")
    private String apiKey;

    @Value("${coolsms.api-secret}")
    private String apiSecret;

    public SmsService() {
        this.messageService = new DefaultMessageService("NCSVZXCGPVMWFJVC", "AQWGIHXC6MKKRMI1RLXNE939DJASTLBA", "https://api.coolsms.co.kr");
    }

    public SingleMessageSentResponse sendSms(String to, String text) {
        Message message = new Message();
        message.setFrom("01021041216");
        message.setTo(to);
        message.setText(text);

        SingleMessageSendingRequest request = new SingleMessageSendingRequest(message);
        return this.messageService.sendOne(request);
    }
}