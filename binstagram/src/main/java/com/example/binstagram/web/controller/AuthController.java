package com.example.binstagram.web.controller;

import com.example.binstagram.domain.user.User;
import com.example.binstagram.service.UserService;
import com.example.binstagram.web.dto.user.UserLoginDto;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;


import javax.validation.Valid;

@RequiredArgsConstructor
@Controller
public class AuthController {

    @Autowired
    UserService userService;

    @PostMapping("/auth/joinForm")
    public String join(@Valid UserLoginDto userLoginDto, BindingResult bindingResult) {
        userService.save(userLoginDto);
        return "redirect:/auth/loginForm";
    }


}
