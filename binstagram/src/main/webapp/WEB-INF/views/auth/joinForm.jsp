<%@ page contentType="text/html;charset=UTF-8" language="java"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.w3.org/1999/XSL/Transfo">
<head>
    <meta charset="UTF-8">
    <title>Binstagram</title>
    <link href="/style/join.css" rel="stylesheet" type="text/css" />
    <link href="/style/login.css" rel="stylesheet" type="text/css" />

    <!-- favicon -->
    <link rel="icon" href="/img/favicon.png">
    <link rel="instagram-icon" href="/img/favicon.png">

</head>
<body>
<div class="container">
    <img class="logo_instagram" src="/img/logo_text.png" alt="instagram_logo">
    <form action="/auth/joinForm" method="post">
        <input type="email" class="input_signup" name="email" id="email" placeholder="이메일 주소" required="required"  maxlength="30"/>
        <input type="password" class="input_signup" name="password" id="password" placeholder="비밀번호" required="required" />
        <input type="text" class="input_signup" name="phone" id="phone" placeholder="전화번호" required="required" />
        <input type="text" class="input_signup" name="name" id="name" placeholder="성명" required="required" />
        <button id="btn_signup" disabled> 가입 </button>
    </form>
    <%--<span class="email_input_check" th:if="${param.error}" > 이메일 계정이 이미 존재합니다. </span>--%>
    <a href="/auth/loginForm" class="button_login">계정이 있으신가요?  로그인</a>
</div>
<script src="/js/join.js"></script>
</body>
</html>