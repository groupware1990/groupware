<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>결재</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style type="text/css">
/* Remove the navbar's default rounded borders and increase the bottom margin */
.box {
	width: 70%;
	margin: auto; /* 화면 중앙에 배치*/
	}
.box-title{
margin: auto;
text-align:center;
}

.newBtn{
float:right;

}
.regButton{

float:right;}


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
		
		<!-- nav 종료 -->

		
		<div class="content">
	
			</div>
	<div class="row">
		<!-- left column -->	


		<div class="col-md-12">
			
	 <div class='box'>

     </div>

			<div class="box">
			<h3 class="box-title">결재</h3>
				<div class="regButton">
						<button id='newBtn'>등록</button>
				</div>
				<div class="box-body">
					
					<table class="table table-bordered">
						<tr>
							<th style="width: 50px">번호</th>
							<th>제목</th>
							<th style="width: 120px">제출자</th>
							<th style="width: 200px">결재구분</th>
							<th style="width: 80px">진행상황</th>
						</tr>

						<c:forEach items="${list}" var="approvalVO">

							<tr>
								<td>${approvalVO.apv_sq}</td>
								<td><a href='/approval/read?apv_sq=${approvalVO.apv_sq}'>${approvalVO.apv_nm}</a></td>
								<td>${approvalVO.stf_nm}</td>
								<td>${approvalVO.div_apv_nm}</td>
								<td>${approvalVO.apv_ok}</td>
							
							</tr>

						</c:forEach>

					</table>

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
	$(document).ready(
			function() {

				
				$('#newBtn').on("click", function(evt) {

					self.location = "register";

				});

			});
</script>


</html>

