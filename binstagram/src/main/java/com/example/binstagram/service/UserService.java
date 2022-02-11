package com.example.binstagram.service;

import com.example.binstagram.domain.user.User;
import com.example.binstagram.domain.user.UserRepository;
import com.example.binstagram.web.dto.user.UserLoginDto;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

@RequiredArgsConstructor
@Service
public class UserService {

    private final UserRepository userRepository;

    @Transactional
    public boolean save(UserLoginDto userLoginDto){
        if(userRepository.findUserByEmail(userLoginDto.getEmail()) != null)
            return false;
        //Spring Security의 비밀번호 암호화 기능으로 암호화 한 다음,
        // 회원가입시 전달받은 UserLoginDto 정보를 DB에 save해 준다.
        BCryptPasswordEncoder encoder =new BCryptPasswordEncoder();

        //User u = User.builder().account(account).password(password).status(status).build();
        // 빌더 패턴
            userRepository.save(User.builder().
                email(userLoginDto.getEmail())
                .password(encoder.encode(userLoginDto.getPassword()))
                .phone(userLoginDto.getPhone())
                .name(userLoginDto.getName())
                .title(null)
                .website(null)
                .profileImgUrl("/img/liked.png")
                .build());
        return true;
    }

}
