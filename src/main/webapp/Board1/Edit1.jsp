<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>자유게시판 - 수정하기</title>

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
        max-width: 800px;
        margin: 50px auto;
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
    }
    td {
        padding: 12px;
        text-align: left;
        vertical-align: middle;
        border: 1px solid #dee2e6; /* 테이블 셀 경계선 추가 */
        background-color: #f9f9f9;
    }
    td:first-child {
        background-color: #f1f1f1;
        font-weight: bold;
        width: 25%;
    }
    input[type="text"], textarea, input[type="file"] {
        width: 95%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
        font-size: 1rem;
    }
    textarea {
        resize: vertical;
    }
    button {
        background-color: #007bff;
        color: white;
        padding: 10px 20px;
        border: 1px solid #007bff;
        border-radius: 4px;
        cursor: pointer;
        font-size: 1rem;
        margin-right: 10px;
    }
    button:hover {
        background-color: #0056b3;
        border-color: #0056b3;
    }
    button[type="reset"] {
        background-color: #6c757d;
        border-color: #6c757d;
    }
    button[type="reset"]:hover {
        background-color: #5a6268;
        border-color: #5a6268;
    }
    button[type="button"] {
        background-color: #28a745;
        border-color: #28a745;
    }
    button[type="button"]:hover {
        background-color: #218838;
        border-color: #218838;
    }
</style>

<script type="text/javascript">
    function validateForm(form) {
        if (form.title.value.trim() === "") {
            alert("제목을 입력하세요.");
            form.title.focus();
            return false;
        }
        if (form.content.value.trim() === "") {
            alert("내용을 입력하세요.");
            form.content.focus();
            return false;
        }
    }
</script>
</head>
<body>
<div class="container">
    <h2>자유게시판 - 수정하기(Edit)</h2>
    <form name="writeFrm" method="post" enctype="multipart/form-data" action="../board1/edit1.do" onsubmit="return validateForm(this);">

        <!-- 수정할 게시물의 일련번호 -->
        <input type="hidden" name="idx" value="${ dto.idx }" />
        <!-- 게시물의 작성자 아이디 -->
        <input type="hidden" name="id" value="${ dto.id }" />
        <!-- 기존 게시물의 파일명 -->
        <input type="hidden" name="prevOfile" value="${ dto.ofile }" />
        <input type="hidden" name="prevSfile" value="${ dto.sfile }" />

        <table>
            <tr>
                <td>제목</td>
                <td>
                    <input type="text" name="title" value="${ dto.title }" />
                </td>
            </tr>
            <tr>
                <td>내용</td>
                <td>
                    <textarea name="content" rows="5">${ dto.content }</textarea>
                </td>
            </tr>
			<tr>
                <td>첨부 파일</td>
                <td>
                    <input type="file" name="ofile" />
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center;">
                    <button type="submit">작성 완료</button>
                    <button type="reset">RESET</button>
                    <button type="button" onclick="location.href='../board1/listPage1.do';">목록 바로가기</button>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>