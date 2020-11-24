package exam.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import exam.domain.BoardVo;

public interface BoardMapper {
	
	
	// 게시판 새글번호 생성
	@Select("select ifnull(max(num), 0) + 1 as max_num from board ")
	int getBoardNum();
	
	
	// 게시글 삽입
	int insertBoard(BoardVo vo);
	
	// 글갯수
	int getTotalCount(@Param("category") String category,
			@Param("search") String search);
	
	// 매퍼 메소드의 매개변수가 2개 이상일때는
	// @Param 애노테이션 값으로 sql문에 배치함.
	// select문을 xml에서 실행할때는
	// resultType 속성을 반드시 해당 Vo로 지정해야 함.
	// 글목록 가져오기
	List<BoardVo> getBoards(@Param("startRow") int startRow, 
			@Param("pageSize") int pageSize,
			@Param("category") String category,
			@Param("search") String search);
	
	
	// 글 가져오기 (첨부파일 조인)
	BoardVo getBoardByNum(int num);
	
	
	// 조회수 증가
	void updateReadcount(int num);
	
	
	// 게시글 수정
	void update(BoardVo vo);
	
	// 게시글 삭제
	@Delete("DELETE FROM board WHERE num = #{num}")
	void deleteByNum(int num);
	
	
	// 답글 정보
	int updateReSeqByReRef(@Param("reRef") int reRef, @Param("reSeq") int reSeq);
	
	
	// board와 attachfile 테이블 조인해서 select
	BoardVo getBoardAndAttachfilesByNum(int num);
	
	@Delete("DELETE FROM board")
	void deleteAll();
	
	@Select("SELECT COUNT(*) FROM board")
	int getCount();
	
	
}





