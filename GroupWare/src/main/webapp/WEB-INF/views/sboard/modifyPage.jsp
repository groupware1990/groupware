<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>게시판 수정</title>
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
.box-footer{
margin: auto; /* 화면 중앙에 배치*/
}

</style>
</head>
<body>
	<form>
		<div id="wrap">

			<div>
				<c:import url="../import/header_officer.jsp" />
			</div>

			<div id="content">
				<input type='hidden' name='ntc_sq' value="${boardVO.ntc_sq}">
				<input type='hidden' name="ntc_div_sq" id="ntc_cnt" value="${boardVO.ntc_div_sq}">

				<div class="box-body">
					<div class="form-group">
						<input type="text" name='ntc_nm' class="form-control" value="${boardVO.ntc_nm}">
					</div>
					<div class="form-group">
						<textarea name="ntc_cnt" id="ntc_cnt" rows="10" cols="100">${boardVO.ntc_cnt}</textarea>
					</div>
				</div>
			</div>
		</div>
	</form>
	<div class="box-footer">
		<button type="submit" class="btn btn-primary">확인</button>
		<button id="cancel" type="button" class="btn btn-danger">취소</button>
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
		oAppRef : oEditors,
		elPlaceHolder : "ntc_cnt",
		sSkinURI : "/resources/se2/SmartEditor2Skin.html",
		fCreator : "createSEditor2"
	});
</script>


<script>
	$(document)
			.ready(
					function() {

						var formObj = $("form[role='form']");

						console.log(formObj);

						$(".btn-warning")
								.on(
										"click",
										function() {
											self.location = "/member/list?page=${cri.page}&perPageNum=${cri.perPageNum}"
													+ "&searchType=${cri.searchType}&keyword=${cri.keyword}";
										});

						$(".btn-primary").on("click", function() {
							formObj.submit();
						});
					});
</script>


</html>

