<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>일정관리</title>
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

#leftMenu {
	width: 550px;
	border: 1px;
}

#rightMenu {
	width: 1200px;
	float: right;
}

#frm {
	width: 500px;
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
	  
	$("#okbutton").on("click", function() {
	
	var result = '${msg}';

	if (result == 'SUCCESS') {
		alert("처리가 완료되었습니다.");
	}
	
	});
	
	$("#okbutton").click(function(){
	   
	   //폼 submit
	   $("#frm").submit();
	})
	


	$(".scd_rd").on("click", function() {
		var bs_scd_sq = $(this).attr("data-value");
		
		scheduleRead(bs_scd_sq);
	});
	
	
	
	function scheduleRead(bs_scd_sq) {

		var params = {
			bs_scd_sq : bs_scd_sq
			
		};
		console.log(bs_scd_sq);
		
		$.ajax({
			url: "/schedule/read",
			type: "POST",
			dataType: "json",
		    data : JSON.stringify(params),
		    contentType: "application/json; charset=UTF-8",
		    beforeSend : function() {
		    	$("#bs_scd_nm").empty();
		    	$("#bs_scd_cnt").empty();
		    	$("#stf_sq").empty();
		    	
		    },
		    success: function(data) {
		    	console.log(data);
		    	
		    	var bs_scd_nm = data.bs_scd_nm;
		    	var bs_scd_cnt = data.bs_scd_cnt;
		    	var stf_sq = data.stf_sq;
		    	
		    	$("#bs_scd_nm").text(bs_scd_nm);
		    	$("#bs_scd_cnt").text(bs_scd_cnt);
		 	    $("#stf_sq").text(stf_sq);
		    	
		    	
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
			<c:import url="../import/header_admin.jsp" />
		</div>
		<!-- header 종료 -->


		<!-- nav 시작 -->
		<div>
			<c:import url="../import/nav.jsp" />
		</div>
		<!-- nav 종료 -->



		<!-- content 시작 -->
		<div id="content">

			<div id="title">
				<h2>회사일정</h2>

			</div>

			<div>
				<!-- 좌측매뉴 -->
				<div id="leftMenu" class="col-sm-4 col-md-3">
					<div id="leftTop">
						<form role="form" method="post" id="frm" action="/schedule/register">
							<div class="box-body">
								<label for="exampleInputEmail1">제목</label>
								  <input type="text" name='bs_scd_nm' class="form-control" id='bs_scd_nm'>
								<label for="exampleInputEmail1">내용</label>
								  <input type="text" name="bs_scd_cnt" class="form-control" id='bs_scd_cnt'> 
								<label for="exampleInputEmail1">사원번호</label>
								  <input type="text" name='stf_sq' class="form-control" id='stf_sq'>
								<label for="exampleInputEmail1">일정선택</label> 
								  <select id="scd_sq" class="form-control" name="scd_sq">
									<option value="1">회사일정</option>
									<option value="2">부서일정</option>
									<option value="3">개인일정</option>
								  </select> <label for="exampleInputEmail1">날짜선택</label> <input type="date"
									id="bs_scd_dt" name="bs_scd_dt">

							</div>

							<div class="box-footer">
								<button type="button" id="okbutton" class="btn btn-primary">확인</button>
								<button id="cancel" type="button" class="btn btn-danger">취소</button>
							</div>
							<!-- content 종료 -->


						</form>
					</div>

				</div>
				<!-- 우측매뉴 -->
				<div id="rightMenu" class="col-sm-14 col-md-9">
					<form id="rightTop" class="form-inline">

					</form>
					<div id="rightBottom">


						<div class="table-responsive">
							<table id="officerList" class="table table-hover">
								<colgroup>
									<col width="3%" />
									<col width="5%" />
									<col width="40%" />
									<col width="20%" />
									<col width="20%" />
								</colgroup>
								<thead>
									<tr class="active">
										<th>선택</th>
										<th>번호</th>
										<th>제목</th>
										<th>작성자</th>
										<th>일정날짜</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${scheduleList}" var="scheduleVO">
										<tr valign="middle">
											<td><input type="checkbox" class="check"></td>
											<td>${scheduleVO.bs_scd_sq}</td>
											<td><a href='#' class="scd_rd" data-value="${scheduleVO.bs_scd_sq}">${scheduleVO.bs_scd_nm}</a></td>
											<td>${scheduleVO.stf_nm}</td>
											<td>${scheduleVO.bs_scd_dt}</td>
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
	<script>
	var result = '${msg}';

	if (result == 'SUCCESS') {
		alert("처리가 완료되었습니다.");
	}
</script>
</body>
</html>
