<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>댓글 수정</title>

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
        width: 50%;
        margin: 50px auto;
        padding: 20px;
        border: 1px solid #ccc;
        border-radius: 10px;
        background-color: #ffffff;
        box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
    }
    h2 {
        text-align: center;
        color: #0073e6;
        font-size: 1.8em;
        margin-bottom: 20px;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }
    table, th, td {
        border: 1px solid #ccc;
    }
    th, td {
        padding: 10px;
        text-align: center;
    }
    th {
        background-color: #0073e6;
        color: white;
    }
    td {
        background-color: #f9f9f9;
    }
    input[type="text"], textarea {
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
    <h2>댓글 수정</h2>

    <form method="post" action="../board2/commentEdit.do" onsubmit="return validateForm(this);">
        <input type="hidden" name="idc" value="${dto.idc}" />
        
        <table width="100%">
            <tr>
                <td>댓글 내용</td>
                <td>
                    <textarea name="content" style="width: 100%; height: 100px;">${dto.content}</textarea>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center;">
                    <button type="submit">댓글 수정 완료</button>
                    <button type="button" onclick="location.href='../board2/view2.do?idx=${dto.idx}';">취소</button>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>