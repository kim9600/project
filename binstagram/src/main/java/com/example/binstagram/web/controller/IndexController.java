package com.example.binstagram.web.controller;


import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@RequiredArgsConstructor
@Controller
public class IndexController {

    @GetMapping("/auth/loginForm")
    public String login(){
        return "/auth/loginForm";
    }

    @GetMapping("/auth/joinForm")
    public String join(){
        return "/auth/joinForm";
    }
}
