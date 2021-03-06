<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="board.BoardDAO" %>
<%@ page import="board.Board" %>
<%@ page import="java.util.ArrayList" %>
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
	<style type = "text/css">
		a, a:hover{
			color: #000000;
			text-decoration: none;
		}
	</style>
</head>
<body>
<%
	String userID = null;
	if(session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userID");
	}
	int pageNumber = 1;
	if (request.getParameter("pageNumber") != null) {
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
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
							<table class = "table table-strped" style = "text-align : center; obrder : 1px solid %dddddd">
								<thead>
									<tr>
										<th style = "background-color : #eeeeee; text-align : center;">번호</th>
										<th style = "background-color : #eeeeee; text-align : center;">제목</th>
										<th style = "background-color : #eeeeee; text-align : center;">작성자</th>
										<th style = "background-color : #eeeeee; text-align : center;">작성일</th>
									</tr>
								</thead>
								<tbody>
									<%
										BoardDAO boardDAO = new BoardDAO();
										ArrayList<Board> list = boardDAO.getList(pageNumber);
										for(int i = 0; i < list.size(); i++){
									%>
									<tr>
										<td><%= list.get(i).getBoardID() %></td>
										<td><a href="reviewSeat1View.jsp?boardID=<%= list.get(i).getBoardID() %>"><%= list.get(i).getBoardTitle() %></a></td>
										<td><%= list.get(i).getUserID() %></td>
										<td><%= list.get(i).getBoardDate().substring(0,11) + list.get(i).getBoardDate().substring(11, 13) + "시" + list.get(i).getBoardDate().substring(14, 16) + "분" %></td>
									</tr>
									<%
										}
									%>
								</tbody>
							</table>
							<%
								if(pageNumber != 1) {
							%>
								<a href = "reviewSeat1.jsp?pageNumber=<%=pageNumber - 1%>" class="btn btn-success btn-arraw-left">이전</a>
							<%
								} if(boardDAO.nextPage(pageNumber)) {
							%>
								<a href = "reviewSeat1.jsp?pageNumber=<%=pageNumber + 1%>" class="btn btn-success btn-arraw-left">다음</a>
							<%
								}
							%>
							<a href = "reviewWrite.jsp" class = "btn btn-primary pull-right">글쓰기</a>
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