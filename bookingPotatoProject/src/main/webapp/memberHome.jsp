<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String userID = (String) session.getAttribute("userID");
	String userCheck = (String) session.getAttribute("userCheck");
%>
<div class="d-flex" id="wrapper">
            <!-- Sidebar-->
            <div class="border-end bg-white" id="sidebar-wrapper">
                <div class="sidebar-heading border-bottom bg-light">프로젝트</div>
                <div class="list-group list-group-flush">
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="main.jsp">HOME</a>
                    
           			<%
           				if (userCheck == null){
           			%>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="seat.jsp">좌석보기</a>                
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="booking.jsp">예약하기</a>
                    <%
           				} else {
                    %>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#">좌석보기</a>                
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#">예약하기</a>
                	<%
           				}
                	%>
                
                </div>
            </div>
            <!-- Page content wrapper-->
            <div id="page-content-wrapper">
                <!-- Top navigation-->
                <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
                    <div class="container-fluid">
                        <button class="btn btn-primary" id="sidebarToggle">열고닫기(색바꾸기)</button>
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" 
                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span></button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav ms-auto mt-2 mt-lg-0">
                                <li class="nav-item active"><a class="nav-link" href="logoutAction.jsp">로그아웃</a></li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" 
                                    data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><%=userID %>님</a>
                                    <div class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="#!">예약현황</a>
                                        <a class="dropdown-item" href="#!">내정보</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="#!"></a>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
                <!-- Page content-->
                <div class="container-fluid">
                    <h1 class="mt-4">메인</h1>
                    <p>
                    	<%=userID %>님 안녕하세요
                    	<br>
                        HOME 화면입니다.
                    </p>
                </div>
            </div>
		</div>
</body>
</html>