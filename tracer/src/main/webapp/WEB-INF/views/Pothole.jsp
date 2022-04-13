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
<link rel="stylesheet" href="${cpath}/resources/css/road.css" />
<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
   $(document).ready(function(){
      // 서버와 통신을 한다(게시판리스트를 요청) : boardAjaxList.do
     boardList();
      
   });
   function boardList(){
      $.ajax({
         url : "${cpath}/board",
         type : "get",
         dataType : "json",
         success : callBack,
         error : function(){ alert("error");}
      });   
   }
   function callBack(data){
      var bList="<table class='table table-bordered table-hover'>";
      bList+="<tr>";
      bList+="<td>번호</td>";
      bList+="<td>제목</td>";
      bList+="<td>작성자</td>";
      bList+="<td>작성일</td>";
      bList+="<td>조회수</td>";
      bList+="<td>수정</td>";
      bList+="</tr>";
      // data에 저장된 JSON데이터를 핸들링... 반복문 : 
      // [{"idx":1,"title":"게시판","content":"게시판","writer":"관리자",,,},{    }]
      $.each(data,(index,obj)=>{ 
         bList+="<tr>";
         bList+="<td>"+obj.idx+"</td>";
         bList+="<td id='t"+obj.idx+"'><a href='javascript:cview("+obj.idx+")'>"+obj.title+"</a></td>";
         bList+="<td id='w"+obj.idx+"'>"+obj.writer+"</td>";
         bList+="<td>"+obj.indate+"</td>";
         bList+="<td id='count"+obj.idx+"'>"+obj.count+"</td>";
         if("${mvo.memId}"==obj.memId){        	 
        	 bList+="<td id='n"+obj.idx+"'><button class='btn btn-sm btn-success' onclick='updateFn("+obj.idx+")'>수정</button></td>";
         }else{
        	 bList+="<td id='n"+obj.idx+"'><button disabled class='btn btn-sm btn-success' onclick='updateFn("+obj.idx+")'>수정</button></td>";
         } 										// disabled -> 비활성화
         bList+="</tr>";
         
         bList+="<tr style='display:none' id='c"+obj.idx+"'>";
         bList+="<td>내용</td>";
         bList+="<td colspan='5'>";
         bList+="<textarea id='nc"+obj.idx+"' class='form-control' rows='7'>" + obj.content +"</textarea>";
         if("${mvo.memId}"==obj.memId){
         	bList+="<br><button class='btn btn-sm btn-success' onclick='goUpdate("+obj.idx+")'>수정</button>&nbsp;"; // idx번호를 가지고 감
         	bList+="<button class='btn btn-sm btn-info' onclick='goDel("+obj.idx+")'>삭제</button>&nbsp;";
         }else{
         	bList+="<br><button disabled class='btn btn-sm btn-success' onclick='goUpdate("+obj.idx+")'>수정</button>&nbsp;"; // idx번호를 가지고 감
         	bList+="<button disabled class='btn btn-sm btn-info' onclick='goDel("+obj.idx+")'>삭제</button>&nbsp;";
         }
         bList+="<button class='btn btn-sm btn-warning' onclick='closeFn("+obj.idx+")'>닫기</button>";
         bList+="</td>";
         bList+="</tr>";
      });
      if(${!empty mvo}){
	      bList+="<tr>";
	      bList+="<td colspan='5'>";
	    	  bList+="<button class='btn btn-info btn-sm' onclick='goForm()'>글쓰기</button>";
	      bList+="</td>";
	      bList+="</tr>";
      }
      bList+="</table>";
      $("#list").html(bList);
      
      $("#list").css("display","block");
      $("#wform").css("display","none");
   }
</script>


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

	<nav>
		<div id="banner-wrapper">
			<div id="banner" class="box">
				<div class="solt">
					<select>
						<option value="">지역별</option>
						<option value="">날짜별</option>
					</select><div id="ser"><input type="search">&nbsp;&nbsp;<button id="sear">검색</button></div>
				</div>
				
			</div>
		</div>
	</nav>

	</body>
	
	
	
<!-- 	
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
				</div> -->
</html>