<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width">
    <title>Binstagram</title>
    <link href="/style/common.css" rel="stylesheet" type="text/css"/>
    <link href="/style/login.css" rel="stylesheet" type="text/css"/>

    <!-- favicon -->
    <link rel="icon" href="/img/favicon.png">
    <link rel="instagram-icon" href="/img/favicon.png">

</head>
<body>
<div class="container">
    <form action="/loginForm" method="post">
        <img class="logo_instagram" src="/img/logo_text.png" alt="instagram_logo">
        <input type="text" class="username" name="username" id="username" placeholder="이메일">
        <input type="password" class="password" name="password" id="password" placeholder="비밀번호">
        <button id="btn_login" disabled>로그인</button>
    </form>
    <span class="login_input_check">

    </span>
    <!-- Oauth 소셜로그인 -->
    <div class="login_facebook">
        <img class="logo_facebook" src="/img/facebook_icon.png">
        <a href="/oauth2/authorization/facebook" class="btn_facebook">Facebook으로 로그인</a>
    </div>
    <!-- Oauth 소셜로그인end -->
    <a href="/auth/joinForm" class="button_signup">계정이 없으신가요? 가입하기</a>
</div>
<script src="/js/login.js"></script>
</body>
</html>
