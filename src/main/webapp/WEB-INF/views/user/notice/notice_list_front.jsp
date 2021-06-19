<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html>

<head>
	<title>성공회대학교 A/S 센터</title>
	<link rel="stylesheet" href="/css/notice_list.css">
	<link rel="stylesheet" href="/css/main.css">
	<script src="/js/main.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<body style="margin-bottom: 5%;">
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
		<a style="float: right; pointer-events: none;">${ name }님</a>
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
	<div style="display: inline-block; width:100%; margin-top: 5%;">
		<p style="font-size: 36px; margin-top: 10%; margin-left: 45%; display: inline; color:#585858;">공지사항</p>
		<p style="font-size: 20px; color: #A0A0A0; margin-left: 45%; margin-top: 5px;">skhu/AS_Center</p>
		<form method="post">
			<div style="position: relative">
				<input type="text" name="title" value="${title}" class="search" placeholder="제목으로 검색">
				<button type="submit" class="search_button"><img src="/media/search_black_24dp.svg"></button>
			</div>
		</form>
	</div>
	<table class="notice">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		<c:forEach var="notice_list" items="${ notice_list }">
			<tr data-url="notice_details?no=${ notice_list.getNo() }">
				<td>${ notice_list.getNo() }</td>
				<td>${ notice_list.getTitle() }</td>
				<td>${ notice_list.getSnum() }</td>
				<td>${ notice_list.getWrite_date() }</td>
				<td style="height:40px;">${ notice_list.getViews() }</td>
			</tr>
		</c:forEach>
	</table>

	<script>
		$("[data-url]").click(function () {
			var url = $(this).attr("data-url");
			location.href = url;
		})
	</script>
</body>

</html>