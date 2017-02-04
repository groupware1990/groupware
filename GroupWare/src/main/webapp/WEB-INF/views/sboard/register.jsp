<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>게시글 등록</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/resources/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>  <!--스마트에디터 -->

<style type="text/css">
/* Remove the navbar's default rounded borders and increase the bottom margin */
.box-body {
	
	margin: auto; /* 화면 중앙에 배치*/
	width : 730px;
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
		
		<!-- nav 종료 -->


		<!-- content 시작 -->

	

	<form role="form" method="post" id="frm">
	<div class ="box-body">
		
		<input type="text" name='ntc_nm' class="form-control" placeholder="제목을 입력해 주세요.">
        <textarea name="ntc_cnt" id="ntc_cnt" rows="10" cols="100"></textarea>
        <input type="text" name='stf_sq' class="form-control" placeholder="사원번호">
        <input type="text" name='ntc_div_sq' class="form-control" placeholder="게시판구분번호">
	</div>

   <div class="box-footer">
		<button type="submit" class="btn btn-primary">확인</button>
		<button id="cancel" type="button" class="btn btn-danger">취소</button>
   </div>
		<!-- content 종료 -->


    </form>
</div>

	

		<!-- footer 시작 -->
		<div id="footer">
			<c:import url="../import/footer.jsp" />
		</div>
		<!-- footer 종료 -->

</body>
<script>
	var result = '${msg}';

	if (result == 'SUCCESS') {
		alert("처리가 완료되었습니다.");
	}
</script>

<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
    oAppRef: oEditors,
    elPlaceHolder: "ntc_cnt",
    sSkinURI: "/resources/se2/SmartEditor2Skin.html",
    tParams : {
    	  // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
        bUseToolbar : true,             
        // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
        bUseVerticalResizer : true,     
        // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
        bUseModeChanger : true, }
});
//전송버튼 클릭이벤트
$("#submit").click(function(){
    //id가 smarteditor인 textarea에 에디터에서 대입
   oEditors.getById["ntc_cnt"].exec("UPDATE_CONTENTS_FIELD", []);
     
    //폼 submit
    $("#frm").submit();
})
  function getContextPath() {
    return window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
    }

</script>

    <script type="text/javascript">
    	$(document).ready(function() {
			$("#cancel").click(function() {
				location.href="/sboard/list?ntc_div_sq=1";
			});
		});
    </script>

</html>

