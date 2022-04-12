<%@page import="kr.tracer.entity.Car"%>
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
<link rel="stylesheet" href="${cpath}/resources/css/car.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
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
      bList+="<tr class='cartr'>";
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
   
   
   // 변수에 인풋 태그를 넣고
   // 수정 버튼을 눌렸을 때 내용을 인풋 태그가 담긴 변수로 지정
   function updateFn(idx){
	   var title=$("#t"+idx).text(); // ()가 비어있으면 get기능
	   var writer=$("#w"+idx).text();
	   var tinput="<input type='text' id='ntitle"+idx+"' class='form-control' value='"+title+"'/>"; // 값을 input에 집어넣기
	   var winput="<input type='text' id='nwriter"+idx+"' class='form-control' value='"+writer+"'/>";
	   $("#t"+idx).html(tinput); // set 기능
	   $("#w"+idx).html(winput);
	   
	   var nbutton="<button class='btn btn-sm btn-info' onclick='update("+idx+")'>수정하기</button>"
	   $("#n"+idx).html(nbutton);
   }
   function update(idx){
	   var title=$("#ntitle"+idx).val();
	   var writer=$("#nwriter"+idx).val();
	   $.ajax({
		   url : "${cpath}/boardUpdate", // 요청
		   type : "post",
		   data : {idx:idx, title:title, writer:writer},
		   success : boardList,
	       error : function(){ alert("error");}
	   });
   }
   
   function closeFn(idx){
	   $("#c"+idx).css("display","none"); // 창 닫기
   }
   
   function goUpdate(idx){
	   var content=$("#nc"+idx).val();
	   $.ajax({
		   url : "${cpath}/board",
	       type : "put", // update
	       contentType:'application/json;charset=utf-8',
	       data : JSON.stringify({"idx" : idx, "content" : content}), // -> JSON으로 변환    // key : value값
	       success : boardList,
	       error : function(){ alert("error");}
	   });
   }
   
   function goDel(idx){
	   var result = confirm('정말 삭제 하시겠습니까?'); // confirm = 확인(true)/취소 버튼이 생김
	   if(result){
		   $.ajax({
			   url : "${cpath}/board/"+idx,
	       		type : "delete", // delete
	       		// data : {"idx" : idx}, // value 값
	       		success : boardList,
	       		error : function(){ alert("error");}
	   		});
   		}
   }
   
   function cview(idx){ // c+idx=>id=>c62
	   if($("#c"+idx).css("display")=="none"){
		   $("#c"+idx).css("display","table-row");
	   }else{
		   $.ajax({
			   url: "${cpath}/updateCount/"+idx,
			   type: "get",
			   success : function(vo){
				   $("#count"+idx).text(vo.count);
			   },
			   error : function(){alert("error");}
		   });
		   
		   $("#c"+idx).css("display", "none");
	   }
   }
   
   function goForm(){
      $("#list").css("display","none");
      $("#wform").css("display","block");
   }
   function insertFn(){ // form에서 파라미터를 가져오기 (title, content, writer)
      // title = 게시판&content=게시판&writer=관리자.......
      var fData = $("#frm").serialize(); // serialize => 직렬화:
      $.ajax({
         url: "${cpath}/board",
         type: "post", // insert
         data: fData,
         success : boardList, 
         error : function(){alert("error");}
      });
      // 글쓰기 폼 초기화
      // $("#title").val("");
      // $("#content").val("");
      // $("#writer").val("");
      $("#reset").trigger("click"); // 글을 쓰고 다시 글쓰기를 눌렀을 때 clear되어있게하기
      
   }
  </script>


</head>
<body>
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
		<h2>Tracer</h2>
		<div class="">
			<div class="">
				<c:if test="${!empty mvo}"> <!-- if문 -->
					<form action="${cpath}/logout.do" method="post">
						<div class="">
							<label>${mvo.memName}님 방문을 환영합니다</label>
							<input type="submit" class="" value="Logout">
						</div>
					</form>
				</c:if>
			</div>
			<div class="" id="list" style="display: block">PanelContent</div>
			<div class="" id="wform" style="display: none">
				<form class="" id="frm">
					<input type="hidden" name="memId" value="${mvo.memId}"/>
					<div class="">
						<label class="" for="title">제목:</label>
						<div class="">
							<input type="text" class="" name="title" id="title"
								placeholder="Enter title">
						</div>
					</div>
					<div class="">
						<label class="" for="content">내용:</label>
						<div class="">
							<textarea rows="10" class="" name="content"
								id="content"></textarea>
						</div>
					</div>

					<div class="">
						<label class="" for="writer">작성자:</label>
						<div class="">
							<input type="text" class="" name="writer" id="writer" placeholder="Enter writer"
								value="${mvo.memName}" readonly="readonly">
						</div>
					</div>
					<div class="">
						<div class="">
							<button type="button" class=""
								onclick="insertFn()">등록</button>
							<button type="reset" class="" id="reset">취소</button>
						</div>
					</div>
				</form>
			</div>
		</div>
</body>
</html>