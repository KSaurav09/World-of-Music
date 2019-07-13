package sis.com.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sis.com.connection.DatabaseConnection;


public class UserDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
			String fname = request.getParameter("fname");
			String lname = request.getParameter("lname");
			String dobStr = request.getParameter("dateofbirth");
			
			Date dob = null;
			try {
				dob = (Date) new SimpleDateFormat("dd-MM-yyyy").parse(dobStr);
			} catch (ParseException e1) {
				e1.printStackTrace();
			}			
			java.sql.Date sqlDate = new java.sql.Date(dob.getTime());
		
			long mob = Long.parseLong(request.getParameter("mob"));
			String email = request.getParameter("email");
			String cpsd = request.getParameter("cpwd");
			
			Connection con = null;
			PreparedStatement pstmt = null;
			try{
				con = DatabaseConnection.getConnection();
				String sql = "insert into user_registration values(?,?,?,?,?,?,default,default)";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1,fname);
				pstmt.setString(2,lname);
				pstmt.setDate(3,sqlDate);
				pstmt.setLong(4,mob);
				pstmt.setString(5,email);
				pstmt.setString(6,cpsd);
				pstmt.executeUpdate();
			}catch(SQLException e){
				e.printStackTrace();
			}catch (Exception e) {
				e.printStackTrace();
			}finally{
				try{
					DatabaseConnection.closeConnection(con);
				}catch(Exception e){
					e.printStackTrace();
				}
			}
		
			response.sendRedirect("Login.jsp");
			
	}

}
