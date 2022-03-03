package com.example.binstagram.service;


import com.example.binstagram.domain.user.User;
import com.example.binstagram.domain.user.UserRepository;
import com.example.binstagram.handler.ex.CustomValidationException;
import com.example.binstagram.web.dto.user.UserLoginDto;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.context.ActiveProfiles;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.BDDMockito.given;

@ExtendWith(MockitoExtension.class)
@ActiveProfiles("test")
public class UserServiceTest {

    @InjectMocks
    private UserService userService;

    @Mock
    private UserRepository userRepository;

    @Mock
    private User mock_user;

    private User user;


    @BeforeEach
    public void setUp(){
        BCryptPasswordEncoder encoder =new BCryptPasswordEncoder();
        user =User.builder()
                .email("test@test")
                .name("test")
                .password(encoder.encode("test1234!"))
                .phone("12341234")
                .title(null)
                .website(null)
                .profileImgUrl(null)
                .build();
    }

    public UserLoginDto createUserLoginDto(){
        return UserLoginDto.builder()
                .email(user.getEmail())
                .password(user.getPassword())
                .name(user.getName())
                .phone(user.getPhone())
                .build();
    }

    @Test
    public void save_login_success() throws Exception{
        UserLoginDto userLoginDto = createUserLoginDto();
        given(userRepository.findUserByEmail(any())).willReturn(null);
        given(userRepository.save(any())).willReturn(user);

        User saveUser = userService.save(userLoginDto);

        assertThat(saveUser).isNotNull();

        assertThat(userLoginDto.getEmail()).isEqualTo(saveUser.getEmail());
        assertThat(userLoginDto.getName()).isEqualTo(saveUser.getName());
    }

    @Test
    public void save_login_fail() throws Exception{
        UserLoginDto userLoginDto = createUserLoginDto();
        given(userRepository.findUserByEmail(any())).willReturn(user);

        assertThrows(CustomValidationException.class, () -> {
           userService.save(userLoginDto);
        });
    }
}
