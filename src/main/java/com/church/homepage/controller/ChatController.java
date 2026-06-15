package com.church.homepage.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.church.homepage.dto.ChatDTO;
import com.church.homepage.mapper.ChatMapper;

@RestController
@RequestMapping("/chat")
public class ChatController {
    @Autowired
    private ChatMapper chatMapper;

    @GetMapping("/history")
    public List<ChatDTO> getHistory() {
        return chatMapper.getRecentMessages();
    }
}