package com.miso.BProject;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class BoardTests {

		@Setter(onMethod_ = @Autowired)
		private DataSource ds;

		
		@Test
		public void testInsertArticles() {
			
			String sql = "insert into MP_BOARD(BNO, TITLE, CONTENT, WRITER, REGDATE)"
					+ "VALUES (MP_BOARD_SEQ.NEXTVAL,?,?,?,sysdate)";
			for (int i = 0; i < 100; i++) {
				Connection con = null;
				PreparedStatement pstmt = null;
				
				try {
					con = ds.getConnection();
					pstmt = con.prepareStatement(sql);
					pstmt.setNString(1, "title 테스트"+i);
					pstmt.setNString(2, "content 테스트"+i);
					pstmt.setNString(3, "writer 테스트"+i);
					
					pstmt.executeUpdate();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					if(pstmt!=null) {try {pstmt.close();}catch(Exception e) {}}
					if(con!=null) {try {con.close();}catch(Exception e) {}}
				}
			}
		}
}
