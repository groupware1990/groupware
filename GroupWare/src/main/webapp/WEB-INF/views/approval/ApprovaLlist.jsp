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
		<div>
			<c:import url="../import/nav_admin.jsp" />
		</div>
		<!-- nav 종료 -->

		
		
			<div class="modal fade" id="insertModal" role="dialog">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">결재등록</h4>
					</div>
					<div class="modal-body">
						
						<table class="table table-striped table-bordered">
					
							<thead>
							</thead>
							<tbody>
								<tr>
									<th class="text-center">결재파일 업로드
										<img src="/resources/img/user.png">
										<input type="file" class="form-control">
									</th>
									<td><input type="text" class="form-control" placeholder="이름"></td>
								</tr>
								<tr>
									<th>제목(*)</th>
									<td><input type="text" id="apv_nm" class="form-control" placeholder="제목"></td>
								</tr>
								<tr>
									<th>결재구분(*)</th>
									<td><select id="div_apv_sq" class="form-control" name="div_apv_sq">
									       <option value="1">업무</option>
									       <option value="2">파견</option>
									       <option value="3">경비지출</option>
									       <option value="4">초과근무</option>
									       <option value="5">휴가</option>
								        </select>
								    </td>
								</tr>
							</tbody>
						</table>
					            <tr>
									<th>사원번호(*)</th>
									<td><input type="text" id="stf_sq" class="form-control" placeholder="사원번호"></td>
								</tr>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-success" data-dismiss="modal">입력</button>
						<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>
		
		
		
		<div class="content">
	

		<div class="col-md-12">
			
	        <div id="title">
				<h3>결재목록</h3>
			</div>

			<div class="box">
			<h3 class="box-title">결재</h3>
				<div class="regButton">
						<button id='newBtn'>등록</button>
				</div>
				<div class="box-body">
					
					<table id="officerList" class="table table-hover">
								<colgroup>
									<col width="10%" />
									<col width="60%" />
									<col width="10%" />
									<col width="10%" />
									<col width="10%" />
									
								</colgroup>
								<thead>
									<tr class="active">
										<th>번호</th>
										<th>제출자</th>
										<th>결재구분</th>
										<th>진행상황</th>
										<th>조직</th>
									
									</tr>
								</thead>
					
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

