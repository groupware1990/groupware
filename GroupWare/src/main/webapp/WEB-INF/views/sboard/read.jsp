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
	width: 70%;
	margin: auto; /* 화면 중앙에 배치*/
	}
	
.box-body-tb {
font-size : 120%}


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


		<!-- content 시작 -->
	<!--  	<div id="content">이곳에 작성하시오.</div> -->
		<!-- content 종료 -->
		
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class='box'>
	
				<div class='box-body'>
				</div>
			</div>
			
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">게시판 조회</h3>
				</div>
				<!-- /.box-header -->

				<form role="form" action="modifyPage" method="post"> <!-- form 태그 내에서 ntc_sq,ntc_div_sq 정보를 가지도록 작업 -->
																			
					<input type='hidden' name='ntc_sq' value="${boardVO.ntc_sq}"> 
					<input type='hidden' name='ntc_div_sq' value="${boardVO.ntc_div_sq}"> 
					
				

				</form>

				<div class="box-body-tb">
				<table class="table table-bordered">
				
				<tr>
						<td width="40px">${boardVO.ntc_sq}</td>
						<td width="300px" align="center">${boardVO.ntc_nm}</td>
						<td width="100px">${boardVO.stf_nm}</td>
						<td width="100px"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${boardVO.ntc_dt}" /></td>
				        <td width="100px"> ${boardVO.ntc_div_nm}</td>
				</tr>
			    <tr>	 
						 <td colspan="5" height="350px">${boardVO.ntc_cnt}</td>
				</tr>
			    </table>
				</div>
				<!-- /.box-body -->

			  <div class="box-footer">
  
			    <button type="submit" class="btn btn-warning" id="modifyBtn">수정</button>
			    <button type="submit" class="btn btn-danger" id="removeBtn">삭제</button>
			    <button type="submit" class="btn btn-primary" id="goListBtn">목록</button>
			  </div>



			</div>
			<!-- /.box -->
		</div>
		<!--/.col (left) -->

	</div>
	<!-- /.row -->


          

	
</section>
<!-- /.content -->

<script>
$(document).ready(function(){
	
	var formObj = $("form[role='form']");                         //formObj는 위에 선언된 form 태그를 의미
                                                                  //여러 작업을하려면 현재의 조회페이지에서 수정할 수 있는 화면으로 이동해야 하기 때문에	
	console.log(formObj);                                         // 위의 form 태그의 현재 페이지 정보(ntc_sq 등 )를 가지고 태그의 속성을 수정,잔송
	
	$("#modifyBtn").on("click", function(){
		formObj.attr("action", "/sboard/modifyPage");
		formObj.attr("method", "get");		
		formObj.submit();
	});
	
	$("#removeBtn").on("click", function(){
		formObj.attr("action", "/sboard/removePage");
		formObj.submit();
	});
	
	$("#goListBtn ").on("click", function(){
		formObj.attr("method", "get");
		formObj.attr("action", "/sboard/list?ntc_div_sq=${ntc_div_sq}");
		formObj.submit();
	});
	
});
</script>

</div>
</body>
</html>