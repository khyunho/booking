<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "board.Board" %>
<%@ page import = "board.BoardDAO" %>


<!DOCTYPE html>
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
	if(session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userID");
	}
	if (userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요.')");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");
	}
	int boardID = 0;
	if (request.getParameter("boardID") != null) {
		boardID = Integer.parseInt(request.getParameter("boardID"));
	}
	if (boardID == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글입니다.')");
		script.println("location.href = 'reviewSeat1.jsp'");
		script.println("</script>");
	}
	Board board = new BoardDAO().getBoard(boardID);
	if (!userID.equals(board.getUserID())) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('권한이 없습니다.')");
		script.println("location.href = 'reviewSeat1.jsp'");
		script.println("</script>");
	}
%>
<div class="d-flex" id="wrapper">
            <!-- Sidebar-->
            <div class="border-end bg-white" id="sidebar-wrapper">
                <div class="sidebar-heading border-bottom bg-light">프로젝트</div>
                <jsp:include page="menu.jsp" flush = "false"></jsp:include>
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
                    <h1 class="mt-4">리뷰</h1>
                    <p style = "text-align : center;">
                    	<!-- 이부분 jsp 따로 만들기 div설정해서 네모 영역 고정 설정 후
                    		 그림 1~5까지 나눠서 설정
                    		 seat1~5까지 그림 따로 나눠서만들면 경우의 수가 줄어든다
                             ex)seat1과 3이 차있을때 seat1과 3만 색 들어오게 설정  -->
                    	<jsp:include page="seatImage.jsp" flush = "false"></jsp:include>
                    	
                    </p>
                    <div style="text-align:center;">
						<hr>
						<div class = "container">
							<form method = "post" action = "updateAction.jsp?boardID=<%=boardID %>">
								<table class = "table table-strped" style = "text-align : center; obrder : 1px solid #dddddd">
									<thead>
										<tr>
											<th colspan = "2" style = "background-color : #eeeeee; text-align : center;">게시판 글 수정 양식</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td><input type = "text" class = "form-control" placeholder = "글 제목" name = "boardTitle" maxlength = "50" value="<%= board.getBoardTitle() %>"></td>
										</tr>
										<tr>	
											<td><textarea class = "form-control" placeholder = "글 내용" name = "boardContent" maxlength = "2048" style = "height : 350px;"><%= board.getBoardContent() %></textarea></td>
										</tr>
									</tbody>
								</table>
								<input type = "submit" class = "btn btn-primary pull-right" value = "글수정">
							</form>
						</div>
					</div>
                </div>
            </div>
		</div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>