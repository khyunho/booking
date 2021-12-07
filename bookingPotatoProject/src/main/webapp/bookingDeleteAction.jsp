<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import = "java.io.PrintWriter" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file = "seatConnect.jsp" %>
<%

	String name = (String) session.getAttribute("userID");
	String seatNum = request.getParameter("seat");
	String userCheck = (String) session.getAttribute("userCheck");
		
	PreparedStatement pstmt = null;

	if(Integer.parseInt(seatNum) == 1){
		session.setAttribute("seat1", null);
		String SQL = "UPDATE user SET userCheck = ? WHERE userID = ?";
		pstmt = conn.prepareStatement(SQL);
		pstmt.setString(1, null);
		pstmt.setString(2, name);
		pstmt.executeUpdate();
		String sql = "UPDATE seat SET seat1 = ?";
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
		
	} else if (Integer.parseInt(seatNum) == 2){
		session.setAttribute("seat2", null);
		String SQL = "UPDATE user SET userCheck = ? WHERE userID = ?";
		pstmt = conn.prepareStatement(SQL);
		pstmt.setString(1, null);
		pstmt.setString(2, name);
		pstmt.executeUpdate();
		String sql = "UPDATE seat SET seat2 = ?";
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
		script.println("alert('오류')");
		script.println("location.href = 'seat.jsp'");
		script.println("</script>");
	}

%>
</body>
</html>