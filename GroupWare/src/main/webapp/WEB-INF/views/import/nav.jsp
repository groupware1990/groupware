<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>header_admin</title>
</head>
<body>
	<nav class="navbar navbar-inverse">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#myNavbar">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#">GroupWare</a>
				</div>
				<div class="collapse navbar-collapse" id="myNavbar">
					<ul class="nav navbar-nav">
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#">편지함<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="/email/rcvList?stf_rcv_sq=1">받은편지함</a></li>
								<li><a href="#">보낸편지함</a></li>
								<li><a href="#">보관함</a></li>
								<li><a href="#">주소록</a></li>
							</ul></li>
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#">전자결재<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="/approval/approvalList?div_apv_sq=1">업무</a></li>
								<li><a href="/approval/approvalList?div_apv_sq=2">파견</a></li>
								<li><a href="/approval/approvalList?div_apv_sq=3">경비지출</a></li>
								<li><a href="/approval/approvalList?div_apv_sq=4">초과근무</a></li>
								<li><a href="/approval/approvalList?div_apv_sq=5">휴가</a></li>
							</ul></li>
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#">일정<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="/schedule/scheduleList?scd_sq=1">회사일정</a></li>
								<li><a href="/schedule/scheduleList?scd_sq=2">부서일정</a></li>
								<li><a href="/schedule/scheduleList?scd_sq=3">개인일정</a></li>
							</ul></li>
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#">게시판<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="/sboard/list?ntc_div_sq=1">자유게시판</a></li>
								<li><a href="/sboard/list?ntc_div_sq=2">사내동호회</a></li>
								<li><a href="/sboard/list?ntc_div_sq=3">중고장터</a></li>
							</ul></li>
					    <li><a href="/data/dataList">자료실</a></li>
						<!-- <li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="/data/dataList">자료실 <span class="caret"></span></a>
							 <ul class="dropdown-menu">
								<li><a href="/data/dataList">자료실</a></li>
								<li><a href="#">Page 5-2</a></li>
								<li><a href="#">Page 5-3</a></li>
							</ul></li> -->
							
							<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#">관리자<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="/admin/officerList">구성원 관리</a></li>
								<li><a href="#">Page 1-2</a></li>
								<li><a href="#">Page 1-3</a></li>
							</ul></li>
					</ul>

					<form class="navbar-form navbar-right">
						<div class="input-group">
							<input type="text" class="form-control" placeholder="Search">
							<div class="input-group-btn">
								<button class="btn btn-default" type="submit">
									<i class="glyphicon glyphicon-search"></i>
								</button>
							</div>
						</div>
					</form>
					
					<ul class="nav navbar-nav navbar-right">
						<li><a href="#"><span class="glyphicon glyphicon-user"></span>
								Profile</a></li>
					</ul>

				</div>
			</div>
		</nav>
</body>
</html>
