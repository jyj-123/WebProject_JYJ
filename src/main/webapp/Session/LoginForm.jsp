<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>Session - 로그인</title>

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
        .login-form-container {
            background-color: #f8f9fa;
            border-radius: 8px;
            padding: 30px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .login-title {
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
        #spinner {
            display: none;
        }
    </style>

</head>

<body>
    <div class="container-xxl position-relative bg-white d-flex p-0">
        <!-- Spinner Start -->
        <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
        <!-- Spinner End -->

        <!-- Sign In Start -->
        <div class="container-fluid">
            <div class="row h-100 align-items-center justify-content-center" style="min-height: 100vh;">
                <div class="col-12 col-sm-8 col-md-6 col-lg-5 col-xl-4">
                    <div class="login-form-container">
                        <div class="d-flex align-items-center justify-content-between mb-3">
                            <a href="../index.jsp" class="">
                                <h3 class="text-primary"><i class="fa fa-hashtag me-2"></i>DASHMIN</h3>
                            </a>
                            <h3 class="login-title">로그인 페이지</h3>
                        </div>

                        <!-- 로그인 오류 메시지 출력 -->
                        <span class="error-message">
                            <%= request.getAttribute("LoginErrMsg") == null ? "" : request.getAttribute("LoginErrMsg") %>
                        </span>

                        <%
                        /* session 영역에 해당 속성값이 있는지 확인 */
                        if (session.getAttribute("UserId") == null) { // 로그인 상태 확인
                        %>
                        <script>
                            /* 로그인 폼의 입력값을 서버로 전송하기 전에 검증하기 위해 정의한 함수 */
                            function validateForm(form) {
                                if (!form.user_id.value) {
                                    alert("아이디를 입력하세요.");
                                    return false;
                                }
                                if (form.user_pw.value == "") {
                                    alert("패스워드를 입력하세요.");
                                    return false;
                                }
                            }

                            // 로딩 화면을 숨기기 (jQuery 사용)
                            $(document).ready(function() {
                                $("#spinner").hide();
                            });
                        </script>

                        <form action="LoginProcess.jsp" method="post" name="loginFrm" onsubmit="return validateForm(this);">
                            <div class="form-floating mb-3">
                                아이디 : <input type="text" class="form-control" name="user_id" /><br />
                            </div>
                            <div class="form-floating mb-4">
                                패스워드 : <input type="password" class="form-control" name="user_pw" /><br />
                            </div>
                            <div class="d-flex align-items-center justify-content-between mb-4">
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                    <label class="form-check-label" for="exampleCheck1">로그인 유지</label>
                                </div>
                                <a href="">비밀번호 찾기</a>
                            </div>
                            <button type="submit" class="btn btn-primary py-3 w-100 mb-4">로그인하기</button>
                        </form>
                        <%
                        } else { // 로그인된 상태
                        %>
                            <%= session.getAttribute("UserName") %>님, 로그인하셨습니다.<br />
                            <a href="Logout.jsp">[로그아웃]</a>
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