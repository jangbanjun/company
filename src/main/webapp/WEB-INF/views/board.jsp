<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<head>
<script>
	$(function() {
		var frmObj = $("form[name='frm']")

		// 		$("button[name='search']").on("click",function(){
		// 			document.frmObj.action="search";
		// 			document.frmObj.method="get";
		// 			document.frmObj.submit();
		// 		})
		// 		$("button[name='deleteByChoice']").on("click",function(){
		// 			document.frmObj.action="deleteList";
		// 			document.frmObj.method="post";
		// 			document.frmObj.submit();
		// 		})
		$("button[name='writeForm']").on("click", function() {
			frmObj.attr("action", "writeForm");
			frmObj.attr("method", "get");
			frmObj.submit();
		})

		// 		$("#checkAll").on("click",function(){
		// 				console.log("찍히냐");
		// 				if($("checkbox[name=check]").is(":checked")){
		// 						$("input[name=check]").prop("checked",true);
		// 				}else{
		// 					$("input[name=check]").prop("checked",false);
		// 					}
		// 			})
	})
</script>
</head>

<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">
	<div class=container>
		<table class="table table-striped">
			<tr class="justify-contents-center">
				<th><input type="checkbox" name="checkAll" id="checkAll" /></th>
				<th>번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>등록날짜</th>
			</tr>
			<c:choose>
				<c:when test="${fn:length(list) > 0}">
					<c:forEach items="${list }" var="row">
						<tr>
							<td>${row.IDX }</td>
							<td>${row.TITLE }</td>
							<td>${row.HIT_CNT }</td>
							<td>${row.CREA_DTM }</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="4">조회된 결과가 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>


			<%-- 			<c:forEach var="bdto" items="${list }"> --%>
			<!-- 				<tr class="justify-contents-center"> -->
			<%-- 				<td><input type="checkbox" name="check" value="${bdto.bno }"/></td> --%>
			<%-- 				<td>${bdto.bno}</td>			 --%>
			<%-- 				<td>${bdto.writer}</td>			 --%>
			<%-- 				<td><a href='<c:url value="/detail?bno=${bdto.bno }"/>'>${bdto.title}</a></td>			 --%>
			<%-- 				<td>${bdto.regDate}</td> --%>
			<!-- 			</tr> -->
			<%-- 			</c:forEach> --%>
		</table>

		<div class="d-flex justify-content-center container">
			<form name="frm">
				<div class="form-group">
					<label class="sr-only" for="searchInput">search.....</label> <input
						type="text" id="searchInput" name="searchInput"
						class="form-control" placeholder="검색검색...." />
				</div>
			</form>
			<button name="search" type="button"
				class="mr-3 btn btn-primary btn-lg"
				style="background: black; border-style: none">검색</button>
			<button name="deleteByChoice" type="button"
				class="btn btn-primary btn-lg"
				style="background: orange; border-style: none">선택 삭제</button>

			<button name="writeForm" type="button" class="btn btn-lg">글쓰기</button>
		</div>

	</div>

</body>

</html>