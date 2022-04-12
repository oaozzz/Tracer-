<%@page import="kr.board.entity.Board"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${cpath}/resources/css/main.css" />
<link rel="stylesheet" href="${cpath}/resources/css/login.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		// 서버와 통신을 한다(게시판리스트를 요청) : boardAjaxList.do
		boardList();

	});
	function boardList() {
		$.ajax({
			url : "${cpath}/board",
			type : "get",
			dataType : "json",
			success : callBack,
			error : function() {
				alert("error");
			}
		});
	}
</script>


</head>
<body style="background: coral;">

	<div id="outer">
		<div id="header-wrapper">
			<header id="header" class="container">
				<!-- Logo -->
				<div id="logo">
					<h1>
						<a href="index.html">Tracer</a>
					</h1>
					<span>by exemplary citizen</span>
				</div>

				<!-- Nav -->
				<nav id="nav">
					<ul>
						<li class="current"><a href="index.html">Welcome</a></li>
						<li><a href="<c:url value='/Login.jsp/${vo.idx}'/>"
							class="btn btn-info btn-sm" role="button">Login</a></li>
					</ul>
				</nav>

			</header>
		</div>
	</div>



	<div class="container">
		<div id="banner" class="box">
			<div class="logintop">
				<c:if test="${empty mvo}">
					<!-- if문 -->
					<form class="form-inline" action="${cpath}/login.do" method="post">
						<div class="form-group">
							<label for="memId">아이디:</label> <input type="text" class=""
								id="memId" name="memId">
						</div>
						<div class="">
							<label for="memPwd">&nbsp;비밀번호:</label> <input type="password"
								class="" id="memPwd" name="memPwd">
						</div>
						<button type="submit" class="">Login</button>
					</form>
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>