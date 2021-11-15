<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name = "viewport" content = "width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>로그인 jsp</title>
</head>
<body>
	<div class = "container">
		<div class = "col-lg-4"></div>
		<div class = "col-lg-4">
			<div class = "jumbotron" style = "padding-top : 20px;">
				<form method = "post" action = "joinAction.jsp">
					<h3 style = "text-align : center;">회원가입 화면</h3>
					<div class = "form-group">
						<input type = "text" class = "form-control" placeholder = "아이디" 
							name = "userID" maxlength = "20">
					</div>
					<div class="form-group">
						<input type = "password" class = "form-control" placeholder = "비밀번호" 
							name = "userPassword" maxlength = "20">	
					</div>
					<div class="form-group">
						<input type = "text" class = "form-control" placeholder = "이름" 
							name = "userName" maxlength = "20">	
					</div>
					<div class="form-group">
						<input type = "email" class = "form-control" placeholder = "이메일" 
							name = "userEmail" maxlength = "20">	
					</div>
					<input type = "submit" class = "btn btn-primary form-control" value = "회원가입">
				</form>
			</div>
		</div>
		<div class = "col-lg-4"></div>
		
	</div>
	
	<!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="js/scripts.js"></script>
</body>
</html>