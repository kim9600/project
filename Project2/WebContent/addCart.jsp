<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="dto.Product"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="dbconn.jsp" %>
<%
	String id=request.getParameter("id");
	if(id==null || id.trim().equals("")){
		response.sendRedirect("products.jsp");
		return;
	}
	String sql="select * from product where p_id=?";
	//id값이 존재하면 상품처리 객체생성
	PreparedStatement pstmt= con.prepareStatement(sql);
	pstmt.setString(1, id);
	ResultSet rs= pstmt.executeQuery();
	Product product=null;	
	if(rs.next()){
	product =new Product();
	product.setProductId(id);
	product.setPname(rs.getString("p_name"));
	product.setUnitPrice(rs.getInt("p_unitPrice"));
	product.setDescription(rs.getString("p_description"));
	product.setManufacturer(rs.getString("p_manufacturer"));
	product.setCategory(rs.getString("p_category"));
	product.setUnitsInStock(rs.getLong("p_unitsInStock"));
	product.setCondition(rs.getString("p_condition"));
	product.setFilename(rs.getString("p_fileName"));

	}
	//해당id에 맞는 상품정보 얻기	

	if(product==null){ //해당id로 상품 존재하지않으면 에러페이지로 이동
		response.sendRedirect("exceptionNoProductid.jsp");
	return;
	}
	//세션에 cartlist 
	ArrayList<Product> list =(ArrayList<Product>)session.getAttribute("cartlist");
	if(list==null){
		System.out.println("세션에 cartlist정보가 없음,새로만듦");
		list=new ArrayList<Product>();
		product.setQuantity(1); //장바구니 등록수량을 1로 초기화
		list.add(product); 
		session.setAttribute("cartlist",list);
	}else{
		System.out.println("세션에 cartlist정보가 있음");
		int count=0; //카트리스트에 해당상품 존재확인 플래그용 변수
		for(int i=0;i<list.size();i++){
			if(list.get(i).getProductId().equals(id)){
				count++;
				System.out.println("기존수량:"+list.get(i).getQuantity());
				//기존수량 +1;
				int orderQuantity= list.get(i).getQuantity()+1;  //장바구니수량 증가
				list.get(i).setQuantity(orderQuantity);
			}		
		}
			//cartlist에 해당상품이 없을때
			if(count==0){
			product.setQuantity(1); //수량 설정후
			list.add(product); //카트리스트에 저장
			}
		session.setAttribute("cartlist",list);

		
	}
	

 
	
	//상세페이지로 이동시 원래 상품정보출력
	//try{
/* 	response.sendRedirect("product.jsp?id="+id); */
		out.print("<script>");
		out.print("history.back()");
		out.print("</script>");
	
	
	%>
	
	
	
	
	