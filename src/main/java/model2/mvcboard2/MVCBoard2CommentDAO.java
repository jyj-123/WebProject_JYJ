package model2.mvcboard2;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import common.DBConnPool;

public class MVCBoard2CommentDAO extends DBConnPool{
	
	public MVCBoard2CommentDAO() {
		super();
	}
	
	//댓글작성을 위한 쿼리문
	public int insertComment(MVCBoard2CommentDTO dto) {
        int result = 0;
        try {
        	
        	String query = "INSERT INTO board2_comment ( "
        					+ " idc, idx, id, content, postdate)"
        					+ " VALUES ( "
        					+ " seq_board2_comment_num.NEXTVAL, ?, ?, ?, SYSDATE)";
            
        	psmt = con.prepareStatement(query);
        	
        	psmt.setInt(1, dto.getIdx());
        	psmt.setString(2, dto.getId());
        	psmt.setString(3, dto.getContent());  	
        	result = psmt.executeUpdate();
        } 
        catch (Exception e) {
        	System.out.println("댓글 작성 중 예외 발생");
            e.printStackTrace();
        }
        
        return result;
            
    }
	
	// 댓글 목록 가져오기 및 댓글 수 계산
	public List<MVCBoard2CommentDTO> selectComments(int idx) {
	    List<MVCBoard2CommentDTO> comments = new ArrayList<>();
	    int commentCount = 0; // 댓글 수 저장 변수

	    try {
	        // 댓글 조회를 위한 SQL 쿼리문
	        String query = "SELECT * FROM board2_comment WHERE idx=? ORDER BY idc DESC";
	        psmt = con.prepareStatement(query);

	        // idx 값을 쿼리 파라미터로 설정
	        psmt.setInt(1, idx);

	        // 쿼리 실행 및 결과셋 가져오기
	        rs = psmt.executeQuery();

	        // 결과셋에서 댓글 정보 추출하여 리스트에 추가
	        while (rs.next()) {
	            MVCBoard2CommentDTO dto = new MVCBoard2CommentDTO();
	            dto.setIdc(rs.getInt("idc")); // 댓글 고유 ID
	            dto.setIdx(rs.getInt("idx")); // 게시글 ID
	            dto.setId(rs.getString("id")); // 댓글 작성자 ID
	            dto.setContent(rs.getString("content")); // 댓글 내용
	            dto.setPostdate(rs.getDate("postdate")); // 댓글 작성 날짜
	            
	            
	            comments.add(dto);
	            commentCount++; // 댓글 수 증가
	        }

	        // 모든 댓글에 댓글 수를 설정 (예시: 첫 번째 댓글에만 설정)
	        if (!comments.isEmpty()) {
	            comments.get(0).setCommentCount(commentCount); // 첫 번째 DTO에 댓글 수 설정
	        }

	    } catch (Exception e) {
	        System.out.println("댓글 조회 중 예외 발생");
	        e.printStackTrace();
	    }

	    return comments; // 댓글 목록 반환
	}
	
	 // 댓글 삭제
	   public int deleteComment(int commentId) {
	      int result = 0;
	      try {
	         String query = "DELETE FROM board2_comment WHERE idc=?";
	         psmt = con.prepareStatement(query);
	         psmt.setInt(1, commentId);
	         result = psmt.executeUpdate();
	      } catch (Exception e) {
	         System.out.println("댓글 삭제 중 예외 발생");
	         e.printStackTrace();
	      }
	      return result;
	   }

	   // 댓글 수정
	   public int updateComment(MVCBoard2CommentDTO dto) {
	      int result = 0;
	      try {
	         String query = "UPDATE board2_comment SET content=? WHERE idc=? AND id=?";
	         psmt = con.prepareStatement(query);
	         psmt.setString(1, dto.getContent());
	         psmt.setInt(2, dto.getIdc());
	         psmt.setString(3, dto.getId());
	         result = psmt.executeUpdate();
	      } catch (Exception e) {
	         System.out.println("댓글 수정 중 예외 발생");
	         e.printStackTrace();
	      }
	      return result;
	   }

	   // 특정 댓글 가져오기
	   // 댓글 조회 메서드 추가
	   public MVCBoard2CommentDTO getCommentById(String commentId) {
		   MVCBoard2CommentDTO dto = null;
	      try {
	         String query = "SELECT * FROM board2_comment WHERE idc=?";
	         psmt = con.prepareStatement(query);
	         psmt.setString(1, commentId);
	         rs = psmt.executeQuery();
	         if (rs.next()) {
	            dto = new MVCBoard2CommentDTO();
	            dto.setIdc(rs.getInt("idc"));
	            dto.setIdx(rs.getInt("idx"));
	            dto.setId(rs.getString("id"));
	            dto.setContent(rs.getString("content"));
	            dto.setPostdate(rs.getDate("postdate"));
	         }
	      } catch (Exception e) {
	         System.out.println("댓글 조회 중 예외 발생");
	         e.printStackTrace();
	      }
	      return dto;
	   }

	
}






























