package com.example.binstagram.config;


import com.example.binstagram.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;


@RequiredArgsConstructor
@EnableWebSecurity
@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    private final UserService userService;

    protected void configure(HttpSecurity http) throws Exception{
        http.csrf().disable();
        http.authorizeRequests()
                    .antMatchers("/","/auth/loginForm","/auth/joinForm","/style/**","/js/**","/img/**").permitAll() //권한없이 접근허가해줄 페이지
                    .anyRequest().authenticated()
                .and()
                    .formLogin() //로그인과 관련된 설정
                    .loginPage("/auth/loginForm")
                    .loginProcessingUrl("/loginForm")

                    //.defaultSuccessUrl("/user/story")
                .and()
                .logout()//로그아웃과 관련된 설정
                .logoutSuccessUrl("/auth/loginForm")
                .invalidateHttpSession(true); //세션 전체삭제

    }
}
