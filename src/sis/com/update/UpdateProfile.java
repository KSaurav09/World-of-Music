package sis.com.update;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sis.com.connection.DatabaseConnection;
import sis.com.user.User;

public class UpdateProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		long mobno = Long.parseLong(request.getParameter("mob"));
		
		
		Connection con = null;
		PreparedStatement pstmt = null;
		boolean isUpdated = false;
		try{
			con = DatabaseConnection.getConnection();
			String sql = "update user_registration set fname = ?,lname = ?, mobno =? "
					+ "where emailid = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,fname);
			pstmt.setString(2,lname);
			pstmt.setLong(3,mobno);
			pstmt.setString(4, user.getLoginId());
			
			int r = pstmt.executeUpdate();
			if(r==1){
				 isUpdated = true;
				 
				 //User updateuser = new User();
				 user.setFname(fname);
				 user.setLname(lname);
				 user.setMobno(mobno);
				 
				 System.out.println("record updated");
				 
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				DatabaseConnection.closeConnection(con);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		response.sendRedirect("profile.jsp");
		
	}

}
