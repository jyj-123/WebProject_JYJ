package membership;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import common.JDBConnect;
import jakarta.servlet.ServletContext;

public class MemberDAO extends JDBConnect {

    // 생성자1 : 드라이버, URL, 계정 정보로 DB 연결
    public MemberDAO(String drv, String url, String id, String pw) {
        super(drv, url, id, pw);
    }

    // 생성자2 : ServletContext로 초기화
    public MemberDAO(ServletContext application) {
        super(application);
    }

    // 회원 인증을 위한 메서드
    public MemberDTO getMemberDTO(String uid, String upass) {
        MemberDTO dto = new MemberDTO();
        String query = "SELECT * FROM users WHERE id=? AND pwd=?";
        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, uid);
            psmt.setString(2, upass);
            rs = psmt.executeQuery();
            if (rs.next()) {
                dto.setId(rs.getString("id"));
                dto.setPwd(rs.getString("pwd"));
                dto.setName(rs.getString("name"));
                dto.setEmail(rs.getString("email"));
                dto.setPhone(rs.getString("phone_number"));
                dto.setRegidate(rs.getString("created_at"));
                dto.setUpdatedAt(rs.getString("updated_at"));
                dto.setLastLoginAt(rs.getString("last_login_at"));
                dto.setStatus(rs.getString("status"));
                dto.setLoginAttempts(rs.getInt("login_attempts"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(); // 자원 해제
        }
        return dto;
    }

    // 회원가입 처리 메서드
    public boolean registerMember(MemberDTO memberDTO) {
        boolean isSuccess = false;
        String query = """
            INSERT INTO users (id, pwd, name, email, phone_number, created_at, updated_at, status)
            VALUES (?, ?, ?, ?, ?, SYSDATE, SYSDATE, 'active')
            """;
        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, memberDTO.getId());
            psmt.setString(2, memberDTO.getPwd());
            psmt.setString(3, memberDTO.getName());
            psmt.setString(4, memberDTO.getEmail());
            psmt.setString(5, memberDTO.getPhone());
            int rowsAffected = psmt.executeUpdate();
            isSuccess = rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return isSuccess;
    }

    // 회원정보 수정 메서드
    public boolean updateMember(MemberDTO memberDTO) {
        boolean isUpdated = false;
        String query;

        // 비밀번호 변경 여부에 따라 SQL 쿼리 동적 작성
        if (memberDTO.getPwd() != null && !memberDTO.getPwd().isEmpty()) {
            query = """
                UPDATE users 
                SET name=?, email=?, phone_number=?, pwd=?, updated_at=SYSDATE 
                WHERE id=?
                """;
        } else {
            query = """
                UPDATE users 
                SET name=?, email=?, phone_number=?, updated_at=SYSDATE 
                WHERE id=?
                """;
        }

        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, memberDTO.getName());
            psmt.setString(2, memberDTO.getEmail());
            psmt.setString(3, memberDTO.getPhone());

            if (memberDTO.getPwd() != null && !memberDTO.getPwd().isEmpty()) {
                psmt.setString(4, memberDTO.getPwd());
                psmt.setString(5, memberDTO.getId());
            } else {
                psmt.setString(4, memberDTO.getId());
            }

            // 디버깅 로그
            System.out.println("Executing query: " + query);
            System.out.println("Name: " + memberDTO.getName());
            System.out.println("Email: " + memberDTO.getEmail());
            System.out.println("Phone: " + memberDTO.getPhone());
            System.out.println("Password: " + memberDTO.getPwd());
            System.out.println("ID: " + memberDTO.getId());

            // SQL 실행
            int rowsAffected = psmt.executeUpdate();
            isUpdated = rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(); // 자원 해제
        }

        return isUpdated;
    }
}