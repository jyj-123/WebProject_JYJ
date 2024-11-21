<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 첨부형 게시판</title>
</head>
<body>
<h2>파일 첨부형 게시판 - 상세 보기(View)</h2>

<table border="1" width="90%">
    <colgroup>
        <col width="15%"/> <col width="35%"/>
        <col width="15%"/> <col width="*"/>
    </colgroup> 
    <!-- 
    Controller에서 인출한 레코드를 저장한 DTO객체를 출력해준다.
    EL을 사용하면 멤버변수명 만으로 getter를 호출하여 내용을 출력할 수 있다.
     -->
    <tr>
        <td>번호</td> <td>${ dto.idx }</td>
        <td>작성자</td> <td>${ dto.name }</td>
    </tr>
    <tr>
        <td>작성일</td> <td>${ dto.postdate }</td>
        <td>조회수</td> <td>${ dto.visitcount }</td>
    </tr>
    <tr>
        <td>제목</td>
        <td colspan="3">${ dto.title }</td>
    </tr>
    <tr>
        <td>내용</td>
        <td colspan="3" height="100">
        	${ dto.content }
        	
        	<!-- 게시물 작성시 등록한 첨부파일이 있는 경우에는.. -->
        	<c:if test="${ not empty dto.ofile and isImage eq true }">
        		<!-- 이미지를 출력한다. -->
        		<br><img src="../Uploads/${ dto.sfile }"
        			style="max-width:100%;"/>
        	</c:if>
        </td>
    </tr>
    
    <c:if test="${ not empty dto.ofile }">
    	<br />
    	<c:choose>
    		<c:when test="${ mimeType eq 'img' }">
    			<img src="../Uploads/${ dto.sfile }" style="max-width:600px;" />
    		</c:when>
    		<c:when test="${ mimeType eq 'audio' }">
    			<audio controls="controls">
    				<source src="../Uploads/${ dto.sfile }" type="audio/mps" />
    			</audio>
    		</c:when>
    		<c:when test="${ mimeType eq 'video' }">
    			<source src="../Uploads/${ dto.sfile }" type="video/mp4" />
    			Your browser does not support the video tag.
    		</c:when>
    	</c:choose>
    </c:if>

<!-- 첨부파일 다운로드 -->
<tr>
    <td>첨부파일</td>
    <td>
        <!-- 파일이 있다면 다운로드 링크를 제공 -->
        <c:if test="${not empty dto.ofile}">
            ${dto.ofile}
            <a href="../board/download.do?ofile=${dto.ofile}&sfile=${dto.sfile}&idx=${dto.idx}">[다운로드]</a>
        </c:if>
    </td>
    <td>다운로드수</td>
    <td>${dto.downcount}</td>
</tr>
    
    <!-- 하단 메뉴(버튼) --> 
    <tr>
        <td colspan="4" align="center">
            <button type="button" 
            onclick="location.href='../board/edit.do?idx=${ param.idx }';">수정하기</button>
            <button type="button" 
            onclick="location.href='../board/delete.do?idx=${ param.idx }';">삭제하기</button>
            <button type="button" 
            onclick="location.href='../board/list.do';">
                목록 바로가기
            </button>
        </td>
    </tr>
</table>
</body>
</html>



<script>
function deleteConfirm(idx){
	let c = confirm("게시물을 삭제하시겠습니까?");
	if(c==true){
		location.href="../board/delete.do?idx="+ idx;
	}
}
</script>
<button type="button"
onclick="deleteConfirm(${ param.idx });" style="background-color: pink;">
    	삭제하기(confirm)
</button>








<h2>[퀴즈]작성자 본인에게만 버튼 보이기</h2>
<%--
	//Java코드를 통해 접근할때..
	String userId = session.getAttribute("UserId").toString();
	==> EL을 통해 접근할때..
		${ UserId }
--%>


<!-- 수정 버튼: 로그인한 사용자와 게시물 작성자가 일치할 경우에만 보이도록 -->
<c:if test="${ UserId eq dto.id }">
	<button type="button" 
    onclick="location.href='../board/edit.do?idx=${param.idx}';">수정하기</button>

<!-- 삭제 버튼: 로그인한 사용자와 게시물 작성자가 일치할 경우에만 보이도록 -->
	<button type="button" 
	onclick="confirmDelete(${param.idx});">삭제하기</button>
</c:if>




























