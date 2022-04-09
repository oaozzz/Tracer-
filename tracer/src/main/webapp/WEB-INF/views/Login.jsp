<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${cpath}/resources/css/main.css" />
<head profile="http://www.w3.org/2005/10/profile">
</head>
<body>
		<h2>Tracer</h2>
	<div class="">
		<div class="">
			<c:if test="${empty avo}">
				<form class="" action="${cpath}/login.do" method="post">
					<div class="">
						<label for="ad_id">아이디:</label> <input type="text"
							class="" id="ad_id" name="ad_id">
					</div>
					<br>
					<div class="">
						<label for="ad_pw">&nbsp;비밀번호:</label> <input type="password"
							class="" id="ad_pw" name="ad_pw">
					</div>
					<button type="submit" class="">Login</button>
				</form>
			</c:if>
		</div>
	</div>
</body>

</html>