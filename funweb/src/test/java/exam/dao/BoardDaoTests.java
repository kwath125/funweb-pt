package exam.dao;

import static org.junit.Assert.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestMethodOrder;

import exam.domain.BoardVo;
import lombok.extern.java.Log;

import org.junit.jupiter.api.MethodOrderer.OrderAnnotation;
import org.junit.jupiter.api.MethodOrderer.Random;
import org.junit.jupiter.api.Order;

@TestMethodOrder(OrderAnnotation.class)
@Log
public class BoardDaoTests {

	private BoardDao dao;
	
	@BeforeEach
	void init() {
		dao = BoardDao.getInstance();
	}
	
	@Order(1)
	@Test
	void testInsertDummyRows() {
		dao.deleteAll();
		assertEquals(0, dao.getCount());
		
		dao.insertDummyRows(1000);
		assertEquals(1000, dao.getCount());
	}

	@Order(2)
	@Test
	void testGetBoardNum() {
		assertEquals(1001, dao.getBoardNum());
	}
	
	@Order(3)
	@Test
	void testDeleteByNum() {
		assertEquals(1000, dao.getCount());
		
		dao.deleteByNum(1000);
		assertEquals(999, dao.getCount());
		
		dao.deleteByNum(999);
		assertEquals(998, dao.getCount());
	}

	@Order(4)
	@Test
	void testUpdate() {
		BoardVo board = dao.getBoardByNum(1);
		assertNotNull(board);
		
		board.setContent("글내용을 요렇게 수정했어요~");
		dao.update(board);
		
		BoardVo boardUpdated = dao.getBoardByNum(1);
		assertEquals(board.getContent(), boardUpdated.getContent());
	}
	
}
