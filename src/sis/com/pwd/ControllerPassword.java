package sis.com.pwd;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sis.com.connection.DatabaseConnection;


public class ControllerPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String userEmail = request.getParameter("email");
		String password = request.getParameter("cpwd");
		
		Connection con = null;
		PreparedStatement pstmt = null;
		int result=0;
		try{
			con = DatabaseConnection.getConnection();
			String sql2 = "update user_registration set password = ? where emailid = ?";
			pstmt = con.prepareStatement(sql2);
			pstmt.setString(1, password);
			pstmt.setString(2, userEmail);
			result = pstmt.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				DatabaseConnection.closeConnection(con);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		if(result == 1){
			request.getSession().setAttribute("msg", "Your password has been successfully changed. Please login again and enjoy reading.");
			response.sendRedirect("Login.jsp");
			
		}else{
			System.out.println("Result not updated");
		}
		
	}
    	
}
