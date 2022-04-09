<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<h2>Tracer</h2>
	<div class="">
		<div class="">
			<c:if test="${empty mvo}">
				<form class="" action="${cpath}/login.do" method="post">
					<div class="">
						<label for="memId">아이디:</label> <input type="text"
							class="" id="memId" name="memId">
					</div>
					<br>
					<div class="">
						<label for="memPwd">&nbsp;비밀번호:</label> <input type="password"
							class="" id="memPwd" name="memPwd">
					</div>
					<button type="submit" class="">Login</button>
				</form>
			</c:if>
		</div>
	</div>
</body>

</html>