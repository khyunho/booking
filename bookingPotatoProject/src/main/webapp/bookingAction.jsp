<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import = "user.UserDAO" %>
<%@ page import = "java.io.PrintWriter" %>

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
	String userCheck = (String) session.getAttribute("userCheck");
	
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

	if(Integer.parseInt(action) == 0){
		String SQL = "UPDATE user SET userCheck = ? WHERE userID = ?";
		pstmt = conn.prepareStatement(SQL);
		pstmt.setString(1, name);
		pstmt.setString(2, name);
		pstmt.executeUpdate();
		String sql = "UPDATE seat1 SET name = ?";
		pstmt = conn.prepareStatement(sql);	
		pstmt.setString(1, name);
		pstmt.executeUpdate();
		pstmt.close();
		conn.close();
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('예약되었습니다.')");
		script.println("location.href = 'seat.jsp'");
		script.println("</script>");
		
	} else if (Integer.parseInt(action) == 1){
		String SQL = "UPDATE user SET userCheck = ? WHERE userID = ?";
		pstmt = conn.prepareStatement(SQL);
		pstmt.setString(1, null);
		pstmt.setString(2, name);
		pstmt.executeUpdate();
		String sql = "UPDATE seat1 SET name = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, null);
		pstmt.executeUpdate();
		pstmt.close();
		conn.close();
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('예약을 취소하셨습니다.')");
		script.println("location.href = 'seat.jsp'");
		script.println("</script>");
		
	} else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 예약된 좌석입니다.')");
		script.println("location.href = 'seat.jsp'");
		script.println("</script>");
	}

%>
</body>
</html>