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

<!-- ajaxForm -->
<script src="http://malsup.github.com/min/jquery.form.min.js"></script>

<!-- 다음 주소 API -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<!-- jQuery EasyUi API -->
<link rel="stylesheet" type="text/css"
	href="/resources/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="/resources/easyui/themes/icon.css">
<script type="text/javascript"
	src="/resources/easyui/jquery.easyui.min.js"></script>

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

#leftTop>button {
	margin-left: 5px;
}

form {
	margin-bottom: 10px;
}

#phoneNum1, #phoneNum2, #phoneNum3, #telNum1, #telNum2, #telNum3 {
	text-align-last: center;
}

.leftNoPadding {
	padding-left: 0px;
}

.rightNoPadding {
	padding-right: 0px;
}
</style>

<script type="text/javascript">
	$(document)
			.ready(
					function() {
						/* 사원 검색 */
						$("#search").on("click", function() {
							if ($("#keyword").val() == "") {
								alert("검색어를 최소 1글자 이상 입력해주세요.");
							} else if ($("#keyword").val() != "")
								officerListSearch();
						});

						/* 입사일 자동 입력 */
						$("#officerInsertModal").on("click", function() {
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
						$("#stf_eml, #stf_sq1").on(
								"keyup",
								function() {
									$(this).val(
											$(this).val().replace(
													/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, ""));
								});

						/* 숫자만 입력 */
						$(
								"#phoneNum1, #phoneNum2, #phoneNum3, #telNum1, #telNum2, #telNum3")
								.on(
										"keyup",
										function() {
											$(this).val(
													$(this).val().replace(
															/[^0-9]/gi, ""));
											// 전화번호 자동 입력
											$(
													"#phoneNum1, #phoneNum2, #phoneNum3")
													.on(
															"keyup",
															function() {
																var phoneNum = $(
																		"#phoneNum1")
																		.val()
																		+ "-"
																		+ $(
																				"#phoneNum2")
																				.val()
																		+ "-"
																		+ $(
																				"#phoneNum3")
																				.val();
																$("#stf_ph")
																		.val(
																				phoneNum);
															});
											$("#telNum1, #telNum2, #telNum3")
													.on(
															"keyup",
															function() {
																var telNum = $(
																		"#telNum1")
																		.val()
																		+ "-"
																		+ $(
																				"#telNum2")
																				.val()
																		+ "-"
																		+ $(
																				"#telNum3")
																				.val();
																$("#stf_bs_ph")
																		.val(
																				telNum);
															});
										});

						// 비밀번호 자동 입력
						$("#stf_pw1")
								.on(
										"keyup",
										function() {
											if ($("#stf_pw1").val() == ""
													&& $("#stf_pw2").val() == "") {
												$("#stf_pw1_Div").removeAttr(
														"class");
												$("#stf_pw1_Span").removeAttr(
														"class");
											} else if ($("#stf_pw1").val() == $(
													"#stf_pw2").val()) {
												$("#stf_pw").val(
														$("#stf_pw1").val());
												$("#stf_pw1_Div")
														.attr("class",
																"has-success has-feedback");
												$("#stf_pw1_Span")
														.attr("class",
																"glyphicon glyphicon-ok form-control-feedback");
											} else if ($("#stf_pw1").val() != $(
													"#stf_pw2").val()) {
												$("#stf_pw").val("");
												$("#stf_pw1_Div")
														.attr("class",
																"has-error has-feedback");
												$("#stf_pw1_Span")
														.attr("class",
																"glyphicon glyphicon-remove form-control-feedback");
											}
										});

						// 비밀번호 자동 입력
						$("#stf_pw2")
								.on(
										"keyup",
										function() {
											if ($("#stf_pw2").val() == ""
													&& $("#stf_pw1").val() == "") {
												$("#stf_pw1_Div").removeAttr(
														"class");
												$("#stf_pw1_Span").removeAttr(
														"class");
											} else if ($("#stf_pw2").val() == $(
													"#stf_pw1").val()) {
												$("#stf_pw").val(
														$("#stf_pw2").val());
												$("#stf_pw1_Div")
														.attr("class",
																"has-success has-feedback");
												$("#stf_pw1_Span")
														.attr("class",
																"glyphicon glyphicon-ok form-control-feedback");
											} else if ($("#stf_pw2").val() != $(
													"#stf_pw1").val()) {
												$("#stf_pw").val("");
												$("#stf_pw1_Div")
														.attr("class",
																"has-error has-feedback");
												$("#stf_pw1_Span")
														.attr("class",
																"glyphicon glyphicon-remove form-control-feedback");
											}
										});

						// 사원번호 자동 입력
						$("#stfNumSearchBtn").on("click", function() {
							if ($("#stf_sq1").val() == "") {
								alert("사원번호를 입력해주세요.");
							} else if ($("#stf_sq1").val() != "") {
								selectStf_sq();
							}
						});

						// 사원번호 다시 체크
						$("#stf_sq1").on("keyup", function() {
							if ($("#stf_sq1").val() != $("#stf_sq").val()) {
								$("#stf_sq_Div").removeAttr("class");
								$("#stf_sq_Span").removeAttr("class");
								$("#stf_sq").val("");
							}
						});

						// 최대 입력 방지
						$("#stf_sq1").on("keyup", function() {
							if ($(this).val().length > 10) {
								$(this).val($(this).val().substring(0, 10));
							}
						});

						// 최대 입력 방지
						$(
								"#phoneNum1, #phoneNum2, #phoneNum3, #telNum1, #telNum2, #telNum3")
								.on(
										"keyup",
										function() {
											if ($(this).val().length > 4) {
												$(this)
														.val(
																$(this)
																		.val()
																		.substring(
																				0,
																				4));
											}
										});

						// 최대 입력 방지
						$("#stf_dt_add").on("keyup", function() {
							if ($(this).val().length > 33) {
								$(this).val($(this).val().substring(0, 33));
							}
						});

						/* 구성원 추가 */
						$("#officerInsert")
								.on(
										"click",
										function() {

											var emailCheck = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

											if ($("#file").val() == "") {
												alert("프로필 사진을 확인해주세요.");
												return;
											} else if ($("#stf_nm").val() == "") {
												alert("이름을 확인해주세요.");
												return;
											} else if ($("#stf_pw").val() == "") {
												alert("비밀번호를 확인해주세요.");
												return;
											} else if ($("#stf_sq").val() == "") {
												alert("사원번호를 확인해주세요.");
												return;
											} else if ($("#stf_cm_add").val() == ""
													|| $("#stf_dt_add").val() == "") {
												alert("주소를 확인해주세요.");
												return;
											} else if (!emailCheck.test($(
													"#stf_eml").val())) {
												alert("이메일을 확인해주세요.");
												return;
											} else if ($("#stf_ph").val().length != 13) {
												alert("휴대폰 번호를 확인해주세요.");
												return;
											} else if ($("#stf_ent").val() == "") {
												alert("입사일을 확인해주세요.");
												return;
											}

											officerInsert();
										});

						/* 파일(이미지) 미리보기 */
						$("#file").on("change", function(event) {
							var input = this;

							if (input.files && input.files[0]) {
								var reader = new FileReader();

								reader.onload = function(e) {
									$('#imgView').attr('src', e.target.result);
								}
								reader.readAsDataURL(input.files[0]);
							}
						});

					});

	/* 사원 검색 */
	function officerListSearch() {

		var params = {
			cate : $("#cate").val(),
			keyword : $("#keyword").val()
		};

		$
				.ajax({
					url : "/admin/officerListSearch",
					type : "POST",
					dataType : "json",
					data : JSON.stringify(params),
					contentType : "application/json; charset=UTF-8",
					beforeSend : function() {
						$("#userCount").empty();
						$("#officerList > tbody").empty();
					},
					success : function(data) {

						var officerListCount = data.officerListCount;
						var officerList = data.officerList;

						$("#userCount").html(officerListCount.COUNT);

						var tbody = $("#officerList > tbody");

						$
								.each(
										officerList,
										function(idx, val) {
											tbody
													.append($('<tr>')
															.append(
																	$(
																			'<td>',
																			{
																				html : "<input type='radio' class='radio' value='"+val.STF_SQ+"'>"
																			}))
															.append(
																	$(
																			'<td>',
																			{
																				html : "<img src='"+val.STF_PT_RT+"' />"
																			}))
															.append(
																	$(
																			'<td>',
																			{
																				text : val.STF_NM
																			}))
															.append(
																	$(
																			'<td>',
																			{
																				text : val.RNK_NM
																			}))
															.append(
																	$(
																			'<td>',
																			{
																				text : val.DPT_NM
																			}))
															.append(
																	$(
																			'<td>',
																			{
																				text : val.ADMN_PW
																			}))
															.append(
																	$(
																			'<td>',
																			{
																				text : val.STF_PH
																			}))
															.append(
																	$(
																			'<td>',
																			{
																				text : val.STF_BS_PH
																			}))
															.append(
																	$(
																			'<td>',
																			{
																				text : val.STF_EML
																			})));
										});
					},
					error : function(request, status, error) {
						alert("list search fail :: error code: "
								+ request.status + "\n" + "error message: "
								+ error + "\n");
					}
				});
	}

	// 사원번호 중복 검색
	function selectStf_sq() {
		var params = {
			stf_sq : $("#stf_sq1").val(),
		};

		$
				.ajax({
					url : "/admin/selectStf_Sq",
					type : "POST",
					dataType : "text",
					data : JSON.stringify(params),
					contentType : "application/json; charset=UTF-8",
					beforeSend : function() {
						$("#stf_sq").val("");
					},
					success : function(data) {

						var result = Number(data);

						if (result > 0) {
							alert("이미 존재하는 사원번호 입니다.");
							$("#stf_sq_Div").attr("class",
									"has-error has-feedback");
							$("#stf_sq_Span")
									.attr("class",
											"glyphicon glyphicon-remove form-control-feedback");
						} else if (result == 0) {
							$("#stf_sq").val($("#stf_sq1").val());

							$("#stf_sq_Div").attr("class",
									"has-success has-feedback");
							$("#stf_sq_Span")
									.attr("class",
											"glyphicon glyphicon-ok form-control-feedback");
						}
					},
					error : function(request, status, error) {
						alert("list search fail :: error code: "
								+ request.status + "\n" + "error message: "
								+ error + "\n");
					}
				});
	}

	// 사원 등록 Ajax 파일 업로드
	function officerInsert() {

		var params = {
			stf_sq : $("#stf_sq").val(),
			admn_sq : $("#admn_sq").val(),
			dpt_sq : $("#dpt_sq").val(),
			rnk_sq : $("#rnk_sq").val(),
			stf_nm : $("#stf_nm").val(),
			stf_pw : $("#stf_pw").val(),
			stf_ph : $("#stf_ph").val(),
			stf_cm_add : $("#stf_cm_add").val(),
			stf_dt_add : $("#stf_dt_add").val(),
			stf_bs_ph : $("#stf_bs_ph").val(),
			stf_eml : $("#stf_eml").val(),
			stf_ent : $("#stf_ent").val(),
		};

		$("#officerInsertForm").ajaxForm(
				{
					url : "/admin/officerInsert",
					type : "POST",
					dataType : "text",
					data : JSON.stringify(params),
					enctype : "multipart/form-data",
					contentType : "application/json; charset=UTF-8",
					beforeSend : function() {
						$("#officerInsert").attr("disabled", "disabled");
					},
					success : function(data) {
						if (data == "SUCCESS") {
							alert("정상적으로 입력되었습니다.");
							window.location = "/admin/officerList";
						} else if (data == "FAIL") {
							alert("입력을 실패하였습니다.");
						}
					},
					error : function(request, status, error) {
						alert("list search fail :: error code: "
								+ request.status + "\n" + "error message: "
								+ error + "\n");
					}
				}).submit();

		$("#officerInsert").attr("disabled");
	}

	/* 다음 주소 API */
	function addrSearch() {
		new daum.Postcode({
			oncomplete : function(data) {
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
			<c:import url="../import/nav.jsp" />
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
							<form id="officerInsertForm" action="/admin/officerInsert"
								method="post" enctype="multipart/form-data">
								<tbody>
									<tr>
										<th class="text-center"><img id="imgView"
											src="/resources/img/user.png"> <input type="file"
											id="file" name="file" class="form-control"></th>
										<td>
											<h5>이미지는 가로 96px, 세로 128px를 준수 해주시기 바랍니다.</h5>
											<h5>(*)이 작성된 칸은 필수항목 입니다.</h5>
										</td>
									</tr>
									<tr>
										<th>이름(*)</th>
										<td><input type="text" id="stf_nm" name="stf_nm"
											class="form-control" placeholder="이름"></td>
									</tr>
									<tr>
										<th>비밀번호(*)</th>
										<td>
											<div id="stf_pw1_Div">
												<input type="password" id="stf_pw1" class="form-control"
													placeholder="비밀번호"> <span id="stf_pw1_Span"></span>
											</div>
										</td>
									</tr>
									<tr>
										<th>비밀번호 확인(*)</th>
										<td><input type="password" id="stf_pw2"
											class="form-control" placeholder="비밀번호 확인"> <input
											type="hidden" id="stf_pw" name="stf_pw" class="form-control"
											placeholder="비밀번호"></td>
									</tr>
									<tr>
										<th>사원번호(*)</th>
										<td>
											<div class="col-sm-9 col-md-10 leftNoPadding">
												<div id="stf_sq_Div">
													<input type="text" id="stf_sq1" class="form-control"
														placeholder="사원번호"> <span id="stf_sq_Span"></span>
												</div>
											</div>

											<button type="button" id="stfNumSearchBtn"
												class="btn btn-default col-sm-3 col-md-2">중복확인</button> <input
											type="hidden" id="stf_sq" name="stf_sq" class="form-control">
										</td>
									</tr>
									<tr>
										<th>권한(*)</th>
										<td><select id="admn_sq" name="admn_sq"
											class="form-control">
												<c:forEach items="${selectAdmn_Tb}" var="map">
													<option value="${map.ADMN_SQ}">${map.ADMN_PW}</option>
												</c:forEach>
										</select></td>
									</tr>
									<tr>
										<th>부서(*)</th>
										<td><select id="dpt_sq" name="dpt_sq"
											class="form-control">
												<c:forEach items="${selectDpt_Div_Tb}" var="map">
													<option value="${map.DPT_SQ}">${map.DPT_NM}</option>
												</c:forEach>
										</select></td>
									</tr>
									<tr>
										<th>직급(*)</th>
										<td><select id="rnk_sq" name="rnk_sq"
											class="form-control">
												<c:forEach items="${selectRnk_Tb}" var="map">
													<option value="${map.RNK_SQ}">${map.RNK_NM}</option>
												</c:forEach>
										</select></td>
									</tr>
									<tr>
										<th>주소(*)</th>
										<td>

											<div class="col-sm-9 col-md-10 leftNoPadding">
												<input type="text" id="stf_cm_add" name="stf_cm_add"
													class="form-control" placeholder="주소" readonly="readonly">
											</div>
											<button type="button"
												class="btn btn-default col-sm-3 col-md-2"
												onclick="addrSearch();">주소검색</button>
										</td>
									</tr>
									<tr>
										<th>상세주소(*)</th>
										<td><input type="text" id="stf_dt_add" name="stf_dt_add"
											class="form-control" placeholder="상세주소"></td>
									</tr>
									<tr>
										<th>이메일(*)</th>
										<td><input type="email" id="stf_eml" name="stf_eml"
											class="form-control" placeholder="이메일"></td>
									</tr>

									<tr>
										<th>휴대폰(*)</th>
										<td>

											<div class="col-sm-2 col-md-2 leftNoPadding rightNoPadding">
												<select id="phoneNum1" class="form-control">
													<option value="010">010</option>
													<option value="011">011</option>
													<option value="016">016</option>
													<option value="017">017</option>
													<option value="018">018</option>
													<option value="019">019</option>
												</select>
											</div>
											<div
												class="col-sm-1 col-md-1 text-center leftNoPadding rightNoPadding">
												<h5>-</h5>
											</div>
											<div class="col-sm-4 col-md-4 leftNoPadding rightNoPadding">
												<input type="text" id="phoneNum2" class="form-control" />
											</div>
											<div
												class="col-sm-1 col-md-1 text-center leftNoPadding rightNoPadding">
												<h5>-</h5>
											</div>
											<div class="col-sm-4 col-md-4 leftNoPadding rightNoPadding">
												<input type="text" id="phoneNum3" class="form-control" />
											</div> <input type="hidden" id="stf_ph" name="stf_ph"
											class="form-control">
										</td>
									</tr>
									<tr>
										<th>내선번호</th>
										<td>
											<div class="col-sm-2 col-md-2 leftNoPadding rightNoPadding">
												<input type="text" id="telNum1" class="form-control"
													value="070" readonly="readonly" />
											</div>
											<div
												class="col-sm-1 col-md-1 text-center leftNoPadding rightNoPadding">
												<h5>-</h5>
											</div>
											<div class="col-sm-4 col-md-4 leftNoPadding rightNoPadding">
												<input type="text" id="telNum2" class="form-control" />
											</div>
											<div
												class="col-sm-1 col-md-1 text-center leftNoPadding rightNoPadding">
												<h5>-</h5>
											</div>
											<div class="col-sm-4 col-md-4 leftNoPadding rightNoPadding">
												<input type="text" id="telNum3" class="form-control" />
											</div> <input type="hidden" id="stf_bs_ph" name="stf_bs_ph"
											class="form-control">
										</td>
									</tr>
									<tr>
										<th>입사일(*)</th>
										<td><input type="date" id="stf_ent" name="stf_ent"
											class="form-control" placeholder="입사일"></td>
									</tr>
								</tbody>
							</form>
						</table>
					</div>
					<div class="modal-footer">
						<button type="button" id="officerInsert" class="btn btn-success">등록</button>
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
						<button type="button" class="btn btn-warning pull-right">관리</button>
					</div>
					<div>
						<ul class="easyui-tree">
							<li><span>부서명</span>
								<ul>
									<c:forEach items="${selectDpt_Div_Tb}" var="dptmap">
										<li data-options="state:'closed'"><span>${dptmap.DPT_NM}</span>
											<ul>
												<c:forEach items="${officerList}" var="stfmap">
													<c:if test="${dptmap.DPT_NM eq stfmap.DPT_NM}">
														<li>[${stfmap.DPT_NM}/${stfmap.RNK_NM}]
															${stfmap.STF_NM}</li>
													</c:if>
												</c:forEach>
											</ul></li>
									</c:forEach>
								</ul></li>
						</ul>
					</div>
				</div>
				<!-- 우측매뉴 -->
				<div id="rightMenu" class="col-sm-14 col-md-9">
					<div class="row">
						<div class="col-sm-9 col-md-6">
							<button type="button" id="officerInsertModal"
								class="btn btn-success" data-toggle="modal"
								data-target="#insertModal">구성원 추가</button>
							<button type="button" class="btn btn-warning" data-toggle="modal"
								data-target="#updateModal">구성원 수정</button>
							<!-- <button type="button" class="btn btn-danger">구성원 삭제</button> -->
						</div>
						<div class="col-sm-9 col-md-6 text-right">
							<form id="rightTop" class="form-inline" onsubmit="return false;">
								<!-- <button type="button" id="search" class="btn btn-primary">
									<span class="glyphicon glyphicon-search"></span>
								</button>
								<input id="keyword" type="text" class="form-control"
									placeholder="Search"> -->
								<select id="cate" class="form-control">
									<option value="1">이름</option>
									<option value="2">직급</option>
									<option value="3">부서</option>
								</select>

								<div class="input-group">
									<input type="text" id="keyword" class="form-control"
										placeholder="Search">
									<div class="input-group-btn">
										<button type="button" class="btn btn-default" id="search">
											<i class="glyphicon glyphicon-search"></i>
										</button>
									</div>
								</div>
							</form>
						</div>
					</div>
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
											<td><input type="radio" class="radio"
												value="${STF.STF_SQ}"></td>
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
