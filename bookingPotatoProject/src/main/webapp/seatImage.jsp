<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "user.UserDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	String name = (String) session.getAttribute("seat1");
	String userID = (String) session.getAttribute("userID");
	String userCheck = (String) session.getAttribute("userCheck");

	if(name != null){
%>
		<img src="image\seatExample2.png">
<%
	} else {
%>
		<img src="image\seatExample.png">
<% 
	}
%>
	
	<!-- null개수 아닌거 찾아서 case문 쓰면 여러개로도 구분할듯 -->
	
</body>
</html>