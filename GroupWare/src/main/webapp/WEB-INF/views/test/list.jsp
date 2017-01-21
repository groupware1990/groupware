<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		var params = {
			param : "param",
			text : "text"
		}
		
		function test() {
			$.ajax({
			    url: "/test/console",
			    dataType: "json",
			    type: "POST",
			    data : JSON.stringify(params),
			    contentType: "application/json; charset=utf-8",
			    beforeSend : function() {
			    },
			    success: function(data) {
			    	console.log(data);
			    },
			    error: function(request, status, error) {
			    	alert("list search fail :: error code: " + request.status + "\n" + "error message: " + error + "\n");
			    }
			});	
		}
			
		$("div").click(function() {
			test();
		});

	});
</script>
</head>
<body>

<div> <c:import url="../include/footer.jsp" /> </div>
<div> hi </div>
<div> hello </div>


</body>
</html>
