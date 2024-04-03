package DAO;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DTO.Book;





/**
 *  데이터 접근 객체
 *  - 게시글 데이터 접근
 */
public class BookDAO extends JDBConnection {
	
	// 데이터 목록
	public List<Book> list() {
		
		// 게시글 목록을 담을 컬렉션 객체 생성
		List<Book> boardList = new ArrayList<Book>();
		
		// SQL 작성
		String sql = " SELECT * "
				   + " FROM book ";
		try {
			// 쿼리(SQL) 실행 객체 생성 - Statement (stmt)
			stmt = con.createStatement();
			
			// 쿼리(SQL) 실행 -> 결과  - ResultSet (rs)
			rs = stmt.executeQuery(sql);
			
			// 조회 결과를 리스트(boardList)에 추가
			while( rs.next() ) {		// next() : 실행 결과의 다음 데이터로 이동
				Book board = new Book();
				
				// 결과 데이터 가져오기
				// rs.getXXX("컬럼명") --> 해당 컬럼의 데이터를 가져온다
				// * "컬럼명"의 값을 특정 타입으로 변환
				board.setBname( rs.getString("bname") );
				board.setAuthor( rs.getString("author") );
				board.setCategory( rs.getString("category") );
				board.setNo( rs.getInt("no") );

				// 게시글 목록에 추가
				boardList.add(board);
			}
		} catch(SQLException e) {
			System.err.println("도서 목록 조회 시, 예외 발생");
			e.printStackTrace();
		}
		// 게시글 목록 반환
		return boardList;
	}
	
	// 데이터 조회
	public Book select(int no) {
		
		// 게시글 정보 객체 생성
		Book board = new Book();
		
		// SQL 작성
		String sql = " SELECT * "
				   + " FROM book "
				   + " WHERE no = ? ";
		try {
			// 쿼리(SQL) 실행 객체 생성 - PreparedStatement (psmt)
			psmt = con.prepareStatement(sql);
			
			// psmt.setXXX( 순서번호, 매핑할 값 );
			psmt.setInt( 1, no );		// ?(1) <-- no (글번호)
			
			// 쿼리(SQL) 실행 -> 결과  - ResultSet (rs)
			rs = psmt.executeQuery();
			
			// 조회 결과를 1건 가져오기
			if( rs.next() ) {		// next() : 실행 결과의 다음 데이터로 이동
				// 결과 데이터 가져오기
				// rs.getXXX("컬럼명") --> 해당 컬럼의 데이터를 가져온다
				// * "컬럼명"의 값을 특정 타입으로 변환
				board.setBname( rs.getString("bname") );
				board.setIsbn(rs.getString("isbn"));
				board.setAuthor( rs.getString("author") );
				board.setCategory( rs.getString("category") );
				board.setmake_Date(rs.getString("make_Date"));
				board.setTotal( rs.getInt("total") );
				board.setNo( rs.getInt("no") );
				
			}
		} catch(SQLException e) {
			System.err.println("도서 조회 시, 예외 발생");
			e.printStackTrace();
		}
		// 게시글 정보 1건 반환
		return board;
	}
	
	
	// 데이터 등록
	public int insert(Book board) {
		int result = 0;		// 결과 : 적용된 데이터 건수
		
		String sql = " INSERT INTO book (no, bname, isbn, author, category, make_Date, total) "
				   + " VALUES(SEQ_BOARD.NEXTVAL, ?, ?, ?,?,?,? ) ";
		
		try {
			psmt = con.prepareStatement(sql);			// 쿼리 실행 객체 생성
			psmt.setString( 1, board.getBname() );		// 1번 ? 에 책 제목 매핑
			psmt.setString( 2, board.getIsbn() );		// 2번 ? 에 isbn을 매핑
			psmt.setString( 3, board.getAuthor() );		// 3번 ? 에 작가를 매핑
			psmt.setString( 4, board.getCategory() );	// 4번 ? 에 분류를 매핑
			psmt.setString( 5, board.getmake_Date() );	// 5번 ? 에 날짜를 매핑
			psmt.setInt( 6, board.getTotal() );			// 6번 ? 에 수량 매핑
			
			result = psmt.executeUpdate();		// SQL 실행 요청, 적용된 데이터 개수를 받아온다.
												// 게시글 1개 적용 성공 시, result : 1
												// 				실패 시, result : 0
			// executeUpdate()
			// : SQL (INSERT, UPDATE, DELETE)을 실행하고 적용된 데이터 개수를 int 타입으로 반환
		} catch (SQLException e) {
			System.err.println("도서 등록 시, 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	
	// 데이터 수정
	public int update(Book board) {
		int result = 0;		// 결과 : 적용된 데이터 건수
		
		String sql = " UPDATE book "
				   + " SET bname = ? "
				   + "	   ,isbn = ?"
				   + "    ,author  = ? "
				   + "    ,category = ?"
				   + "	  ,make_Date = ?"
				   + "		,total = ?"
				   + " WHERE no = ? ";
		
		try {
			psmt = con.prepareStatement(sql);			// 쿼리 실행 객체 생성
			psmt.setString( 1, board.getBname() );		// 1번 ? 에 책 제목 매핑
			psmt.setString( 2, board.getIsbn() );		// 2번 ? 에 isbn을 매핑
			psmt.setString( 3, board.getAuthor() );		// 3번 ? 에 작가를 매핑
			psmt.setString( 4, board.getCategory() );	// 4번 ? 에 분류를 매핑
			psmt.setString( 5, board.getmake_Date() );	// 5번 ? 에 날짜를 매핑
			psmt.setInt( 6, board.getTotal() );			// 6번 ? 에 수량 매핑
			
			result = psmt.executeUpdate();		// SQL 실행 요청, 적용된 데이터 개수를 받아온다.
												// 게시글 1개 적용 성공 시, result : 1
												// 				실패 시, result : 0
			// executeUpdate()
			// : SQL (INSERT, UPDATE, DELETE)을 실행하고 적용된 데이터 개수를 int 타입으로 반환
		} catch (SQLException e) {
			System.err.println("도서 게시글 수정 시, 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	
	// 데이터 삭제
	public int delete(int no) {
		int result = 0;		// 결과 : 적용된 데이터 건수
		
		String sql = " DELETE FROM book "
				   + " WHERE no = ? ";
		
		try {
			psmt = con.prepareStatement(sql);	// 쿼리 실행 객체 생성
			psmt.setInt( 1, no );				// 1번 ? 에 게시글 번호를 매핑
			
			result = psmt.executeUpdate();		// SQL 실행 요청, 적용된 데이터 개수를 받아온다.
												// 게시글 1개 적용 성공 시, result : 1
												// 				실패 시, result : 0
			// executeUpdate()
			// : SQL (INSERT, UPDATE, DELETE)을 실행하고 적용된 데이터 개수를 int 타입으로 반환
		} catch (SQLException e) {
			System.err.println("도서 삭제 시, 예외 발생");
			e.printStackTrace();
		}
		return result;
	}

	
}