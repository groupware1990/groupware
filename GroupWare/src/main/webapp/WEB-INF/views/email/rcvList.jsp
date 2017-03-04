<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>받은편지함</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- 다음 주소 API -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<style type="text/css">

#footer {
	margin-top: 50px;
	background-color: #f2f2f2;
	padding: 25px;
}

#content {
	margin-left: 50px;
	margin-right: 50px;
	overflow: hidden;
}

#title {
	border-bottom: 2px solid #727377;
}

#title>*, #leftTop>* {
	display: inline-block;
}

#leftMenu, #rightMenu {
	margin-top: 10px;
}

#leftTop>button, #rightTop>input {
	margin-left: 5px;
}

form {
	margin-bottom: 10px;
}
</style>

<script type="text/javascript">
	
	$(document).ready(function () {

		$("#okbutton").click(function(){
		   
		   $("#frm").submit();
		});
		
		/*체크박스 클릭했을때 eml_sq 값을 가져옴*/
		$(".eml_rm").on("click", function() {
			var eml = $(this).attr("data-value");
			
			 $("#div1").val(eml);
			 console.log(eml);
		});
		
		/*보관처리*/
		$("#emlKeep").on("click", function() {
			    
			var eml = $("#div1").val();
			emailKeep(eml);
		          });
		
		function emailKeep(eml) {

			var params = {
				eml_sq : eml
			};
			
			$.ajax({
				url: "/email/emailKeep",
				type: "POST",
				dataType: "text",
			    data : JSON.stringify(params),
			    contentType: "application/json; charset=UTF-8",
			    success: function(result) {
				    if(result=='SUCCESS'){
				    	alert("보관함으로 이동하었습니다");
				    	window.location.reload();
				    }
			    }
			});
		}

		
		/*메일 삭제*/
		$("#emlRemove").on("click", function() {
			var eml = $("#div1").val();
			emailRemove(eml);
		});
		
		function emailRemove(eml) {

			var params = {
				eml_sq : eml	
			};
			
			$.ajax({
				url: "/email/emailRemove",
				type: "POST",
				dataType: "text",
			    data : JSON.stringify(params),
			    contentType: "application/json; charset=UTF-8",
			    success: function(result) {
			    if(result=='SUCCESS'){
			    	alert("삭제되었습니다");
			    	window.location.reload();
			   	
			    }
			    }
			});
		}

		/* 메일 조회 */ 
		$(".eml_rd").on("click", function() {
			var eml = $(this).attr("data-value");   //attr도 map과 같은 구조인데 키값만 넣으면 그 값을 갖고 오라는 뜻
			
			emailRead(eml);
		});

		function emailRead(eml) {

			var params = {
				eml_sq : eml	
			};
			
			$.ajax({
				url: "/email/emailRead",
				type: "POST",
				dataType: "json",
			    data : JSON.stringify(params),
			    contentType: "application/json; charset=UTF-8",
			    beforeSend : function() {
			    	$("#eml_pl_nm1").empty();
			    	$("#eml_nm1").empty();
			    	$("#eml_cnt1").empty();
			    	$("#stf_nm1").empty();
			    	$("#rcv_dt1").empty();
			    	$("#eml_pl_crs1").empty();
			    	
			    	
			    },
			    success: function(data) {
			    
			    	var eml_pl_nm = data.eml_pl_nm;
			    	var eml_nm = data.eml_nm;
			        var eml_cnt = data.eml_cnt;
			    	var stf_nm = data.stf_nm;
			    	var rcv_dt = data.rcv_dt;
			    	var eml_pl_crs = data.eml_pl_crs;
			    	
			    	$("#eml_pl_nm1").text(eml_pl_nm);
			    	$("#eml_nm1").text(eml_nm);
			 	    $("#eml_cnt1").text(eml_cnt);
			    	$("#stf_nm1").text(stf_nm);
			    	$("#rcv_dt1").text(rcv_dt);
			    	$("#eml_pl_crs1").text(eml_pl_crs);
			    
			    },
			    error: function(request, status, error) {
			    	alert("list search fail :: error code: " + request.status + "\n" + "error message: " + error + "\n");
			    }
			});	
		}
		
		

		
		}); 
</script>
<script>
	var result = '${msg}';

	if (result == 'SUCCESS') {
		alert("처리가 완료되었습니다.");
	}
</script>

