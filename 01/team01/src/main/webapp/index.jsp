<%@page import="java.net.URLDecoder"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댕댕이 도서관</title>
<link rel="stylesheet" href="css/style.css">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
</head>


<%
//아이디 저장
String rememberId = "";
String userId = "";
Cookie[] cookies = request.getCookies();
if (cookies != null) {
	for (int i = 0; i < cookies.length; i++) {
		Cookie cookie = cookies[i];
		String cookieName = cookie.getName();
		String cookieValue = URLDecoder.decode(cookie.getValue(), "UTF-8");
		switch (cookieName) {
	case "userId" :
		userId = cookieValue;
		break;
	case "rememberId" :
		rememberId = cookieValue;
		break;
		}
	}
}

String error = request.getParameter("error");

//세션
String memberId = (String) session.getAttribute("member");
%>

<script>
$( document ).ready( function() {
	if('<%=error%>' == '2') {
			$('.wrapper').addClass('active-popup');
		}
	});
</script>

<body>
	<header>
		<h2 class="logo">Logo</h2>
		<nav class="navigation">
			<a href="#">Home</a> <a href="#">About</a> <a href="#">Service</a> <a
				href="#">contact</a>

			<%
			if (memberId == null) {
			%>
			<button class="btnLogin-popup">로그인</button>
			<%
			} else {
			%>
			<a href="./mypage.jsp"><%=memberId%></a>
			<button class="btnLogin-popup">로그아웃</button>
			<%
			}
			%>
		</nav>
	</header>

	<div class="wrapper">
		<span class="icon-close"> <ion-icon name="close"></ion-icon>
		</span>
		<div class="form-box login">
			<h2>Login</h2>
			<form action="./lib/login.jsp">
				<div class="input-box">
					<span class="icon"> <ion-icon name="mail"></ion-icon>
					</span> <input type="text" name="id" value="<%=userId%>" required>
					<label>아이디</label>
				</div>
				<div class="input-box">
					<span class="icon"> <ion-icon name="lock-closed"></ion-icon>
					</span> <input type="password" name="pw" required> <label>비밀번호</label>
				</div>
				<div class="remember-forgot">
					<label for=""><input type="checkbox" name="rememberId"
						<%=(rememberId.equals("on") ? "checked" : "")%>> 아이디저장</label> <a
						href="#">비밀번호 찾기</a>
				</div>
				<button type="submit" class="btn">로그인</button>
				<div class="login-register">
					<p>
						Don't have a account? <a href="#" class="register-link">회원가입</a>
					</p>
				</div>
			</form>
		</div>

		<div class="form-box register">
			<h2>회원가입</h2>
			<form action="./lib/join.jsp">
				<div class="input-box">
					<span class="icon"> <ion-icon name="mail"></ion-icon>
					</span> <input type="text" name="id" required> <label>아이디</label>
				</div>
				<div class="input-box">
					<span class="icon"> <ion-icon name="lock-closed"></ion-icon>
					</span> <input type="password" name="pw" required> <label>비밀번호</label>
				</div>
				<div class="input-box">
					<span class="icon"> <ion-icon name="person"></ion-icon>
					</span> <input type="text" name="name" required> <label>이름</label>
				</div>
				<div class="input-box">
					<span class="icon"> <ion-icon name="person"></ion-icon>
					</span> <input type="text" name="birth" required> <label>생일</label>
				</div>
				<div class="input-box">
					<span class="icon"> <ion-icon name="person"></ion-icon>
					</span> <input type="text" name="address" required> <label>주소</label>
				</div>
				<div class="input-box">
					<span class="icon"> <ion-icon name="person"></ion-icon>
					</span> <input type="text" name="phone" required> <label>연락처</label>
				</div>
				<div class="remember-forgot">
					<label for=""><input type="checkbox" required>동의하세요!!</label>
				</div>
				<button type="submit" class="btn">가입하기</button>
				<div class="login-register">
					<p>
						Already have a account? <a href="#" class="login-link">Login</a>
					</p>
				</div>
			</form>
		</div>
	</div>

	<script src="script/jquery-3.7.1.js"></script>
	<script src="script/scripts.js"></script>
	<script type="module"
		src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
	<script
		src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</body>
</html>