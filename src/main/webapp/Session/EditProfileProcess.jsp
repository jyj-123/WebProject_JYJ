<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="membership.MemberDAO" %>
<%@ page import="membership.MemberDTO" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.SQLException" %>

<%
	System.out.println("UserId: " + request.getParameter("UserId"));
	System.out.println("UserName: " + request.getParameter("user_name"));
	System.out.println("UserEmail: " + request.getParameter("user_email"));
	System.out.println("UserPhone: " + request.getParameter("user_phone"));
	System.out.println("NewPassword: " + request.getParameter("user_pw"));

    // 로그인된 사용자 정보가 없으면 리다이렉트
    if (session.getAttribute("UserId") == null) {
        response.sendRedirect("Login.jsp");
        return;
    }

    // 세션에서 로그인된 사용자 정보 가져오기
    String userId = request.getParameter("UserId");
    String userName = request.getParameter("user_name");
    String userEmail = request.getParameter("user_email");
    String userPhone = request.getParameter("user_phone");
    String newPassword = request.getParameter("user_pw");

    // DTO 객체에 수정된 회원 정보 세팅
    MemberDTO memberDTO = new MemberDTO();
    memberDTO.setId(userId);
    memberDTO.setName(userName);
    memberDTO.setEmail(userEmail);
    memberDTO.setPhone(userPhone);

    // 비밀번호가 변경된 경우 처리
    if (newPassword != null && !newPassword.isEmpty()) {
        memberDTO.setPwd(newPassword);  // 비밀번호 그대로 설정
    }

    // DAO 객체 생성하여 데이터베이스에 업데이트 처리
    MemberDAO memberDAO = new MemberDAO(getServletContext());
    boolean isSuccess = memberDAO.updateMember(memberDTO);

    if (isSuccess) {
    	session.setAttribute("UserId", memberDTO.getId()); // ID 갱신
    	session.setAttribute("UserName", memberDTO.getName()); // Name 갱신
    	session.setAttribute("UserEmail", memberDTO.getEmail()); // Email 갱신
    	session.setAttribute("UserPhone", memberDTO.getPhone());
    	
        response.sendRedirect("EditProfile.jsp?msg=Profile+updated+successfully");
    } else {
        response.sendRedirect("EditProfile.jsp?msg=Error+updating+profile");
    }
%>