<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>자유게시판</title>

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
        }

        .board-container {
            max-width: 1200px;
            margin: 30px auto;
            background-color: #f8f9fa;
            border-radius: 8px;
            padding: 30px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .board-title {
            font-size: 1.5em;
            font-weight: bold;
            margin-bottom: 20px;
            text-align: center;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }

        th, td {
            text-align: center;
            padding: 10px;
            border: 1px solid #ddd;
        }

        th {
            background-color: #f1f1f1;
        }

        td a {
            color: #007bff;
            text-decoration: none;
        }

        td a:hover {
            text-decoration: underline;
        }

        .btn {
            padding: 10px 20px;
            border-radius: 5px;
        }

        .btn-primary {
            background-color: #007bff;
            color: #fff;
            border: none;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .search-form {
            display: flex;
            justify-content: center;
            margin-bottom: 20px;
        }

        .search-form select, .search-form input[type="text"], .search-form input[type="submit"] {
            padding: 8px;
            margin: 0 5px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
    </style>
</head>
<body>
    <div class="board-container">
    	
    	<a href="../index.jsp" class="">
			<h3 class="text-primary"><i class="fa fa-hashtag me-2"></i>DASHMIN</h3>
		</a>
    	
        <h2 class="board-title">자유게시판</h2>

        <!-- 검색 폼 -->
        <form method="get" class="search-form">
            <select name="searchField">
                <option value="title">제목</option>
                <option value="content">내용</option>
            </select>
            <input type="text" name="searchWord" placeholder="검색어를 입력하세요" />
            <input type="submit" value="검색하기" class="btn btn-primary" />
        </form>

        <!-- 목록 테이블 -->
        <table>
            <thead>
                <tr>
                    <th width="10%">번호</th>
                    <th width="50%">제목</th>
                    <th width="15%">작성자</th>
                    <th width="10%">조회수</th>
                    <th width="15%">작성일</th>
                </tr>
            </thead>
            <tbody>
                <c:choose>
                    <c:when test="${ empty boardLists }">
                        <tr>
                            <td colspan="5" align="center">등록된 게시물이 없습니다.</td>
                        </tr>
                    </c:when>
                    <c:otherwise>
                        <c:forEach items="${ boardLists }" var="row" varStatus="loop">
                            <tr>
                                <td>${map.totalCount - (((map.pageNum-1)* map.pageSize) + loop.index )}</td>
                                <td align="left">
                                    <a href="../board1/view1.do?idx=${ row.idx }">${row.title}</a>
                                </td>
                                <td>${row.id}</td>
                                <td>${row.visitcount}</td>
                                <td>${row.postdate}</td>
                                <td>
                                    <c:if test="${ not empty row.ofile }">
                                        <a href="../board1/download1.do?ofile=${ row.ofile }&sfile=${row.sfile}&idx=${ row.idx }">[Down]</a>
                                    </c:if>
                                </td>                              
                            </tr>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </tbody>
        </table>

        <!-- 하단 메뉴 -->
        <div class="d-flex justify-content-between mt-4">
            <div>${ map.pagingImg }</div>
            <button type="button" class="btn btn-primary" onclick="location.href='../board1/write1.do';">글쓰기</button>
        </div>
    </div>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>