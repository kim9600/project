package com.example.binstagram.web.controller;

import com.example.binstagram.service.UserService;
import com.example.binstagram.web.dto.user.UserLoginDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.validation.Valid;

@RequiredArgsConstructor
@Controller
public class AuthController {


    UserService userService;

    @PostMapping("/joinForm")
    public String join(@Valid UserLoginDto userLoginDto, BindingResult bindingResult) {
        userService.save(userLoginDto);
        return "redirect:/auth/loginForm";
    }

}
