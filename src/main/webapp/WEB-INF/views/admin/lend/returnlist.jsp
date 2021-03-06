<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html>

<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
	<link rel="stylesheet" href="/css/lend.css">
	<link rel="stylesheet" href="/css/main.css">
	<script src="/js/main.js"></script>
	<script src="/js/lend.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js"
		integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT" crossorigin="anonymous">
	</script>

	<script>
		var STARTDATE = "";
		var ENDDATE = "";

		$(document).ready(function () {
			$('#exampleModal').on('show.bs.modal', function (event) {
				STARTDATE = $(event.relatedTarget).data('startdate');
				ENDDATE = $(event.relatedTarget).data('enddate');
				$(".modal-body #start_date").val(STARTDATE);
				$(".modal-body #end_date").val(ENDDATE);

			});
		});
	</script>
	<script type="text/javascript">
		function onClick() {
			const html = window.open('http://localhost:8088/admin/lend/print');
			html.print();
		}
	</script>
	<script type="text/javascript">
		function popup3(frm) {
			var url = "testpop.asp";
			var title = "testpop";
			var status =
				"toolbar=no,directories=no,scrollbars=no,resizable=no,status=no,menubar=no,width=500, height=500, top=130,left=500";
			window.open("", title, status);
			frm.target = title;
			frm.action = "/admin/lend/print_button";
			frm.method = "post";
			frm.submit();
		}
	</script>
	<title>?????????????????? A/S???</title>
	<link rel="icon" href="/media/mark_SKHU.png">
</head>

<body>
	<div id="navBar">
		<a href="/index" id="homeImg"><img src="/media/mark_SKHU.png" alt="MAIN" width="100%" height="100%"></a>
		<sec:authorize access="hasAnyRole('ROLE_USER, ROLE_MEMBER, ROLE_EMPLOYEE, ROLE_PROFESSOR')"><a href="/user/notice/notice_list_front" >????????????</a></sec:authorize>
		<sec:authorize access="hasAnyRole('ROLE_ADMIN, ROLE_SUPERADMIN, ROLE_SERVER')"> <a href="/admin/notice/notice_list" >????????????</a></sec:authorize>
		<sec:authorize access="hasRole('ROLE_USER')"> <a onclick="alert('?????????????????? ????????? ?????? ????????? ???????????????.')">?????? ??????</a></sec:authorize>
		<sec:authorize access="hasRole('ROLE_MEMBER')"> <a href="/user/lend/select_com_laptop" >?????? ??????</a></sec:authorize>
		<sec:authorize access="hasAnyRole('ROLE_ADMIN, ROLE_SUPERADMIN, ROLE_SERVER')"> <a href="/admin/lend/booklist" >?????? ??????</a></sec:authorize>
		<a href="/user/lend/userpage">?????? ?????? ??????</a>
		<sec:authorize access="hasAnyRole('ROLE_USER, ROLE_MEMBER, ROLE_EMPLOYEE, ROLE_PROFESSOR')"> <a href="/user/inquiry/inquiry_list_front" >????????????</a></sec:authorize>
		<sec:authorize access="hasAnyRole('ROLE_ADMIN, ROLE_SUPERADMIN, ROLE_SERVER')"> <a href="/admin/inquiry/inquiry_list" >?????? ??????</a></sec:authorize>
		<sec:authorize access="authenticated">
			<a class="btn" style="float: right;" href="/logout_processing">????????????</a>
		</sec:authorize>
		<a href="/user/mypages" style="float: right;">???????????????</a>
		<a style="float: right; pointer-events: none;">${ name }???</a>
	</div>
	<div class="header">
		<div class="headerBtn" style="float: left; width: 350px;">
			<a href="/index"><img src="/media/logo_mark_mr_sin.jpg" alt="logo_AS" width="100%" height="100%"></a>
		</div>
		<a class="headerBtn" href="/logout_processing">????????????</a>
		<a class="headerBtn" href="/user/mypages">???????????????</a>
		<sec:authorize access="hasAnyRole('ROLE_USER, ROLE_MEMBER, ROLE_EMPLOYEE, ROLE_PROFESSOR')"><a href="/user/inquiry/inquiry_list_front" class="headerBtn">????????????</a></sec:authorize>
		<sec:authorize access="hasAnyRole('ROLE_ADMIN, ROLE_SUPERADMIN, ROLE_SERVER')"><a href="/admin/inquiry/inquiry_list" class="headerBtn">?????? ??????</a></sec:authorize>
		<sec:authorize access="hasRole('ROLE_USER')"> <a onclick="alert('?????????????????? ????????? ?????? ????????? ???????????????.')" class="headerBtn">?????? ??????</a></sec:authorize>
		<sec:authorize access="hasRole('ROLE_MEMBER')"> <a href="/user/lend/select_com_laptop" class="headerBtn">?????? ??????</a></sec:authorize>
		<sec:authorize access="hasAnyRole('ROLE_ADMIN, ROLE_SUPERADMIN, ROLE_SERVER')"> <a href="/admin/lend/booklist" class="headerBtn">?????? ??????</a></sec:authorize>
		<sec:authorize access="hasAnyRole('ROLE_USER, ROLE_MEMBER, ROLE_EMPLOYEE, ROLE_PROFESSOR')"><a href="/user/notice/notice_list_front" class="headerBtn">????????????</a></sec:authorize>
		<sec:authorize access="hasAnyRole('ROLE_ADMIN, ROLE_SUPERADMIN, ROLE_SERVER')"><a href="/admin/notice/notice_list" class="headerBtn">????????????</a></sec:authorize>
	</div>
	<div class="list_top">
		<h1>????????????</h1>
	</div>
	<div class="list_middle">
		<table class="middle">
			<tr>
				<ul class="nav nav-pills nav-tabs nav-fill">
					<li class="nav-item"><a class="nav-link" href="booklist">??????</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="rentlist">??????</a>
					</li>
					<li class="nav-item"><a class="nav-link active " aria-current="page" href="returnlist">??????</a></li>
					<li class="nav-item"><a class="nav-link" href="list">??????</a></li>
				</ul>
			</tr>
			<tr>
				<form name="inquiry">
					<td>
			</tr>
			<tr>
				<td>
					<div class="input-group mb-3">
						<button class="btn btn-outline-secondary dropdown-toggle" type="button"
							data-bs-toggle="dropdown" aria-expanded="false">${ order }</button>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="list?order=??????&srchText=${srchText }">??????</a></li>
							<li><a class="dropdown-item" href="list?order=?????????&srchText=${srchText }">?????????</a></li>
						</ul>
						<input type="hidden" name=order value="${ order }"> <input type="text" name="srchText"
							value="${ srchText }" placeholder="???????????? ??????????????????" class="form-control"
							placeholder="Recipient's username" aria-label="Recipient's username"
							aria-describedby="button-addon2">
						<button class="btn btn-outline-secondary" type="submit" id="button-addon2">??????</button>
					</div>
					</form>
				</td>
			</tr>
		</table>
	</div>
	<div class="list_bottom">
		<table class="table list">
			<thead>
				<tr align="center">
					<th>??????</th>
					<th>??????</th>
					<th>????????????</th>
					<th>?????????</th>
					<th>??????????????????</th>
					<th>??????????????????</th>
					<th>???????????????</th>
					<th>???????????????</th>
					<th>??????</th>
					<th>?????????</th>
					<th>??????</th>
					<th>??????</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="lend" items="${ lends }">
					<tr align="center">
						<td>${ lend.snum }</td>
						<td>${ lend.snum_name }</td>
						<td>${ lend.major_name }</td>
						<td>${ lend.device_name }</td>
						<td>No: ${ lend.detail_no }</td>
						<td>
							<fmt:formatDate pattern="yyyy-MM-dd" value="${ lend.visit_date }" />
						</td>
						<td>
							<fmt:formatDate pattern="yyyy-MM-dd" value="${ lend.start_date }" />
						</td>
						<td>
							<fmt:formatDate pattern="yyyy-MM-dd" value="${ lend.end_date }" />
						</td>
						<td>${ lend.extend == 0 ? "??????" : "?????????" }</td>
						<td>${ lend.arrears }</td>
						<td>
							<form method="post">
								<input type="button" class="btn btn-primary" name="return" value="??????"
									onclick="javascript:popup2(this.form);"> <input type="hidden" name=lend_no
									value="${lend.no}">
							</form>
						</td>
						<td>
							<form method="post">
								<input type="button" class="btn btn-secondary" name="print" value="??????"
									onclick="javascript:popup3(this.form);"> <input type="hidden" name=lend_no
									value="${lend.no}">
							</form>
						</td>

						<%-- <td><button type="button"  class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-startdate="${lend.start_date }"  data-enddate="${lend.end_date }">
