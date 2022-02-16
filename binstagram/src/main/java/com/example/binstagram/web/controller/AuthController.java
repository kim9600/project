package com.example.binstagram.web.controller;

import com.example.binstagram.service.UserService;
import com.example.binstagram.web.dto.user.UserLoginDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@RequiredArgsConstructor
@Controller
public class AuthController {


    UserService userService;

    @PostMapping("/joinForm")
    public String join(UserLoginDto userLoginDto){
        if(userService.save(userLoginDto)){
            return "redirect:/auth/loginForm";
        }else {
            return "redirect:/auth/joinForm?error";
        }


    }

}
