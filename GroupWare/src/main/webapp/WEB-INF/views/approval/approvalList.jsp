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

<script type="text/javascript">

$(document).ready(function () {

$("#okbutton").click(function(){
   
   $("#frm").submit();
});


 $(".apv_sq_rd").on("click", function() {
	var apv = $(this).attr("data-value");   //attr도 map과 같은 구조인데 키값만 넣으면 그 값을 갖고 오라는 뜻
	
	approvalRead(apv);
});

function approvalRead(apv) {

	var params = {
		apv_sq : apv	
	};
	
	$.ajax({
		url: "/approval/approvalRead",
		type: "POST",
		dataType: "json",
	    data : JSON.stringify(params),
	    contentType: "application/json; charset=UTF-8",
	    beforeSend : function() {
	    	$("#apv_pl_nm1").empty();
	    	$("#apv_nm1").empty();
	    	$("#div_apv_nm").empty();
	    	$("#stf_nm").empty();
	    	$("#mid_nm").empty();
	    	$("#apv_ok").empty();
	    },
	    success: function(data) {
	    	console.log(data);
	    	
	    	var apv_pl_nm = data.apv_pl_nm;
	    	console.log(apv_pl_nm);
	    	var apv_nm = data.apv_nm;
	    	console.log(apv_nm);
	        var apv_ok = data.apv_ok;
	        console.log(apv_ok);
	    	var div_apv_nm = data.div_apv_nm;
	    	console.log(div_apv_nm);
	    	var stf_nm = data.stf_nm;
	    	console.log(stf_nm);
	    	var mid_nm = data.mid_nm;
	    	console.log(mid_nm);
	    	
	    	$("#apv_pl_nm1").text(apv_pl_nm);
	    	console.log($("#apv_pl_nm").text());
	    	$("#apv_nm1").text(apv_nm);
	    	console.log($("#apv_nm").text());
	 	    $("#div_apv_nm").text(div_apv_nm);
	    	$("#stf_nm").text(stf_nm);
	    	$("#mid_nm").text(mid_nm);
	    	$("#apv_ok").text(apv_ok);
	    	
	    	
	    },
	    error: function(request, status, error) {
	    	alert("list search fail :: error code: " + request.status + "\n" + "error message: " + error + "\n");
	    }
	});	
}






}); 
</script>




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


		<!--결재 모달창 시작 -->

		<div class="modal fade" id="insertModal" role="dialog">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">

					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">결재등록창</h4>
					</div>

					<div class="modal-body">

						<form role="form" id="frm" method="post"
							action="/approval/register">
							<table class="table table-striped table-bordered">

								<colgroup>
									<col width="30%" />
									<col width="70%" />
								</colgroup>

								<tbody>
									<tr>
										<th class="text-center">결재파일 업로드 <img
											src="/resources/img/user.png"> <input type="file"
											id="apv_pl_rt" name="apv_pl_rt" class="form-control">
										</th>
										<td><input type="text" class="form-control"
											id="apv_pl_nm" name="apv_pl_nm" placeholder="파일이름"></td>
									</tr>
									<tr>
										<th>제목(*)</th>
										<td><input type="text" id="apv_nm" name="apv_nm"
											class="form-control" placeholder="제목"></td>
									</tr>
									<tr>
										<th>결재구분(*)</th>
										<td><select id="div_apv_sq" class="form-control"
											name="div_apv_sq">
												<option value="1">업무</option>
												<option value="2">파견</option>
												<option value="3">경비지출</option>
												<option value="4">초과근무</option>
												<option value="5">휴가</option>
										</select></td>
									</tr>
									<tr>
										<th>사원번호(*)</th>
										<td><input type="text" id="stf_sq" name="stf_sq"
											class="form-control" placeholder="사원번호"></td>
									</tr>
									<tr>
										<th>중간승인자(*)</th>
										<td><input type="text" id="stf_mid_sq" name="stf_mid_sq"
											class="form-control" placeholder="중간승인자 사원번호입력"></td>
									</tr>
									<tr>
										<th>최종승인자(*)</th>
										<td><input type="text" id="stf_fnl_sq" name="stf_fnl_sq"
											class="form-control" placeholder="최종승인자 사원번호입력"></td>
									</tr>
									<tr>
										<th>결재진행(*)</th>
										<td><input type="text" id="apv_ok_sq" name="apv_ok_sq"
											class="form-control" placeholder="3번으로 입력"></td>
									</tr>
								</tbody>

							</table>
						</form>
					</div>

					<div class="modal-footer">
						<button type="button" id="okbutton" class="btn btn-primary"
							data-dismiss="modal">입력</button>
						<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
					</div>

				</div>

			</div>

		</div>

		<!--결재모달창 끝  -->

		<!--결재리스트 목록 시작-->

		<div id="content">


			<div class="col-md-12">

				<div class="box">
					<form id="rightTop" class="form-inline">
						<button type="button" id="officerInsert" class="btn btn-success"
							data-toggle="modal" data-target="#insertModal">결재등록</button>
						<!-- <button type="button" id="readmodal" class="btn btn-warning"
							data-toggle="modal" data-target="#readModal">결재조회</button>
