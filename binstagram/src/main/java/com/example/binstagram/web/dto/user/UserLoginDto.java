package com.example.binstagram.web.dto.user;

import lombok.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class UserLoginDto {
    private String email;
    private String password;
    private String phone;
    private String name;
}
