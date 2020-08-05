package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dto.Product;
import mvc.database.DBConnection;

public class ProductDAO1 {
	static final int LISTCOUNT = 10;
	int limit = LISTCOUNT;
	//자신타입의 필드 선언
	private static ProductDAO1 instance;
	//default생성자 캡슐화
	private ProductDAO1() {}
	//자신타입의 인스턴스 제공 메소드
	public static ProductDAO1 getInstance() {
		if(instance == null) instance = new ProductDAO1();
		return instance;
	}
	//조회된 board테이블의 레코드(row)건수
	public int getProductCount(String category) {
		//DB접속객체 생성
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int x = 0;
		String sql = "select count(*) from product where p_category = ?";

		try {
			con = DBConnection.getInstance().getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, category);
			rs = pstmt.executeQuery();
			if(rs.next())
				x = rs.getInt(1);
		} catch (Exception e) {
			System.out.println("getProductCount()에러"+e.getMessage());
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (Exception e2) {
				throw new RuntimeException(e2.getMessage());
			}
		}
		return x;
	}
	//전체 레코드로 페이지계산
	public int getProductPageCount(String category) {
		int rec_cnt = getProductCount(category);
		int total_page = (rec_cnt/limit)+((rec_cnt%limit)>0?1:0);
		return total_page;
	}

	//선택된 Product테이블에서 p_id에 해당하는 페이지 결정
	public int getProductPage(String id, String category) {
		//DB접속객체 생성
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int index = 1;
		int pageNum = 0;
		//글전체건수 가져오기
		int total_record = getProductCount(category);
		try {
			con = DBConnection.getInstance().getConnection();
			String sql = "select * from product where p_category = ? order by p_id desc";//최신상품 순
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, category);
			rs = pstmt.executeQuery();
			while(rs.absolute(index)) {//한개씩 전진
				if(rs.getString(1).equals(id)) {
					pageNum = (index/limit)+((index%limit)>0?1:0);
					return pageNum;
				}
				if(index <= total_record)
					index++;
				else//한페이지를 채우면 종료
					break;
			}
		} catch (Exception e) {
			System.out.println("getProductPage()에러"+e.getMessage());
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (Exception e2) {
				throw new RuntimeException(e2.getMessage());
			}
		}
		return pageNum;
	}
	//조회목록 리턴 메소드
	public List<Product> getProductList(int pageNum, String category) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int total_record = getProductCount(category);
		//시작페이지의 글번호
		pageNum = pageNum==0?1:pageNum;
		int start = (pageNum - 1) * limit;//파라미터로 넘어온 페이지와 페이지당 건수를 곱하여 시작글번호 지정
		//
		int index = start + 1;
		//쿼리문 생성
		String sql = "select * from product where p_category = ? order by p_id DESC";//최신자료 역순
		//리스트 객체 생성
		ArrayList<Product> list = new ArrayList<Product>();
		try {
			con = DBConnection.getInstance().getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, category);
			rs = pstmt.executeQuery();
			while(rs.absolute(index)) {//한개씩 전진
				Product pd = new Product();
				pd.setProductId(rs.getString("p_id"));
				pd.setPname(rs.getString("p_name"));
				pd.setUnitPrice(rs.getInt("p_unitPrice"));
				pd.setDescription(rs.getString("p_description"));
				pd.setManufacturer(rs.getString("p_manufacturer"));
				pd.setCategory(rs.getString("p_category"));
				pd.setUnitsInStock(rs.getInt("p_unitsInStock"));
				pd.setCondition(rs.getString("p_condition"));
				pd.setFilename(rs.getString("p_filename"));
				/* pd.setQuantity(rs.getInt("quantity")); */
				
				//리스트에 추가
				list.add(pd);
				
				//한페이지 글 제한 갯수(10)이내면 증가
				if(index < (start+limit) && index <= total_record)
					index++;
				else//한페이지를 채우면 종료
					break;
			}
		} catch (Exception e) {
			System.out.println("getProductList()에러:"+e.getMessage());
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (Exception e2) {
				throw new RuntimeException(e2.getMessage());
			}
		}
		return list; //조회된 게시글 리스트 리턴
	}
	//id에 해당하는 자료 가져옴
	public Product getProductById(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from product order by p_id =?";
		Product pd = new Product();
		try {
			con = DBConnection.getInstance().getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				pd.setProductId(rs.getString("p_id"));
				pd.setPname(rs.getString("p_name"));
				pd.setUnitPrice(rs.getInt("p_unitPrice"));
				pd.setDescription(rs.getString("p_description"));
				pd.setManufacturer(rs.getString("p_manufacturer"));
				pd.setCategory(rs.getString("p_category"));
				pd.setUnitsInStock(rs.getInt("p_unitsInStock"));
				pd.setCondition(rs.getString("p_condition"));
				pd.setFilename(rs.getString("p_filename"));
				return pd;
			}
		} catch (Exception e) {
			System.out.println("getProductList()에러:"+e.getMessage());
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (Exception e2) {
				throw new RuntimeException(e2.getMessage());
			}
		}
		return null;
	}
}
