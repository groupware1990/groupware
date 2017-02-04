<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>header_officer</title>
<style type="text/css">
/* Remove the navbar's default rounded borders and increase the bottom margin */
.navbar {
	margin-bottom: 50px;
	border-radius: 0;
}

/* Remove the jumbotron's default bottom margin */
.jumbotron {
	margin-bottom: 0;
}

/* Add a gray background color and some padding to the footer */
#footer {
	margin-top: 50px;
	background-color: #f2f2f2;
	padding: 25px;
}
</style>

</head>
<body>
	<div class="jumbotron">
		<div class="container text-center">
			<h1>임직원 페이지</h1>
			<p>임직원 페이지에 오신 것을 환영합니다.</p>
		</div>
	</div>
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
							data-toggle="dropdown" href="#">Page 1 <span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="#">Page 1-1</a></li>
								<li><a href="#">Page 1-2</a></li>
								<li><a href="#">Page 1-3</a></li>
							</ul></li>
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#">전자결재<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="/approval/list?div_apv_sq=1">업무</a></li>
								<li><a href="/approval/list?div_apv_sq=2">파견</a></li>
								<li><a href="/approval/list?div_apv_sq=3">경비지출</a></li>
								<li><a href="/approval/list?div_apv_sq=4">초과근무</a></li>
								<li><a href="/approval/list?div_apv_sq=5">휴가</a></li>
							</ul></li>
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#">Page 3 <span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="#">Page 3-1</a></li>
								<li><a href="#">Page 3-2</a></li>
								<li><a href="#">Page 3-3</a></li>
							</ul></li>
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#">게시판<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="/sboard/list?ntc_div_sq=1">자유게시판</a></li>
								<li><a href="/sboard/list?ntc_div_sq=2">사내동호회</a></li>
								<li><a href="/sboard/list?ntc_div_sq=3">중고장터</a></li>
							</ul></li>
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#">Page 5 <span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="#">Page 5-1</a></li>
								<li><a href="#">Page 5-2</a></li>
								<li><a href="#">Page 5-3</a></li>
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
