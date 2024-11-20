<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 정보 수정</title>

    <!-- Favicon -->
    <link href="../img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="../lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="../lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="../css/style.css" rel="stylesheet">

    <!-- Custom Styles -->
    <style>
        body {
            font-family: 'Heebo', sans-serif;
        }

        .edit-profile-form-container {
            background-color: #f8f9fa;
            border-radius: 8px;
            padding: 30px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .edit-title {
            font-size: 1.2em;
            margin-bottom: 20px;
            line-height: 1;
        }

        .error-message {
            color: red;
            font-size: 1.2em;
        }

        .text-primary {
            font-size: 1.3em;
        }
    </style>

</head>

<body>
    <div class="container-xxl position-relative bg-white d-flex p-0">
        <!-- Sign In Start -->
        <div class="container-fluid">
            <div class="row h-100 align-items-center justify-content-center" style="min-height: 100vh;">
                <div class="col-12 col-sm-8 col-md-6 col-lg-5 col-xl-4">
                    <div class="edit-profile-form-container">
                        <div class="d-flex align-items-center justify-content-between mb-3">
                            <a href="../index.jsp" class="">
                                <h3 class="text-primary"><i class="fa fa-hashtag me-2"></i>DASHMIN</h3>
                            </a>
                            <h3 class="edit-title">회원 정보 수정</h3>
                        </div>

                        <!-- 로그인된 사용자 정보가 없는 경우 처리 -->
                        <%
                        if (session.getAttribute("UserId") == null) {
                        %>
                            <script>
                                alert("로그인이 필요합니다.");
                                window.location.href = "../Login.jsp";
                            </script>
                        <%
                        } else {
                            // 로그인된 사용자 정보 가져오기
                            String userId = (String) session.getAttribute("UserId");
                            String userName = (String) session.getAttribute("UserName");
                            String userEmail = (String) session.getAttribute("UserEmail");
                            String userPhone = (String) session.getAttribute("UserPhone");
                        %>

                            <!-- 회원 정보 수정 폼 -->
                            <form action="EditProfileProcess.jsp" method="post" name="editProfileFrm">
                                <div class="form-floating mb-3">
                                    아이디
                                    <label for="user_id"></label>
                                    <input type="text" class="form-control" id="user_id" name="UserId" value="<%= userId %>" required style="padding: 0.5rem;" />
                                </div>
                                <div class="form-floating mb-3">
                                    이름
                                    <label for="user_name"></label>
                                    <input type="text" class="form-control" id="user_name" name="user_name" value="<%= userName %>" required style="padding: 0.5rem;" />
                                </div>
                                <div class="form-floating mb-3">
                                    이메일
                                    <label for="user_email"></label>
                                    <input type="email" class="form-control" id="user_email" name="user_email" value="<%= userEmail %>" required style="padding: 0.5rem;" />
                                </div>
                                <div class="form-floating mb-3">
                                    전화번호
                                    <label for="user_phone"></label>
                                    <input type="text" class="form-control" id="user_phone" name="user_phone" value="<%= userPhone %>" style="padding: 0.5rem;" />
                                </div>
                                <div class="form-floating mb-3">
                                    새 비밀번호 (변경 시 입력)
                                    <label for="user_pw"></label>
                                    <input type="password" class="form-control" id="user_pw" name="user_pw" style="padding: 0.5rem;" />
                                </div>
                                <button type="submit" class="btn btn-primary py-3 w-100 mb-4">수정하기</button>
                            </form>
						
						<%
   							 String msg = request.getParameter("msg");
    						 if (msg != null) {
						%>
						     <div class="alert alert-info"><%= msg %></div>
						<%
					    	}
						%>
						
                        <%
                        }
                        %>
                    </div>
                </div>
            </div>
        </div>
        <!-- Sign In End -->
    </div>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/chart/chart.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib/tempusdominus/js/moment.min.js"></script>
    <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

    <!-- Template Javascript -->
    <script src="../js/main.js"></script>
</body>

</html>