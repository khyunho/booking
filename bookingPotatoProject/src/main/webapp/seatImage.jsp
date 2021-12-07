<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String seat1 = (String) session.getAttribute("seat1");

	if(seat1 != null){
%>
		<img src = "image\seatExample2.png">
<%
	} else {
%>
		<img src="image\seatExample.png">
<% 
	}
%>
	
	<!-- null개수 아닌거 찾아서 case문 쓰면 여러개로도 구분할듯
		안돌아가는 이유 :
		seat1 db에 name이라는곳에 값이 들어가있지만
		name의 값을 가져오지 않아서 null상태
		userID는 따로 클래스로 받아왔기때문에 값이 있는상태
		따로 만들어주기만하면 동작할듯
	 -->
</body>
</html>