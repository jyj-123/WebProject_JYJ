<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>회원가입</title>

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

        .register-form-container {
            background-color: #f8f9fa;
            border-radius: 8px;
            padding: 30px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .register-title {
            font-size: 1.2em;
            margin-bottom: 20px;
            line-height: 1;
        }
        
        .text-primary {
            font-size: 1.3em;
        }
    </style>
</head>

<body>
    <div class="container-xxl position-relative bg-white d-flex p-0">
        <!-- 회원가입 시작 -->
        <div class="container-fluid">        	
            <div class="row h-100 align-items-center justify-content-center" style="min-height: 100vh;">
                <div class="col-12 col-sm-8 col-md-6 col-lg-5 col-xl-4">
                    <div class="register-form-container">                
                    	<a href="../index.jsp" class="">
							<h3 class="text-primary"><i class="fa fa-hashtag me-2"></i>DASHMIN</h3>
						</a>
                    
                        <h3 class="register-title text-center">회원가입</h3>

                        <form action="RegisterProcess.jsp" method="post" name="registerFrm" onsubmit="return validateForm(this);">
                            <!-- 아이디 -->
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" id="user_id" name="user_id" placeholder="아이디">
                                <label for="user_id">아이디</label>
                            </div>
                            <!-- 비밀번호 -->
                            <div class="form-floating mb-3">
                                <input type="password" class="form-control" id="user_pw" name="user_pw" placeholder="비밀번호">
                                <label for="user_pw">비밀번호</label>
                            </div>
                            <!-- 이름 -->
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" id="user_name" name="user_name" placeholder="이름">
                                <label for="user_name">이름</label>
                            </div>
                            <!-- 이메일 -->
                            <div class="form-floating mb-3">
                                <input type="email" class="form-control" id="user_email" name="user_email" placeholder="이메일">
                                <label for="user_email">이메일</label>
                            </div>
                            <!-- 전화번호 -->
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" id="user_phone" name="user_phone" placeholder="전화번호">
                                <label for="user_phone">전화번호</label>
                            </div>

                            <!-- 회원가입 버튼 -->
                            <button type="submit" class="btn btn-primary py-3 w-100 mb-4">회원가입</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- 회원가입 끝 -->
    </div>

    <!-- JavaScript Libraries -->
    <script>
        function validateForm(form) {
            if (!form.user_id.value) {
                alert("아이디를 입력하세요.");
                return false;
            }
            if (!form.user_pw.value) {
                alert("비밀번호를 입력하세요.");
                return false;
            }
            if (!form.user_name.value) {
                alert("이름을 입력하세요.");
                return false;
            }
            if (!form.user_email.value) {
                alert("이메일을 입력하세요.");
                return false;
            }
            if (!form.user_phone.value) {
                alert("전화번호를 입력하세요.");
                return false;
            }
            return true;
        }
    </script>
</body>

</html>