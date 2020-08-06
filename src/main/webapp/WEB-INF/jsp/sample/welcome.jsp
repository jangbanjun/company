<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/include/include-header.jsp" %>
<title>Insert title here</title>
<script>
$(document).ready(function(){
	
$("#redi").on("click",function(){
	console.log("찍히나");
	location.href="http://localhost:8080/sample/openBoardList.do";
})
})

</script>
</head>
<body>
	<button id="redi">게시판 가기</button>
</body>
</html>