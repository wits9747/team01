<%@page import="Service.UserServiceImpl"%>
<%@page import="Service.UserService"%>
<%@page import="DTO.Users"%>
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
<title>마이페이지</title>
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css'
	rel='stylesheet'>
<link rel="stylesheet" href="css/adm.css">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="script/product.js"></script>
<script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>
</head>
<body>
	<%
	//세션
	String memberId = (String) session.getAttribute("member");
	
	if(memberId==null){
		out.print("<script>alert('로그인하구와!')</script>");
		response.sendRedirect("./index.jsp?error=2");
		return;
	}

	UserService userService = new UserServiceImpl();
	Users Member = userService.member(memberId);

	int level = Member.getUser_level().intValue();
	%>


	<header>
		<h1 class="adm_title"><%=(level==10?"관리자페이지":"마이페이지") %></h1>
		<nav id="tab-button-nav">
			<div class="tab-button" data-tab-section="tab-section-1">대출현황</div>
			<div class="tab-button" data-tab-section="tab-section-2">대출이력</div>
			<%if(level==1){ %>
			<div class="tab-button" data-tab-section="tab-section-3">예약현황</div>
			<div class="tab-button" data-tab-section="tab-section-4">나의정보</div>
			<%}else{%>
			<div class="tab-button" data-tab-section="tab-section-5">회원관리</div>
			<%}%>
		</nav>
	</header>
	<section id="tab-section-1" class="tab-section">
		<div class="adm_list">
			<table border="1" class="adm-table">
				<colgroup>
					<col width="2%" />
					<col width="2%" />
					<col width="6%" />
					<col width="60%" />
					<col width="10%" />
					<col width="10%" />
				</colgroup>
				<tr>
					<th scope="col"><input type="checkbox">
					</td>
					<th scope="col">no
					</td>
					<th scope="col">대출상태
					</td>
					<th scope="col">책제목
					</td>
					<th scope="col">대출일자
					</td>
					<th scope="col">반납예정일
					</td>
				</tr>
				<tr>
					<th scope="col"><input type="checkbox">
					</td>
					<td>1</td>
					<td>대출중</td>
					<td>코스모스</td>
					<td>2024-04-02</td>
					<td>2024-04-09</td>
				</tr>
			</table>
		</div>
	</section>
	<section id="tab-section-2" class="tab-section" hidden>
		<div class="adm_list">
			<table border="1" class="adm-table">
				<colgroup>
					<col width="2%" />
					<col width="2%" />
					<col width="6%" />
					<col width="60%" />
					<col width="10%" />
					<col width="10%" />
				</colgroup>
				<tr>
					<th scope="col"><input type="checkbox">
					</td>
					<th scope="col">no
					</td>
					<th scope="col">예약현황
					</td>
					<th scope="col">책제목
					</td>
					<th scope="col">대출일자
					</td>
					<th scope="col">반납일자
					</td>
				</tr>
				<tr>
					<th scope="col"><input type="checkbox">
					</td>
					<td>1</td>
					<td>예약중</td>
					<td>코스모스</td>
					<td>2024-04-02</td>
					<td>2024-04-09</td>
				</tr>
				<tr>
					<th scope="col"><input type="checkbox">
					</td>
					<td>2</td>
					<td>예약중</td>
					<td>코스모스</td>
					<td>2024-04-02</td>
					<td>2024-04-09</td>
				</tr>
				<tr>
					<th scope="col"><input type="checkbox">
					</td>
					<td>3</td>
					<td>예약중</td>
					<td>코스모스</td>
					<td>2024-04-02</td>
					<td>2024-04-09</td>
				</tr>
				<tr>
					<th scope="col"><input type="checkbox">
					</td>
					<td>4</td>
					<td>예약중</td>
					<td>코스모스</td>
					<td>2024-04-02</td>
					<td>2024-04-09</td>
				</tr>
				<tr>
					<th scope="col"><input type="checkbox">
					</td>
					<td>5</td>
					<td>대출중</td>
					<td>코스모스</td>
					<td>2024-04-02</td>
					<td>2024-04-09</td>
				</tr>
			</table>
		</div>
	</section>
	<section id="tab-section-3" class="tab-section" hidden>
		<div class="adm_list">
			<table border="1" class="adm-table">
				<colgroup>
					<col width="2%" />
					<col width="2%" />
					<col width="6%" />
					<col width="60%" />
					<col width="10%" />
					<col width="10%" />
				</colgroup>
				<tr>
					<th scope="col"><input type="checkbox">
					</td>
					<th scope="col">no
					</td>
					<th scope="col">대출이력
					</td>
					<th scope="col">책제목
					</td>
					<th scope="col">대출일자
					</td>
					<th scope="col">반납일자
					</td>
				</tr>
				<tr>
					<th scope="col"><input type="checkbox">
					</td>
					<td>1</td>
					<td>반납완료</td>
					<td>코스모스</td>
					<td>2024-04-02</td>
					<td>2024-04-09</td>
				</tr>
				<tr>
					<th scope="col"><input type="checkbox">
					</td>
					<td>2</td>
					<td>반납완료</td>
					<td>코스모스</td>
					<td>2024-04-02</td>
					<td>2024-04-09</td>
				</tr>
				<tr>
					<th scope="col"><input type="checkbox">
					</td>
					<td>3</td>
					<td>반납완료</td>
					<td>코스모스</td>
					<td>2024-04-02</td>
					<td>2024-04-09</td>
				</tr>
				<tr>
					<th scope="col"><input type="checkbox">
					</td>
					<td>4</td>
					<td>반납완료</td>
					<td>코스모스</td>
					<td>2024-04-02</td>
					<td>2024-04-09</td>
				</tr>
				<tr>
					<th scope="col"><input type="checkbox">
					</td>
					<td>5</td>
					<td>반납완료</td>
					<td>코스모스</td>
					<td>2024-04-02</td>
					<td>2024-04-09</td>
				</tr>
			</table>
		</div>
	</section>
	<section id="tab-section-4" class="tab-section" hidden>
		<div class="adm_list">
			<table border="1" class="adm-table">
				<colgroup>
					<col width="2%" />
					<col width="2%" />
					<col width="6%" />
					<col width="8%" />
					<col width="8%" />
					<col width="10%" />
					<col width="55%" />
					<col width="20%" />
				</colgroup>
				<tr>
					<th scope="col"><input type="checkbox">
					</td>
					<th scope="col">no
					</td>
					<th scope="col">등급
					</td>
					<th scope="col">성명
					</td>
					<th scope="col">생년월일
					</td>
					<th scope="col">전화번호
					</td>
					<th scope="col">주소
					</td>
					<th scope="col">가입일
					</td>
				</tr>
				<tr>
					<th scope="col"><input type="checkbox">
					</td>
					<td>1</td>
					<td>일반회원</td>
					<td>홍길동</td>
					<td>200222</td>
					<td>010-2315-1232</td>
					<td>인천광역시 남구 숭의1동 123-5</td>
					<td>2024-04-09</td>
				</tr>
				<tr>
			</table>
		</div>
	</section>
	<div class="btn">
		<input type="button" name="" value="삭제"> <input type="button"
			name="" value="저장"> <a href="/adm_sub.html"><input
			type="button" name="" value="수정"></a> <a href="/adm.html"><input
			type="button" name="" value="목록"></a>
	</div>
	<script>
        const $nav = document.querySelector('#tab-button-nav')
        const $sections = document.querySelectorAll('.tab-section');
    
        $nav.addEventListener('click', (e) => {
          if (!e.target.classList.contains('tab-button')) {
            return;
          }
          
          const focusedTabId = e.target.dataset.tabSection;
    
          $sections.forEach(($section) => {
            if ($section.id === focusedTabId) {
              $section.removeAttribute('hidden');
            } else {
              $section.setAttribute('hidden', true);
            }
          });
        });
      </script>


</body>
</html>