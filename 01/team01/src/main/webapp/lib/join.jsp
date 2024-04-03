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
String name = request.getParameter("name");
String birth = request.getParameter("birth");
String address = request.getParameter("address");
String phone = request.getParameter("phone");

/* Users user = new Users();
user.setId(id);
user.setPassword(password);
user.setName(name);
user.setBirth(birth);
user.setAddress(address);
user.setPhone(phone); */
Users user = new Users(id, password, name, birth, address, phone);

// 로그인 요청
UserService userService = new UserServiceImpl();
int reuslt = userService.join(user);

// 회원가입 성공
if (reuslt > 0) {
	// response.sendRedirect("complete.jsp");
	response.sendRedirect("../index.jsp");
	session.setAttribute("loginId", user.getId());
} else {
	response.sendRedirect("../index.jsp?error=1");

}
%>