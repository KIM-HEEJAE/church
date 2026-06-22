package com.church.homepage.handler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.church.homepage.dto.ChatDTO;
import com.church.homepage.dto.MemberDTO;
import com.church.homepage.mapper.ChatMapper;

import tools.jackson.databind.ObjectMapper;

@Component
public class ChatHandler extends TextWebSocketHandler {

	@Autowired
	private ChatMapper chatMapper; // DB 접근용
	private static List<WebSocketSession> sessionList = new ArrayList<>();
	private ObjectMapper objectMapper = new ObjectMapper();

	public ChatHandler(ChatMapper chatMapper) {
		this.chatMapper = chatMapper;
	}


	// 1. [추가] 연결되었을 때 리스트에 추가
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessionList.add(session);
		System.out.println("새로운 접속: " + session.getId());
	}

	// 2. [추가] 연결이 끊겼을 때 리스트에서 제거 (매우 중요!)
	@Override
	public void afterConnectionClosed(WebSocketSession session, org.springframework.web.socket.CloseStatus status)
			throws Exception {
		sessionList.remove(session);
		System.out.println("연결 종료: " + session.getId());
	}
	@Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        MemberDTO member = (MemberDTO) session.getAttributes().get("member");

        String position = (member != null && member.getPosition() != null) ? member.getPosition() : "일반";
        String userName = (member != null) ? member.getUser_name() : "익명";
        String msg = message.getPayload();

        // 2. DB 저장용 DTO 처리
        ChatDTO chat = new ChatDTO();
        chat.setUser_name(userName);
        chat.setMessage(msg);
        chat.setPosition(position);
        chatMapper.insertMessage(chat);

        // 3. 클라이언트에 보낼 JSON 데이터 만들기
        Map<String, String> chatData = new HashMap<>();
        chatData.put("userName", userName);
        chatData.put("position", position);
        chatData.put("message", msg);

        // 4. JSON 문자열로 변환
        String jsonMessage = objectMapper.writeValueAsString(chatData);

        // 5. 모든 접속자에게 JSON 전송
        for (WebSocketSession sess : sessionList) {
            if (sess.isOpen()) {
                sess.sendMessage(new TextMessage(jsonMessage)); // JSON 전송!
            }
        }
    }
}