<%@page import="kr.tracer.entity.Car"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cpath" value = "${pageContext.request.contextPath}"/>
<%
	List<Car> list = (List<Car>) request.getAttribute("t_list");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${cpath}/resources/css/main.css" />
<link rel="stylesheet" href="${cpath}/resources/css/car.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="con">
	
	
	
			<!-- Header -->
		<div id="header-wrapper">
			<header id="header" class="container">

				<!-- Logo -->
				<div id="logo">
					<h1>
						<a href="main.do">Tracer</a>
					</h1>
					<span>by exemplary citizen</span>
				</div>

				<!-- Nav -->
				<nav id="nav">
					<ul>
						<li class="current"><a href="main.do">Welcome</a></li>
						<%-- 	<li><a href="<c:url value='/Login.jsp/${vo.idx}'/>" class="btn btn-info btn-sm" role="button">Login</a></li> --%>
						<li><a href="Login.do" class="btn btn-sm"
							role="button">Login</a></li>
					</ul>
				</nav>

			</header>
		</div>
		<div class="panel panel-default">
			
			<div class="panel-body">
				<table class="table table-bordered table-hover">
					<tr id="tr1">
						<td>체납년수</td>
						<td><a href="CarView.do">체납자명</a></td>
						<td>체납액</td>
						<td>체납년수</td>
						<td>누적신고</td>
					</tr>
					<c:forEach var="cvo" items="${tlist}">
					
						<!-- ${cpath}/boardContent.do?idx=${vo.idx} 약축 시킨것-->
						<c:url var="contentLink" value="/Car.do/${cvo.default_name}"/>   <!-- 경로 설정 -->

						<tr>
							<td>${cvo.default_name}</td>
							<td><a href="${contentLink}"> ${cvo.plate_num}</a></td>
							<td>${cvo.default_money}</td>
							<td>${cvo.default_year}</td>
							<td>${cvo.report_num}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>

</body>
</html>
