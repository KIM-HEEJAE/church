package com.church.homepage.handler;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.church.homepage.dto.ChatDTO;
import com.church.homepage.dto.MemberDTO;
import com.church.homepage.mapper.ChatMapper;

@Component
public class ChatHandler extends TextWebSocketHandler {

    @Autowired
    private ChatMapper chatMapper; // DB 접근용
    public ChatHandler(ChatMapper chatMapper) {
        this.chatMapper = chatMapper;
    }
    private static List<WebSocketSession> sessionList = new ArrayList<>();

    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        MemberDTO member = (MemberDTO) session.getAttributes().get("member");
        
        // 세션에서 바로 직책을 꺼냅니다.
        String position = (member != null) ? member.getPosition() : "일반"; 
        String userName = (member != null) ? member.getUser_name() : "익명";
        String msg = message.getPayload();
        
        // DB 저장 (position도 같이 저장하세요)
        ChatDTO chat = new ChatDTO();
        chat.setUser_name(userName);
        chat.setMessage(msg);
        chat.setPosition(position); // DTO에 추가 필요
        chatMapper.insertMessage(chat); 
        
        // 전송 (브라우저로 [직책]이름: 메시지 형태 전송)
        String fullMessage = "[" + position + "] " + userName + ": " + msg;
        for (WebSocketSession sess : sessionList) {
            sess.sendMessage(new TextMessage(fullMessage));
            System.out.println("sss"+fullMessage);
        }
    }
}