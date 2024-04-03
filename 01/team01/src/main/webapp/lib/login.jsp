<%@page import="java.net.URLEncoder"%>
<%@page import="Service.UserServiceImpl"%>
<%@page import="Service.UserService"%>
<%@page import="DTO.Users"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String id = request.getParameter("id");
String password = request.getParameter("pw");

//아이디 저장
String rememberId = request.getParameter("rememberId");
Cookie cookieRememberId = new Cookie("rememberId", "");
Cookie cookieUserId = new Cookie("userId", "");
if (rememberId != null && rememberId.equals("on")) {
	cookieRememberId.setValue(URLEncoder.encode(rememberId, "UTF-8"));
	cookieUserId.setValue(URLEncoder.encode(id, "UTF-8"));
} else {
	// 쿠키 삭제
	cookieRememberId.setMaxAge(0);
	cookieUserId.setMaxAge(0);
}

//자동 로그인 체크 여부, 토큰 쿠키에 대한 경로 설정
cookieRememberId.setPath("/");
cookieUserId.setPath("/");
// 쿠키 유효기간 설정 - 초단위 --> 7일
cookieRememberId.setMaxAge(7 * 60 * 60 * 24);
cookieUserId.setMaxAge(7 * 60 * 60 * 24);

//쿠키 응답에 등록
response.addCookie(cookieRememberId);
response.addCookie(cookieUserId);

//로그인 요청
Users user = new Users(id, password);
UserService userService = new UserServiceImpl();
Users loginUser = userService.login(user);

//로그인 실패
if (loginUser == null) {
	response.sendRedirect("../index.jsp?error=2");
	return;
} else {
	session.setAttribute("member", loginUser.getId());
	response.sendRedirect("../index.jsp?");
	return;
}
%>