??????
</button>
</td>
</tr>
				</c:forEach>
				</tbody>
				</table>	
</div>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" >
  <div class="modal-dialog modal-dialog-centered modal-xl">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">??????</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
   <!--   <input type="text" name="bookId" id="bookId" value=""/> -->
        <table class="rent">
     
        <tr>
					<td>??????????????? : <fmt:formatDate pattern="yyyy-MM-dd"
							value="${ STARTDATE }" /></td>
				</tr>
				<tr>
					<td>??????????????? : <fmt:formatDate pattern="yyyy-MM-dd"
							value="${ selectedLend.end_date }" /></td>
				</tr>
				
				<tr>
				<td> <input type="text" name="start_date" id="start_date" value=""/>  </td>
				</tr>
				<tr>
				<td> <input type="text" name="end_date" id="end_date" value=""/>  </td>
				</tr>
				
				
				<tr>
					<td>????????? : <fmt:formatDate pattern="yyyy-MM-dd"
							value="${ today }" /></td>
				</tr>
				<tr>
					<td>???????????????: <fmt:formatDate pattern="yyyy-MM-dd"
							value="${ end_date }" var="b" /> <input type="date"
						name="end_date" value="${ b }" /></td>
				
			
			</table>
 		 <input type="hidden" name="lend_no" id="lend_no" value=""/>
      </div>
      <div class="modal-footer">
        <button type="submit" class="btn btn-primary">????????????</button>
       
      </div>
    </div>
  </div>
</div>
 --%>
				</c:forEach>
			</tbody>
		</table>
	</div>

</body>

</html>