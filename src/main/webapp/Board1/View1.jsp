<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>자유게시판 - 상세 보기</title>

<!-- Favicon -->
<link href="../img/favicon.ico" rel="icon">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">

<!-- Icon Font Stylesheet -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link href="../css/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="../css/style.css" rel="stylesheet">

<!-- Custom Styles -->
<style>
    body {
        font-family: 'Heebo', sans-serif;
        background-color: #f8f9fa;
    }
    .container {
        max-width: 900px;
        margin: 0 auto;
        padding: 20px;
        background-color: #fff;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        border: 1px solid #dee2e6; /* 경계선 추가 */
    }
    h2 {
        font-size: 1.8em;
        margin-bottom: 20px;
    }
    table {
        width: 100%;
        margin-bottom: 20px;
        border-collapse: collapse;
        border: 1px solid #dee2e6; /* 테이블 경계선 추가 */
    }
    th, td {
        padding: 12px;
        text-align: center;
        border: 1px solid #dee2e6; /* 테이블 셀 경계선 추가 */
    }
    th {
        background-color: #f1f1f1;
    }
    td {
        background-color: #f9f9f9;
    }
    .btn {
        background-color: #007bff;
        color: white;
        padding: 10px 20px;
        border: 1px solid #007bff; /* 버튼 경계선 추가 */
        border-radius: 4px;
        cursor: pointer;
        font-size: 1rem;
        text-align: center;
    }
    .btn:hover {
        background-color: #0056b3;
        border: 1px solid #0056b3; /* 버튼 hover 시 경계선 색상 변경 */
    }
    .btn-danger {
        background-color: #dc3545;
        border: 1px solid #dc3545; /* 삭제 버튼 경계선 추가 */
    }
    .btn-danger:hover {
        background-color: #c82333;
        border: 1px solid #c82333; /* 삭제 버튼 hover 시 경계선 색상 변경 */
    }
    .file-download {
        font-size: 1.1em;
        color: #007bff;
        text-decoration: none;
    }
    .file-download:hover {
        text-decoration: underline;
    }
    .img-preview {
        max-width: 600px;
        margin: 20px 0;
    }
</style>

</head>
<body>
<div class="container">
    <h2>자유게시판</h2>

    <table>
        <colgroup>
            <col width="15%" /> <col width="35%" />
            <col width="15%" /> <col width="*"/>
        </colgroup>
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

                <c:if test="${ not empty dto.ofile and isImage eq true }">
                    <img src="../Uploads/${ dto.sfile }" class="img-preview" />
                </c:if>

                <c:if test="${ not empty dto.ofile }">
                    <c:choose>
                        <c:when test="${ mimeType eq 'img' }">
                            <img src="../Uploads/${ dto.sfile }" class="img-preview" />
                        </c:when>
                        <c:when test="${ mimeType eq 'audio' }">
                            <audio controls>
                                <source src="../Uploads/${ dto.sfile }" type="audio/mp3" />
                            </audio>
                        </c:when>
                        <c:when test="${ mimeType eq 'video' }">
                            <video controls>
                                <source src="../Uploads/${ dto.sfile }" type="video/mp4" />
                                Your browser does not support the video tag.
                            </video>
                        </c:when>
                    </c:choose>
                </c:if>
            </td>
        </tr>

        <tr>
            <td>첨부파일</td>
            <td>
                <c:if test="${ not empty dto.ofile }">
                    ${ dto.ofile }
                    <a href="../board1/download1.do?ofile=${ dto.ofile }&sfile=${ dto.sfile }&idx=${ dto.idx }" class="file-download">[다운로드]</a>
                </c:if>
            </td>
            <td>다운로드수</td>
            <td>${ dto.downcount }</td>
        </tr>
        
        <!-- 하단 메뉴(버튼) -->
        <tr>
            <td colspan="4" align="center">
                <c:if test="${ UserId eq dto.id }">
                    <button type="button" class="btn" onclick="location.href='../board1/edit1.do?idx=${param.idx}';">수정하기</button>
                    <button type="button" class="btn btn-danger" onclick="deleteConfirm(${param.idx});">삭제하기</button>
                </c:if>
                <button type="button" class="btn" onclick="location.href='../board1/listPage1.do';">목록 바로가기</button>
            </td>
        </tr>
    </table>

</div>

<script>
    function deleteConfirm(idx) {
        let c = confirm("게시물을 삭제하시겠습니까?");
        if(c == true) {
            location.href = "../board1/delete1.do?idx=" + idx;
        }
    }
</script>

</body>
</html>