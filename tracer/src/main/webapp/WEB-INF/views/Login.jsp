<%@page import="kr.tracer.entity.Admin"%>
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
<!-- <script type="text/javascript">
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
</script> -->


</head>
<body style="background: coral;">

   <div id="outer">
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
                  <li><a href="Login.do"  class="btn btn-info btn-sm" role="button">Login</a></li>
               </ul>
            </nav>

         </header>
      </div>
   </div>



   <div class="container">
      <div id="banner" class="box">
         <div class="logintop">
            <c:if test="${empty avo}">
               <!-- if문 -->
               <form class="form-inline" action="login.do" method="post">
                  <div class="form-group">
                     <label for="ad_id">아이디:</label> <input type="text" class="" id="ad_id" name="ad_id">
                  </div>
                  <div class="form-group">
                     <label for="ad_pw">&nbsp;비밀번호:</label> <input type="password" class="" id="ad_pw" name="ad_pw">
                  </div>
                  <a href="main.do" class="btn btn-info btn-sm" role="button">Login</a>
               </form>
            </c:if>
         </div>
      </div>
   </div>
</body>
</html>