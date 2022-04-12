<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE HTML>
<!--
	Verti by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>Verti by HTML5 UP</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${cpath}/resources/css/main.css" />
<head profile="http://www.w3.org/2005/10/profile">

</head>
<body>
	<div id="page-wrapper">

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
						<li><a href="Login.do" class="btn btn-info btn-sm"
							role="button">Login</a></li>
					</ul>
				</nav>

			</header>
		</div>

		<!-- Banner -->
		<div id="banner-wrapper">
			<div id="banner" class="box container">
				<div class="row">
					<div class="">
						<h2>Hi. This is Tracer.</h2>
						<p>black box</p>
					</div>
					<div class="">
						<ul>
							 <button type="button" onclick = "location.href = 'main.do'" class="btn btn-info btn-sm" id="carbtn">체납차량</button>
							 <br><button type="button" onclick = "location.href = 'main.do'" class="btn btn-info btn-sm" id="potholebtn">포트홀</button>
						</ul>
					</div>
				</div>
			</div>
		</div>


	</div>

	</div>

	<!-- Scripts -->

	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.dropotron.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>

</body>
</html>
