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
			<c:import url="../import/header_officer.jsp" />
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
				<h3>보낸편지함</h3>
				
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
							
					</form>
					<div id="rightBottom">
						
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
								     	<th>번호</th>
										<th>제목</th>
										<th>이름</th>
										<th>발송시간</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${sndList}" var="emailVO">
										<tr valign="middle">
										 	<td>${emailVO.snd_eml_sq}</td> 
											<td>${emailVO.eml_nm}</td>
											<td>${emailVO.stf_nm}</td>
											<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
											value="${emailVO.snd_dt}"/></td>
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