</head>
<body>
	<div id="wrap">
		<!-- header 시작 -->
		<div>
			<c:import url="../import/header_admin.jsp" />
		</div>
		<!-- header 종료 -->

		<!-- nav 시작 -->
		<div>
			<c:import url="../import/nav.jsp" />
		</div>
		<!-- nav 종료 -->

		<!-- 편지쓰기 Modal 시작 -->
		<div class="modal fade" id="insertModal" role="dialog">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">편지쓰기</h4>
					</div>
					<div class="modal-body">
						<form role="form" id="frm" method="post" action="/email/register">

							<table class="table table-striped table-bordered">
								<colgroup>
									<col width="30%" />
									<col width="70%" />
								</colgroup>
								<thead>
								</thead>
								
							 
								<tbody>
									<tr>
										<th class="text-center"><img
											src="/resources/img/user.png"> <input type="file"
											id="eml_pl_crs" name="eml_pl_crs" class="form-control">
										</th>
										<td><input type="text" class="form-control"
											id="eml_pl_nm" name="eml_pl_nm" placeholder="파일이름"></td>
									</tr>
									<tr>
										<th>제목(*)</th>
										<td><input type="text" id="eml_nm" name="eml_nm"
											class="form-control" placeholder="이름"></td>
									</tr>
									<tr>
										<th>내용(*)</th>
										<td>
										<textarea id="eml_cnt" name="eml_cnt" rows="5"
											class="form-control" placeholder="내용을 입력해 주세요."></textarea></td>
									</tr>
									<tr>
										<th>받는사원번호(*)</th>
										<td><input type="text" id="stf_rcv_sq" name="stf_rcv_sq"
											class="form-control" placeholder="받는사원번호"></td>
									</tr>
									<tr>
										<th>내사원번호(*)</th>
										<td><input type="text" id="stf_snd_sq" name="stf_snd_sq"
											class="form-control" placeholder="내사원번호"></td>
									</tr>
								</tbody>
							</table>
						</form>

					</div>
					<div class="modal-footer">
						<button type="button" id="okbutton" class="btn btn-success" data-dismiss="modal">입력</button>
						<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>
		<!--편지쓰기 Modal 종료 -->

		<!-- content 시작 -->
		<div id="content">
			<div id="title">
				<h3>받은편지함</h3>

			</div>

			<div>
				<!-- 좌측매뉴 -->
				<div id="leftMenu" class="col-sm-4 col-md-3">
					<div id="leftTop">
						<h4>
							<label>편지함카테고리</label>
						</h4>
						<button type="button" class="btn btn-default pull-right">관리</button>
					</div>

				</div>
				<!-- 우측매뉴 -->
				<div id="rightMenu" class="col-sm-14 col-md-9">
					<form id="rightTop" class="form-inline">
						<button type="button" id="officerInsert" class="btn btn-success"
							data-toggle="modal" data-target="#insertModal">편지쓰기</button>
						<button type="button" id="emlRemove" class="btn btn-danger">편지삭제</button>
						<button type="button" id="emlKeep" class="btn btn-warning">보관하기</button>

						<button type="button" id="search" class="btn btn-primary pull-right">
							<span class="glyphicon glyphicon-search"></span>
						</button>
						<input id="keyword" type="text" class="form-control pull-right"
							placeholder="구성원 검색"> <select id="cate"
							class="form-control pull-right">
							<option value="1">이름</option>
							<option value="2">제목</option>

						</select>
					</form>
					<div id="rightBottom">
					          <form role="form"> 											
					                     <input id='div1' type='hidden' value="${emailVO.eml_sq}">
				              </form>

						<div class="table-responsive">
							<table id="officerList" class="table table-hover">
								<colgroup>
									<col width="30px" />
									<col width="250px" />
									<col width="60px" />
									<col width="100px" />
								</colgroup>
								<thead>
									<tr class="active">
										<th>선택</th>
										<th>제목</th>
										<th>이름</th>
										<th>수신시간</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${rcvList}" var="emailVO">
										<tr class="eml_rd" data-value="${emailVO.eml_sq}" valign="middle">
											<td class="eml_rm" data-value="${emailVO.eml_sq}"><input type="checkbox" class="check"
												 value="${emailVO.eml_sq}"></td>
											<td><a href='#' data-toggle="modal"
												data-target="#readModal">${emailVO.eml_nm}</a></td>
											<td>${emailVO.stf_nm}</td>
											<td>${emailVO.rcv_dt}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- content 종료 -->

		<!-- 조회모달 시작 -->
		<div class="modal fade" id="readModal" role="dialog">

			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">편지조회</h4>
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
									<td id="eml_pl_nm1">${emailVO.eml_pl_nm}</td>
								</tr>
								<tr>
									<th>제목</th>
									<td id="eml_nm1">${emailVO.eml_nm}</td>
								</tr>
								<tr>
									<th>내용</th>
									<td><textarea id="eml_cnt1" readonly="readonly" rows="10" style=width:100%;>
									${emailVO.eml_cnt}</textarea><td>
								</tr>
								<tr>
									<th>보낸사람</th>
									<td id="stf_nm1">${emailVO.stf_nm}</td>
								</tr>
								<tr>
									<th>받은시간</th>
									<td id="rcv_dt1">${emailVO.rcv_dt}</td>
								</tr>	
								<tr>
									<th>첨부파일</th>
									<td id="eml_pl_crs1"><a href="#">${emailVO.eml_pl_crs}</a></td>
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
</html>
