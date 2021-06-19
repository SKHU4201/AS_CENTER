<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
        <title>성공회대학교 A/S실</title>
		<link rel="icon" href="/media/mark_SKHU.png">
        <link rel="stylesheet" href="/css/inquiry_list.css">
        <link rel="stylesheet" href="/css/main.css">
        <script src="js/main.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
   
<body style="margin-bottom: 10%;">
	<div id="navBar">
		<a href="/index" id="homeImg"><img src="/media/mark_SKHU.png" alt="MAIN" width="100%" height="100%"></a>
		<sec:authorize access="hasAnyRole('ROLE_USER, ROLE_MEMBER, ROLE_EMPLOYEE, ROLE_PROFESSOR')"><a href="/user/notice/notice_list_front" >공지사항</a></sec:authorize>
		<sec:authorize access="hasAnyRole('ROLE_ADMIN, ROLE_SUPERADMIN, ROLE_SERVER')"> <a href="/admin/notice/notice_list" >공지사항</a></sec:authorize>
		<sec:authorize access="hasRole('ROLE_USER')"> <a onclick="alert('본인인증을을 하셔야 장비 예약이 가능합니다.')">장비 예약</a></sec:authorize>
		<sec:authorize access="hasRole('ROLE_MEMBER')"> <a href="/user/lend/select_com_laptop" >장비 예약</a></sec:authorize>
		<sec:authorize access="hasAnyRole('ROLE_ADMIN, ROLE_SUPERADMIN, ROLE_SERVER')"> <a href="/admin/lend/booklist" >예약 처리</a></sec:authorize>
		<a href="/user/lend/userpage">예약 기록 보기</a>
		<sec:authorize access="hasAnyRole('ROLE_USER, ROLE_MEMBER, ROLE_EMPLOYEE, ROLE_PROFESSOR')"> <a href="/user/inquiry/inquiry_list_front" >문의하기</a></sec:authorize>
		<sec:authorize access="hasAnyRole('ROLE_ADMIN, ROLE_SUPERADMIN, ROLE_SERVER')"> <a href="/admin/inquiry/inquiry_list" >문의 처리</a></sec:authorize>
		<sec:authorize access="authenticated">
			<a class="btn" style="float: right;" href="/logout_processing">로그아웃</a>
		</sec:authorize>
		<a href="/user/mypages" style="float: right;">마이페이지</a>
		<a style="float: right; pointer-events: none;">${ student.name }님</a>
	</div>
	<div class="header">
		<div class="headerBtn" style="float: left; width: 350px;">
			<a href="/index"><img src="/media/logo_mark_mr_sin.jpg" alt="logo_AS" width="100%" height="100%"></a>
		</div>
		<a class="headerBtn" href="/logout_processing">로그아웃</a>
		<a class="headerBtn" href="/user/mypages">마이페이지</a>
		<sec:authorize access="hasAnyRole('ROLE_USER, ROLE_MEMBER, ROLE_EMPLOYEE, ROLE_PROFESSOR')"><a href="/user/inquiry/inquiry_list_front" class="headerBtn">문의하기</a></sec:authorize>
		<sec:authorize access="hasAnyRole('ROLE_ADMIN, ROLE_SUPERADMIN, ROLE_SERVER')"><a href="/admin/inquiry/inquiry_list" class="headerBtn">문의 처리</a></sec:authorize>
		<sec:authorize access="hasRole('ROLE_USER')"> <a onclick="alert('본인인증을을 하셔야 장비 예약이 가능합니다.')" class="headerBtn">장비 예약</a></sec:authorize>
		<sec:authorize access="hasRole('ROLE_MEMBER')"> <a href="/user/lend/select_com_laptop" class="headerBtn">장비 예약</a></sec:authorize>
		<sec:authorize access="hasAnyRole('ROLE_ADMIN, ROLE_SUPERADMIN, ROLE_SERVER')"> <a href="/admin/lend/booklist" class="headerBtn">예약 처리</a></sec:authorize>
		<sec:authorize access="hasAnyRole('ROLE_USER, ROLE_MEMBER, ROLE_EMPLOYEE, ROLE_PROFESSOR')"><a href="/user/notice/notice_list_front" class="headerBtn">공지사항</a></sec:authorize>
		<sec:authorize access="hasAnyRole('ROLE_ADMIN, ROLE_SUPERADMIN, ROLE_SERVER')"><a href="/admin/notice/notice_list" class="headerBtn">공지사항</a></sec:authorize>
	</div>
	<div id="app">
		<p
			style="font-size: 36px; margin-top: 10%; margin-left: 45%; display: inline; color: #585858;">문의사항</p>
		<p
			style="font-size: 20px; color: #A0A0A0; margin-left: 44%; margin-top: 5px;">skhu/AS_Center</p>
		<form method="post">
			<select class="select_sort" name="select_value">
				<option value="2"><c:if test="${select_value == 2}">selected</c:if>></option>
				<option value="1"><c:if test="${select_value == 1}">selected</c:if>>답변 완료</option>
				<option value="0"><c:if test="${select_value == 0}">selected</c:if>>답변 대기중</option>
			</select>
			<button class="sort_button" type="submit">
				<img src="/media/search_white_24dp.svg">
			</button>
		</form>
	</div>


	<table class="inquiry">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
			<th>타입</th>
			<th>상태</th>
		</tr>
		<c:forEach var="inquiry_list" items="${ inquiry_list }">
			<tr data-url="inquiry_details_admin?no=${ inquiry_list.getNo() }">
				<td>${ inquiry_list.getNo() }</td>
				<td>${ inquiry_list.getTitle() }</td>
				<td>${ inquiry_list.getSnum() }</td>
				<td>${ inquiry_list.getWrite_date() }</td>
				<td>${ inquiry_list.getViews() }</td>
				<td><c:if test="${ inquiry_list.getType() ==1 }">장비 장애</c:if>
					<c:if test="${ inquiry_list.getType() == 2}">버그 신고</c:if>
					<c:if test="${ inquiry_list.getType() == 3}">기타</c:if></td>
				<td><c:if test="${ inquiry_list.getState() == 0}">답변 대기중</c:if>
					<c:if test="${ inquiry_list.getState() == 1}">답변 완료</c:if></td>
			</tr>
		</c:forEach>
	</table>

	<script> 
        $("[data-url]").click(function() {
        	var url = $(this).attr("data-url");
        	location.href = url; 
        	}) 
        </script>
	<div class="footer">
		<p>
			<br>전화번호: 02-2610-4201
			<br>주소: 서울특별시 구로구 오류2동 연동로 320 (성공회대학교), 월당관 1층
			<br>근무시간: 9:00 AM ~ 5:00 PM
			<br>점심시간: 12:00 PM ~ 1:00 PM<br>
			<br>&copy; 2021 skhu4201.com
		</p>
	</div>
</body>
</html>