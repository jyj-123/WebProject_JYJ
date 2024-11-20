<%@ page import="membership.MemberDAO" %>
<%@ page import="membership.MemberDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    // 회원가입 폼에서 전송된 데이터 수신
    String userId = request.getParameter("user_id");
    String userPwd = request.getParameter("user_pw");
    String userName = request.getParameter("user_name");
    String userEmail = request.getParameter("user_email");
    String userPhone = request.getParameter("user_phone");

    System.out.println("회원가입 요청: " + userId + ", " + userName);

    // web.xml에서 DB 접속 정보를 가져옴
    String oracleDriver = application.getInitParameter("OracleDriver");
    String oracleURL = application.getInitParameter("OracleURL");
    String oracleId = application.getInitParameter("OracleId");
    String oraclePwd = application.getInitParameter("OraclePwd");

    System.out.println("DB 연결 정보: " + oracleDriver + ", " + oracleURL);

    // DAO 객체 생성 및 DB 연결
    MemberDAO dao = new MemberDAO(oracleDriver, oracleURL, oracleId, oraclePwd);

    // DTO에 회원가입 데이터를 설정
    MemberDTO memberDTO = new MemberDTO();
    memberDTO.setId(userId);
    memberDTO.setPwd(userPwd);
    memberDTO.setName(userName);
    memberDTO.setEmail(userEmail);
    memberDTO.setPhone(userPhone);

    // 회원가입 처리
    boolean result = dao.registerMember(memberDTO);

    // DB 연결 종료
    dao.close();

    // 처리 결과에 따른 응답 처리
    if (result) { // 회원가입 성공
        session.setAttribute("UserId", userId);
        session.setAttribute("UserName", userName);
        response.sendRedirect("LoginForm.jsp?success=register");
    } else { // 회원가입 실패
        request.setAttribute("RegisterErrMsg", "회원가입 중 오류가 발생했습니다.");
        request.getRequestDispatcher("Register.jsp").forward(request, response);
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 처리</title>
</head>
<body>
</body>
</html>