package myshop.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import mysql.db.DbConnect;

public class MyshopDao {

	DbConnect db=new DbConnect();
	
	//insert
	public void insertShop(MyshopDto dto)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="insert into myshop values(null,?,?,?,?,now())";
		
		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setString(1, dto.getSangpum());
			pstmt.setString(2, dto.getPhoto());
			pstmt.setInt(3, dto.getPrice());
			pstmt.setString(4, dto.getIpgoday());
			
			//실행
			pstmt.execute();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
	}
	
	
	//전체출력
	public Vector<MyshopDto> selectShop(){
	      
	      Vector<MyshopDto> list=new Vector<>();
	      
	      PreparedStatement pstmt=null;
	      ResultSet rs=null;
	      
	      String sql="select * from myshop order by num";
	      
	      Connection conn=db.getConnection();
	      
	      try {
	         pstmt=conn.prepareStatement(sql);
	         rs=pstmt.executeQuery();
	         
	         while(rs.next()) {
	            
	            MyshopDto dto=new MyshopDto();
	            
	            dto.setNum(rs.getString("num"));
	            dto.setSangpum(rs.getString("sangpum"));
	            dto.setPhoto(rs.getString("photo"));
	            dto.setPrice(Integer.parseInt(rs.getString("price")));
	            dto.setIpgoday(rs.getString("ipgoday"));
	            dto.setWriteday(rs.getTimestamp("writeday"));
	            
	            list.add(dto);
	            
	         }
	         
	         
	      } catch (SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }finally {
	         db.dbClose(rs, pstmt, conn);
	      }return list;
	      
	    
	      
	   }
	
	
}
