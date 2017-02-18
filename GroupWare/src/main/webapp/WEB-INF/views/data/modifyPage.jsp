<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>자료실 수정</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript"
	src="/resources/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<!--스마트에디터 -->

<style type="text/css">

	
#content {
width: 70%;
margin: auto; /* 화면 중앙에 배치*/
font-size : 120%;
width : 800px;
}
#bfooter{
margin: auto; /* 화면 중앙에 배치*/

}

</style>
</head>
<body>
	
		<div id="wrap">

			<div>
				<c:import url="../import/header_officer.jsp" />
			</div>

            <div>
			    <c:import url="../import/nav.jsp" />
		    </div>
		
		<form role="form" method="post" id="frm" action="/data/modifyPage">
		         <input type='hidden' name='data_sq' value="${dataVO.data_sq}"> 
			 
					
			<div id="content">

				<div class="box-body">
					<div class="form-group">
						<input type="text" name='data_nm' class="form-control" value="${dataVO.data_nm}">
					</div>
					<div class="form-group">
					<textarea name="data_cnt" id="data_cnt" rows="10" cols="100">${dataVO.data_cnt}</textarea>
					</div>
				</div>
			</div>
	

	       <div id="bfooter">
		       <button type="button" id="okbutton" class="btn btn-primary">확인</button>
		       <button id="cancel" type="button" class="btn btn-danger">취소</button>
	       </div>

       </form>


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
$("#okbutton").click(function(){

   //폼 submit
   $("#frm").submit();
})
</script>

<script type="text/javascript">
    	$(document).ready(function() {
			$("#cancel").click(function() {
				location.href="/date/dateList";
			});
		});
    </script>
   

</html>

