package sis.com.email;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sis.com.connection.DatabaseConnection;


public class EmailCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String emailCheck = request.getParameter("emailrecover");
		String signupemail = request.getParameter("email");
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			con = DatabaseConnection.getConnection();
			String sql = "select * from user_registration where emailid = ?";
			pstmt = con.prepareStatement(sql);
			if(emailCheck != null){
				pstmt.setString(1, emailCheck);
				System.out.println("emailcheck if part = "+emailCheck);
				
			}else if(signupemail != null){
				pstmt.setString(1, signupemail);
				System.out.println("signupemail else part = "+signupemail);
			}
			
			rs = pstmt.executeQuery();
			if(rs.next() == true){
				
				if(emailCheck != null){
					
					HttpSession session = request.getSession();
					session.setAttribute("emailrecover",emailCheck);
					request.getRequestDispatcher("EmailSendDemo").forward(request,response);
					
					System.out.println("rs.next() == true && emailCheck != null");
					
				}else if(signupemail != null){
					
					request.getSession().setAttribute("emailexists", "Username already exists");
					response.sendRedirect("signupemail.jsp");
				
					System.out.println("rs.next() == true && signupemail != null");
					
				}
			}else if(rs.next() == false){
				
				if(emailCheck != null){
					
					request.getSession().setAttribute("error_msg", "Username not exists");
					response.sendRedirect("forgotpassword.jsp");
					
					System.out.println("rs.next() == false && emailCheck != null");
				
				}else if(signupemail != null){
					
					HttpSession session = request.getSession();
					session.setAttribute("signupemail",signupemail);
					request.getRequestDispatcher("EmailSendDemo").forward(request,response);
					
					System.out.println("rs.next() == false && signupemail != null");
					
				}
			}
			
		}catch(Exception e ){
			e.printStackTrace();
		}finally{
			try{
				DatabaseConnection.closeConnection(con);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	}

}
