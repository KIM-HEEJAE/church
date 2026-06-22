package com.church.homepage.handler;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

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

		// 세션에서 바로 직책을 꺼냅니다.
		String position = (member != null) ? member.getPosition() : "일반";
		String userName = (member != null) ? member.getUser_name() : "익명";
		String userId = (member != null) ? member.getUser_id() : session.getId();
		String msg = message.getPayload();

		// DB 저장 (position도 같이 저장하세요)
		ChatDTO chat = new ChatDTO();
		chat.setUser_name(userName);
		chat.setMessage(msg);
		chat.setPosition(position); // DTO에 추가 필요
		chatMapper.insertMessage(chat);

		// 전송 (브라우저로 [직책]이름: 메시지 형태 전송)
		String fullMessage = "[" + position + "] " + userName + ": " + msg;
		Set<String> sentUsers = new HashSet<>();
		for (WebSocketSession sess : sessionList) {
			if (sess.isOpen()) {
	            // 해당 세션의 주인(사용자) 정보 가져오기
	            MemberDTO targetMember = (MemberDTO) sess.getAttributes().get("member");
	            String targetId = (targetMember != null) ? targetMember.getUser_id() : sess.getId();

	            // 만약 이미 이 사용자에게 메시지를 보냈다면 건너뜀 (중복 방지)
	            if (sentUsers.contains(targetId)) {
	                continue;
	            }

	            // 메시지 전송
	            sess.sendMessage(new TextMessage(fullMessage));
	            sentUsers.add(targetId);
			System.out.println("전송 완료" + targetId);
		}
	}
}
}