-->

						<button type="button" id="search"
							class="btn btn-primary pull-right">
							<span class="glyphicon glyphicon-search"></span>
						</button>
						<input id="keyword" type="text" class="form-control pull-right"
							placeholder="결재 검색"> <select id="cate"
							class="form-control pull-right">
							<option value="1">이름</option>
							<option value="2">직급</option>
							<option value="3">부서</option>
						</select>
					</form>
					<div class="box-body">
						<div>
							<table id="avlist" class="table table-hover">
								<colgroup>
									<col width="40px" />
									<col width="150px" />
									<col width="60px" />
									<col width="100px" />
									<col width="100px" />

								</colgroup>
								<thead>
									<tr class="active">
										<th>번호</th>
										<th>제목</th>
										<th>제출자</th>
										<th>결재구분</th>
										<th>진행상황</th>
									</tr>
								</thead>

								<tbody>

									<c:forEach items="${approvalList}" var="approvalVO">
										<tr>
											<td>${approvalVO.apv_sq}</td>
											<td><a class="apv_sq_rd" data-value="${approvalVO.apv_sq}" href='#' data-toggle="modal" data-target="#readModal">${approvalVO.apv_nm}</a></td>
											<td>${approvalVO.stf_nm}</td>
											<td>${approvalVO.div_apv_nm}</td>
											<td>${approvalVO.apv_ok}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>

				</div>
				<!-- /.box-footer-->
			</div>
		</div>
		<!--결재리스트 목록 종료-->

		<!-- 조회모달 시작 -->

		<div class="modal fade" id="readModal" role="dialog">
			<form role="form" action="modifyPage" method="post">
				<!-- form 태그 내에서 apv_sq,div_apv_sq 정보를 가지도록 작업 -->
				<input type='hidden' name='apv_sq' value="${approvalVO.apv_sq}">
				<input type='hidden' name='div_apv_sq' value="${approvalVO.div_apv_sq}">
	
			</form>
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">결재조회창</h4>
					</div>
					<div class="modal-body">

						<table class="table table-striped table-bordered">
							<colgroup>
								<col width="30%" />
								<col width="70%" />
							</colgroup>

							<tbody>
								<tr>
									<th>파일이름</th>
									<td id="apv_pl_nm1">${approvalVO.apv_pl_nm}</td>
								</tr>
								<tr>
									<th>제목</th>
									<td id="apv_nm1">${approvalVO.apv_nm}</td>
								</tr>
								<tr>
									<th>결재구분</th>
									<td id="div_apv_nm">${approvalVO.div_apv_nm}</td>
								</tr>
								<tr>
									<th>제출자</th>
									<td id="stf_nm">${approvalVO.stf_nm}</td>
								</tr>
								<tr>
									<th>중간승인자</th>
									<td id="mid_nm">${approvalVO.mid_nm}</td>
								</tr>
								<tr>
									<th>결재현황</th>
									<td id="apv_ok">${approvalVO.apv_ok}</td>
								</tr>
							</tbody>
						</table>

					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-success" data-dismiss="modal">확인</button>
						<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 조회모달 종료 -->
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



</html>

