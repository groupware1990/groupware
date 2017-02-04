<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>구성원 관리</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- 다음 주소 API -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

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
	$(document).ready(function() {
		/* 사원 검색 */
		$("#search").on("click", function() {
			if ($("#keyword").val() == "") {
				alert("검색어를 최소 1글자 이상 입력해주세요.");
			}
			else if ($("#keyword").val() != "")
				officerListSearch();
		});
		
		/* 입사일 자동 입력 */
		$("#officerInsert").on("click", function() {
			var date = new Date();
			
			var yyyy = date.getFullYear();
			var mm = (date.getMonth() + 1)
			var dd = date.getDate();
			
			if (mm < 10) {
				mm = "0" + mm;
			}
			if (dd < 10) {
				dd = "0" + dd;
			}
			
			date = yyyy + "-" + mm + "-" + dd;
						
			$("#stf_ent").val(date);
		});
		
		/* 한글 입력 방지 */
		$("#stf_eml, #stf_sq").on("keyup", function() {
			$(this).val($(this).val().replace(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g,""));
		});
		
		/* 최대 입력 방지 */
		$("#stf_sq").on("keyup", function() {
			if ($(this).val().length > 10) {
				$(this).val($(this).val().substring(0, 10));	
			}
		});
		
		$("#stf_dt_add").on("keyup", function() {
			if ($(this).val().length > 33) {
				$(this).val($(this).val().substring(0, 10));	
			}
		});
	});
	
	/* 사원 검색 */
	function officerListSearch() {
		
		var params = {
				cate : $("#cate").val(),
				keyword : $("#keyword").val()
		};
		
		$.ajax({
			url: "/admin/officerListSearch",
			type: "POST",
			dataType: "json",
		    data : JSON.stringify(params),
		    contentType: "application/json; charset=UTF-8",
		    beforeSend : function() {
		    	$("#userCount").empty();
		    	$("#officerList > tbody").empty();
		    },
		    success: function(data) {
		    	
		    	var officerListCount = data.officerListCount;
		    	var officerList = data.officerList;
		    
		    	$("#userCount").html(officerListCount.COUNT);
		    	
		    	var tbody = $("#officerList > tbody");
		    	
		    	$.each(officerList, function(idx, val) {
		    		tbody.append(
	    				$('<tr>').append($('<td>', {html : "<input type='radio' class='radio' value='"+val.STF_SQ+"'>"}))
	    						 .append($('<td>', {html : "<img src='"+val.STF_PT_RT+"' />"}))
	    						 .append($('<td>', {text : val.STF_NM}))
	    						 .append($('<td>', {text : val.RNK_NM}))
	    						 .append($('<td>', {text : val.DPT_NM}))
	    						 .append($('<td>', {text : val.ADMN_PW}))
	    						 .append($('<td>', {text : val.STF_PH}))
	    						 .append($('<td>', {text : val.STF_BS_PH}))
	    						 .append($('<td>', {text : val.STF_EML}))
	    			);
		    	});	
		    },
		    error: function(request, status, error) {
		    	alert("list search fail :: error code: " + request.status + "\n" + "error message: " + error + "\n");
		    }
		});	
	}
	
	/* 다음 주소 API */
	function addrSearch() {
		 new daum.Postcode({
		        oncomplete: function(data) {
		            var str = "[" + data.zonecode + "] " + data.address 
		        	$("#stf_cm_add").val(str);
		            $("#addrSub").focus();
		        }
		    }).open();
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
			<c:import url="../import/nav_admin.jsp" />
		</div>
		<!-- nav 종료 -->

		<!-- Modal -->
		<div class="modal fade" id="insertModal" role="dialog">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">구성원 추가</h4>
					</div>
					<div class="modal-body">
						
						<table class="table table-striped table-bordered">
							<colgroup>
								<col width="30%" />
								<col width="70%" />
							</colgroup>
							<thead>
							</thead>
							<tbody>
								<tr>
									<th class="text-center">
										<img src="/resources/img/user.png">
										<input type="file" class="form-control">
									</th>
									<td><input type="text" class="form-control" placeholder="이름"></td>
								</tr>
								<tr>
									<th>이름(*)</th>
									<td><input type="text" id="stf_nm" class="form-control" placeholder="이름"></td>
								</tr>
								<tr>
									<th>비밀번호(*)</th>
									<td><input type="password" id="stf_pw" class="form-control" placeholder="비밀번호"></td>
								</tr>
								<tr>
									<th>사원번호(*)</th>
									<td><input type="text" id="stf_sq" class="form-control" placeholder="사원번호"></td>
								</tr>
								<tr>
									<th>권한(*)</th>
									<td>
										<select id="admn_sq" class="form-control">
											<c:forEach items="${selectAdmn_Tb}" var="map">
												<option value="${map.ADMN_SQ}">${map.ADMN_PW}</option>
											</c:forEach>
										</select>
									</td>
								</tr>
								<tr>
									<th>부서(*)</th>
									<td>
										<select id="dpt_sq" class="form-control">
											<c:forEach items="${selectDpt_Div_Tb}" var="map">
												<option value="${map.DPT_SQ}">${map.DPT_NM}</option>
											</c:forEach>
										</select>
									</td>
								</tr>
								<tr>
									<th>직급(*)</th>
									<td>
										<select id="rnk_sq" class="form-control">
											<c:forEach items="${selectRnk_Tb}" var="map">
												<option value="${map.RNK_SQ}">${map.RNK_NM}</option>
											</c:forEach>
										</select>
									</td>
								</tr>
								<tr>
									<th>주소(*)</th>
									<td><input type="text" id="stf_cm_add"  class="form-control" placeholder="주소" onclick="addrSearch();"></td>
								</tr>
								<tr>
									<th>상세주소(*)</th>
									<td><input type="text" id="stf_dt_add"  class="form-control" placeholder="상세주소"></td>
								</tr>
								<tr>
									<th>이메일(*)</th>
									<td><input type="email" id="stf_eml" class="form-control" placeholder="이메일"></td>
								</tr>
								
								<tr>
									<th>휴대폰(*)</th>
									<td><input type="text" id="stf_ph" class="form-control" placeholder="휴대폰"></td>
								</tr>
								<tr>
									<th>내선번호</th>
									<td><input type="text" id="stf_bs_ph" class="form-control" placeholder="내선번호"></td>
								</tr>
								<tr>
									<th>입사일(*)</th>
									<td><input type="date" id="stf_ent" class="form-control" placeholder="입사일"></td>
								</tr>
							</tbody>
						</table>
					
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-success" data-dismiss="modal">입력</button>
						<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>

		<!-- content 시작 -->
		<div id="content">
			<div id="title">
				<h3>구성원 관리</h3>
				구성원, 조직을 추가하거나 정보를 수정할 수 있습니다.
			</div>

			<div>
				<!-- 좌측매뉴 -->
				<div id="leftMenu" class="col-sm-4 col-md-3">
					<div id="leftTop">
						<h4>
							<label>조직도</label>
						</h4>
						<button type="button" class="btn btn-default pull-right">관리</button>
						<button type="button" class="btn btn-default pull-right">추가</button>
					</div>
					<div>조직도가 되려나</div>
				</div>
				<!-- 우측매뉴 -->
				<div id="rightMenu" class="col-sm-14 col-md-9">
					<form id="rightTop" class="form-inline">
						<button type="button" id="officerInsert" class="btn btn-success" data-toggle="modal"
							data-target="#insertModal">구성원 추가</button>
						<button type="button" class="btn btn-warning" data-toggle="modal"
							data-target="#updateModal">구성원 수정</button>
						<!-- <button type="button" class="btn btn-danger">구성원 삭제</button> -->

						<button type="button" id="search"
							class="btn btn-primary pull-right">
							<span class="glyphicon glyphicon-search"></span>
						</button>
						<input id="keyword" type="text" class="form-control pull-right"
							placeholder="구성원 검색"> <select id="cate"
							class="form-control pull-right">
							<option value="1">이름</option>
							<option value="2">직급</option>
							<option value="3">부서</option>
						</select>
					</form>
					<div id="rightBottom">
						<div>
							<label>전체 : </label> <span id="userCount">${officerListCount.COUNT}</span>명
						</div>
						<div class="table-responsive">
							<table id="officerList" class="table table-hover">
								<colgroup>
									<col width="5%" />
									<col width="96px" />
									<col width="10%" />
									<col width="10%" />
									<col width="10%" />
									<col width="10%" />
									<col width="15%" />
									<col width="15%" />
									<col width="15%" />
								</colgroup>
								<thead>
									<tr class="active">
										<th>선택</th>
										<th>사진</th>
										<th>이름</th>
										<th>직급</th>
										<th>조직</th>
										<th>권한</th>
										<th>핸드폰번호</th>
										<th>내선번호</th>
										<th>이메일</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${officerList}" var="map">
										<tr valign="middle">
											<td><input type="radio" class="radio" value="${STF.STF_SQ}"></td>
											<td><img src="${map.STF_PT_RT}" /></td>
											<td>${map.STF_NM}</td>
											<td>${map.RNK_NM}</td>
											<td>${map.DPT_NM}</td>
											<td>${map.ADMN_PW}</td>
											<td>${map.STF_PH}</td>
											<td>${map.STF_BS_PH}</td>
											<td>${map.STF_EML}</td>
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


		<!-- footer 시작 -->
		<div id="footer">
			<c:import url="../import/footer.jsp" />
		</div>
		<!-- footer 종료 -->
	</div>
</body>
</html>
