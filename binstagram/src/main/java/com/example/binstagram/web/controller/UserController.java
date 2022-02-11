package com.example.binstagram.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {

    @GetMapping("/auth/loginForm")
    public String loginForm(){

        return "/loginForm";
    }

    @GetMapping("/auth/joinForm")
    public String joinForm(){
        return "/joinForm";
    }
}
