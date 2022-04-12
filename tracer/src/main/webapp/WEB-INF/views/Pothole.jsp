<%@page import="kr.tracer.entity.Pothole"%>
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
<link rel="stylesheet" href="${cpath}/resources/css/road.css" />
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
	<div id="header-wrapper">
		<header id="header" class="tainer">
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
						class="btn btn1 btn-sm" role="button">Login</a></li>
				</ul>
			</nav>
		</header>


		<nav>
			<div id="banner-wrapper">
				<div id="banner" class="box">
					<div class="solt">
						<select>
							<option value="">지역별</option>
							<option value="">날짜별</option>
						</select> <span class="searchb"><input type="search">&nbsp;&nbsp;
							<button>검색</button></span>
					</div>
					<div class="pothbox">
						<div class="aa">
							<a href=""><img id="potholeimg"
								src="resources/images/dddd.png">
								<p>사진</p></a>
						</div>
						<div class="aa">
							<a href=""><img id="potholeimg"
								src="resources/images/dddd.png">
								<p>사진</p></a>
						</div>
						<div class="aa">
							<a href=""><img id="potholeimg"
								src="resources/images/dddd.png">
								<p>사진</p></a>
						</div>

						<div class="aa">
							<a href=""><img id="potholeimg"
								src="resources/images/dddd.png">
								<p>사진</p></a>
						</div>
						<div class="aa">
							<a href=""><img id="potholeimg"
								src="resources/images/dddd.png">
								<p>사진</p></a>
						</div>
						<div class="aa">
							<a href=""><img id="potholeimg"
								src="resources/images/dddd.png">
								<p>사진</p></a>
						</div>

						<div class="aa">
							<a href=""><img id="potholeimg"
								src="resources/images/dddd.png">
								<p>사진</p></a>
						</div>
						<div class="aa">
							<a href=""><img id="potholeimg"
								src="resources/images/dddd.png">
								<p>사진</p></a>
						</div>
					</div>
				</div>
			</div>
		</nav>
</body>
</html>