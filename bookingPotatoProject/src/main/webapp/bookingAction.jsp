<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import = "user.UserDAO" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id = "user" class = "user.User" scope = "page" />
<jsp:setProperty name = "user" property = "userID" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String name = (String) session.getAttribute("userID");
	String action = request.getParameter("seat1");

	Connection conn = null;
	PreparedStatement pstmt = null;

	try {
		String dbURL = "jdbc:mysql://localhost:3306/BK";
		String dbID = "root";
		String dbPassword = "luvundmisu1!";
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	String sql = "INSERT INTO seat1(name) VALUES (?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, name);
	pstmt.executeUpdate();
	pstmt.close();
	conn.close();
	%>
		
	<script>
	alert("예약완료");
	location.href = 'main.jsp';
	</script>
	
	

</body>
</html>