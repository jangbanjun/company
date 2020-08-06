<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<head>
<%@ include file="/WEB-INF/include/include-header.jsp"%>
</head>
<body>
	<table class="board_view">
		<colgroup>
			<col width="15%" />
			<col width="35%" />
			<col width="15%" />
			<col width="35%" />
		</colgroup>
		<caption>게시글 상세</caption>
		<tbody>
			<tr>
				<th scope="row">글 번호</th>
				<td>${map.IDX }</td>
				<th scope="row">조회수</th>
				<td>${map.HIT_CNT }</td>
			</tr>
			<tr>
				<th scope="row">작성자</th>
				<td>${map.CREA_ID }</td>
				<th scope="row">작성시간</th>
				<td>${map.CREA_DTM }</td>
			</tr>
			<tr>
				<th scope="row">제목</th>
				<td colspan="3">${map.TITLE }</td>
			</tr>
			<tr>
				<td colspan="4">${map.CONTENTS }</td>
			</tr>
			<tr>
				<th scope="row">첨부파일</th>
				<td colspan="3">
					<c:forEach var="row" items="${list }">
						<a href="javascript:void();" class="file" data-value="${row.IDX }">${row.ORIGINAL_FILE_NAME }</a> 
						(${row.FILE_SIZE }kb)
					</c:forEach>
				</td>
<!-- 					이렇게 해놓으면 custom tag 사용해서 a에 data-value안줘도 가능하긴 함.  -->
<!-- 					펑션 쪽에서 idx값 가져올때 var idx = obj.parent().find("#IDX").val()이게 가능해짐 -->
<!-- 					근데 별로 좋은 방법 같아 보이진 않음 -->
<!-- 				<ul> -->
<!-- 					<li> -->
<%-- 						<c:forEach var="row" items="${list })"> --%>
<!-- 							<input type="hidden" name="IDX" id="IDX"/> -->
<%-- 							<a href="javascript:void();" class="file">${row.ORIGINAL_FILE_NAME }</a>  --%>
<%-- 							(${row.FILE_SIZE }kb) --%>
<%-- 						</c:forEach> --%>
<!-- 					</li> -->
<!-- 				</ul> -->
			</tr>
		</tbody>
	</table>
	<a href="#this" class="btn" id="list">목록으로</a>
	<a href="#this" class="btn" id="update">수정하기</a>
	<a href="#this" class="btn" id="delete">삭제하기</a>

	<%@ include file="/WEB-INF/include/include-body.jsp"%>

	<script type="text/javascript"> 

		function fn_openBoardList(){ 
			var comSubmit = new ComSubmit(); 
			comSubmit.setUrl("<c:url value='/sample/openBoardList.do' />"); 
			comSubmit.submit(); 
		} 
		
		function fn_openBoardUpdate(){ 
			var idx = ${map.IDX};
			var comSubmit = new ComSubmit(); 
			comSubmit.setUrl("<c:url value='/sample/openBoardUpdate.do' />"); 
			comSubmit.addParam("IDX", idx); 
			comSubmit.submit(); 
		} 
		
		function fn_deleteBoard(){ 
			var comSubmit = new ComSubmit(); 
			comSubmit.setUrl("<c:url value='/sample/deleteBoard.do' />"); 
			comSubmit.addParam("IDX", ${map.IDX}); 
			comSubmit.submit(); 
		}
		
		function fn_downloadFile(obj){ 
// 			var idx = obj.parent().find("#IDX").val();
			var $idx = obj.attr("data-value");
			console.log($idx);
			var comSubmit = new ComSubmit(); 
			comSubmit.setUrl("<c:url value='/common/downloadFile.do' />"); 
			comSubmit.addParam("IDX", $idx); 
			comSubmit.submit(); 
		};
		
		$(document).ready(function(){
			$("#list").on("click", function(e){ 
				e.preventDefault();
				fn_openBoardList();
			});
			
			$("#update").on("click", function(e){ 
				e.preventDefault();
				fn_openBoardUpdate();
			});
			
			$("a.file").on("click", function(e){ 
				e.preventDefault();
				fn_downloadFile($(this));
			});

			$("#delete").on("click", function(e){  
				e.preventDefault(); 
				fn_deleteBoard();
			});
		});

	</script>

</body>
</html>
