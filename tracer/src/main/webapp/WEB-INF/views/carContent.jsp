<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> <!-- 함수 태그를 쓰고 싶을 때 -->
<% pageContext.setAttribute("newLineChar", "\n"); %>
<c:set var="cpath" value = "${pageContext.request.contextPath}"/>    
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="${cpath}/resources/css/main.css" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
 
<div class="container">
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
    <div class="panel-heading">ss</div>
    <div class="panel-body">
    	<table class="table table-bordereed">
    		<tr>
    			<td colspan="4"><img id="pic" src="resources/images/carnum.jpg"><%-- ${cvo.article_file1} --%></td>
    			<td>sss</td>
    		</tr>
    		<tr>
    			<td colspan="2" align="center">
    				<a href="<c:url value='/boardDelete.do/${vo.idx}'/>" class="btn btn-warning btn-sm" role="button">삭제</a>
    				<a href="<c:url value='/boardList.do'/>" class="btn btn-info btn-sm" role="button">목록</a>
    			</td>
    			
    		</tr>
    	</table>
    </div>
  </div>
</div>

</body>
</html>
