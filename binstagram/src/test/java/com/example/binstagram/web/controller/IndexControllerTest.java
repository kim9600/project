package com.example.binstagram.web.controller;


import com.example.binstagram.domain.user.User;
import com.example.binstagram.domain.user.UserRepository;
import jdk.internal.jshell.tool.ConsoleIOContext;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.web.client.TestRestTemplate;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.web.servlet.MockMvc;

import javax.transaction.Transactional;

import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestBuilders.formLogin;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.redirectedUrl;

@ExtendWith(SpringExtension.class)
@SpringBootTest(webEnvironment= SpringBootTest.WebEnvironment.RANDOM_PORT)
public class IndexControllerTest {

    @Autowired
    private TestRestTemplate testRestTemplate;
    @Mock
    private UserRepository userRepository;
    private MockMvc mockMvc;


    @Test
    @Transactional
    public void login_success() throws Exception {
        String username = "test@test";
        String password = "12345";

        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        User newUser = createUser(username, encoder.encode(password), "", "");
        userRepository.save(newUser);

     mockMvc.perform(formLogin("/loginForm").user(username).password(password))
                .andDo(print())
                .andExcepect(redirectedUrl("/user/stroy"));


}



    public User createUser(String username, String password, String phone, String email) {
    return User.builder().build() ;
    }
}
