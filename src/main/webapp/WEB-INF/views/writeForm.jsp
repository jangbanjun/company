<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<title>게시판</title>
</head>
<script type="text/javascript">
	$(document).ready(function() {
		var formObj = $("form[name='writeForm']");
		$(".write_btn").on("click", function() {
			if (fn_valiChk()) {
				return false;
			}
			formObj.attr("action", "/board/write");
			formObj.attr("method", "post");
			formObj.submit();
		});
	})
	function fn_valiChk() {
		var regForm = $("form[name='writeForm'] .chk").length;
		for (var i = 0; i < regForm; i++) {
			if ($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null) {
				alert($(".chk").eq(i).attr("title"));
				return true;
			}
		}
	}
</script>
<body>
<header>
		</header>
			<div class="container">
		<div class="d-flex justify-contents-center">
			<form name="write" method="post" action="write"
				enctype="multipart/form-data">
				<input type="hidden" name="status" value="1" />
				<table class="table table-striped">
					<tbody class="justify-content-center">
						<%-- <c:if test="${member.userId != null}"> --%>
						<tr>
							<td><label for="title">제목</label> <input type="text"
								id="title" name="title" class="chk" title="제목을 입력하세요."
								style="width: 300px;" /></td>
						</tr>
						<tr>
							<td><label for="content">내용</label> <textarea id="content"
									name="content" class="chk" title="내용을 입력하세요."></textarea></td>
						</tr>
						<tr>
							<td><label for="writer">작성자</label><input type="text"
								id="writer" name="writer" class="chk" title="작성자를 입력하세요." /></td>
							<%--value="${member.userId}" --%>
						<tr>
						<tr>
							<td><input type="file" name="file"></td>
						<tr>
							<td>
								<button class="write_btn" type="submit">작성</button>
							</td>
						</tr>
						<%--</c:if> --%>
						<%--<c:if test="${member.userId == null}"> --%>
						<!--	<p>로그인 후에 작성하실 수 있습니다.</p> -->
						<%--</c:if> --%>

					</tbody>
				</table>
			</form>

			<hr />

		</div>
	</div>
		</body>
</html>