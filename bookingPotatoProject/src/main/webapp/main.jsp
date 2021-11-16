<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<title>프로젝트 제목 정하기</title>
	<!-- Favicon-->
	<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
	<!-- Core theme CSS (includes Bootstrap)-->
	<link href="css/styles.css" rel="stylesheet" />
</head>
    <body>
    	<%
    		String userID = null;
    		if (session.getAttribute("userID") != null){
    			userID = (String) session.getAttribute("userID");
    		}
			if(userID == null) {
		%>    
		<jsp:include page="nonMemberHome.jsp" flush = "false"></jsp:include>
		<%
			} else{
		%>
		<jsp:include page="memberHome.jsp" flush = "false"></jsp:include>
		<%
			}
		%>      
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>
