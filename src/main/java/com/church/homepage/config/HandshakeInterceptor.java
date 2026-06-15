package com.church.homepage.config;

import java.util.Map;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

import com.church.homepage.dto.MemberDTO;

import jakarta.servlet.http.HttpSession;

public class HandshakeInterceptor extends HttpSessionHandshakeInterceptor {

    @Override
    public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response, 
                                   WebSocketHandler wsHandler, Map<String, Object> attributes) throws Exception {
        
        // HTTP 세션에서 member 정보를 가져옴
        ServletServerHttpRequest ssreq = (ServletServerHttpRequest) request;
        HttpSession session = ssreq.getServletRequest().getSession();
        MemberDTO member = (MemberDTO) session.getAttribute("member");

        if (member != null) {
            // 웹소켓 세션에 member 정보를 저장
            attributes.put("member", member);
        }
        return super.beforeHandshake(request, response, wsHandler, attributes);
    }
}