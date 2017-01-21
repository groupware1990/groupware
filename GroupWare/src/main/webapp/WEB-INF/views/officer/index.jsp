<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

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
	<div id="wrap">
		<!-- header 시작 -->
		<div>
			<c:import url="../import/header_officer.jsp" />
		</div>
		<!-- header 종료 -->


		<!-- nav 시작 -->
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
							data-toggle="dropdown" href="#">Page 2 <span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="#">Page 2-1</a></li>
								<li><a href="#">Page 2-2</a></li>
								<li><a href="#">Page 2-3</a></li>
							</ul></li>
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#">Page 3 <span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="#">Page 3-1</a></li>
								<li><a href="#">Page 3-2</a></li>
								<li><a href="#">Page 3-3</a></li>
							</ul></li>
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#">Page 4 <span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="#">Page 4-1</a></li>
								<li><a href="#">Page 4-2</a></li>
								<li><a href="#">Page 4-3</a></li>
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
		<!-- nav 종료 -->


		<!-- content 시작 -->
		<div id="content">이곳에 작성하시오.</div>
		<!-- content 종료 -->


		<!-- footer 시작 -->
		<div id="footer">
			<c:import url="../import/footer.jsp" />
		</div>
		<!-- footer 종료 -->
	</div>
</body>
</html>
