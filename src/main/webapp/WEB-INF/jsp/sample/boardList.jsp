<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jsp" %>
</head>
<body>
	<h2>게시판 목록</h2>
	<button id="tt">이벤트 테스트</button>
	<table class="board_list">
		<colgroup>
			<col width="10%"/>
			<col width="*"/>
			<col width="15%"/>
			<col width="20%"/>
		</colgroup>
		<thead>
			<tr>
				<th scope="col">글번호</th>
				<th scope="col">제목</th>
				<th scope="col">조회수</th>
				<th scope="col">작성일</th>
			</tr>
		</thead>
		<tbody>
			
		</tbody>
	</table>
	
	<div id="PAGE_NAVI"></div>
	<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX"/>
	
	<br/>
	
	<a href="#this" class="btn" id="write">글쓰기</a>
	<%@ include file="/WEB-INF/include/include-body.jsp" %>
	<script type="text/javascript">
		window.onload=function(){
			fn_selectBoardList(1);
			
			$("#write").on("click", function(e){ //글쓰기 버튼
				e.preventDefault();
				fn_openBoardWrite();
			});	
// 			페이징 ajax로 다른페이지 불러온후 클릭 이벤트 안먹는거 아래  $(document).on("click" 방법으로 해결하긴 했는데 
// 			이렇게 해결 하는게 맞나...
// 			$("a.title").on("click", function(e){ //제목 
// 				e.preventDefault();
// 				fn_openBoardDetail($(this));
// 			});
			};
			$(document).on("click","a.title",function(e) { 
				e.preventDefault();
				fn_openBoardDetail($(this));
				});



			
		
		function fn_openBoardWrite(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/sample/openBoardWrite.do' />");
			comSubmit.submit();
		}
		
		function fn_openBoardDetail(obj){
			var $idx = obj.attr("data-value");
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/sample/openBoardDetail.do' />");
// 			comSubmit.addParam("IDX", $(obj).children().val());
			comSubmit.addParam("IDX", $idx);
			comSubmit.submit();
		}
		
		function fn_selectBoardList(pageNo){
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/sample/selectBoardList.do' />");
			comAjax.setCallback("fn_selectBoardListCallback");
			comAjax.addParam("PAGE_INDEX",$("#PAGE_INDEX").val());
			comAjax.addParam("PAGE_ROW", 15);
			comAjax.addParam("IDX_FE", $("#IDX_FE").val());
			comAjax.ajax();
		}
		
		function fn_selectBoardListCallback(data){
			var total = data.TOTAL;
			console.log(total);
			var body = $("table>tbody");
			body.empty();
			if(total == 0){
				var str = "<tr>" + 
								"<td colspan='4'>조회된 결과가 없습니다.</td>" + 
							"</tr>";
				body.append(str);
			}
			else{
				var params = {
					divId : "PAGE_NAVI",
					pageIndex : "PAGE_INDEX",
					totalCount : total,
					eventName : "fn_selectBoardList"
				};
				gfn_renderPaging(params);
				
				var str = "";
				$.each(data.list, function(key, value){
					str += "<tr>" + 
								"<td>" + value.IDX + "</td>" + 
								"<td class='title'>" +
									"<a href='#this' class='title' data-value='"+value.IDX+"'>" + value.TITLE + "<input type='hidden' name='title' value=" + value.IDX + "></a>" +
								"</td>" +
								"<td>" + value.HIT_CNT + "</td>" + 
								"<td>" + value.CREA_DTM + "</td>" + 
							"</tr>";
				});
				body.append(str);
				
				
			}
		}
	</script>	
</body>
</html>