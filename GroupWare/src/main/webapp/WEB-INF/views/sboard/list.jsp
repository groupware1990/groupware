<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>게시판</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style type="text/css">
/* Remove the navbar's default rounded borders and increase the bottom margin */
.box {
	width: 65%;
	margin: auto; /* 화면 중앙에 배치*/
}

.box-title {
	margin: auto;
	text-align: center;
}

.newBtn {
	float: right;
}

.regButton {
	float: right;
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
		<div>
			<c:import url="../import/nav.jsp" />
		</div>
		<!-- nav 종료 -->


		<div class="content"></div>
		<div class="row">
			<!-- left column -->


			<div class="col-md-12">

				<div class='box'></div>

				<div class="box">
					<h3 class="box-title">게시판</h3>
					<div class="regButton">
						<button type="button" class="btn btn-primary" id='newBtn'>새글등록</button>
					</div>
					<div class="box-body">

						<table class="table table-hover">
							<thead>
								<tr>
									<th style="width: 50px">번호</th>
									<th>제목</th>
									<th style="width: 120px">작성자</th>
									<th style="width: 200px">작성일</th>
									<th style="width: 80px">조회수</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list}" var="boardVO">

									<tr>
										<td>${boardVO.ntc_sq}</td>
										<td><a href='/sboard/read?ntc_sq=${boardVO.ntc_sq}'>${boardVO.ntc_nm}</a></td>
										<td>${boardVO.stf_nm}</td>
										<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
												value="${boardVO.ntc_dt}" /></td>
										<td><span class="badge bg-red">${boardVO.ntc_hits}</span></td>
									</tr>

								</c:forEach>
							</tbody>
						</table>

					</div>

					<div>
						${pageIndexList}
					</div>
				</div>
				<!-- /.box-footer-->
			</div>
		</div>


		<!-- footer 시작 -->
		<div id="footer">
			<c:import url="../import/footer.jsp" />
		</div>
		<!-- footer 종료 -->
	</div>
</body>


<script>
	var result = '${msg}';

	if (result == 'SUCCESS') {
		alert("처리가 완료되었습니다.");
	}
</script>

<script>
	$(document).ready(function() {

		$('#newBtn').on("click", function() {

			self.location = "register";

		});

	});
</script>


</html>

