package sis.com.admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sis.com.connection.DatabaseConnection;

public class DeleteAudioController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String bookId = request.getParameter("id");
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try{
			
			con = DatabaseConnection.getConnection();
			String sql = "delete audiolist where songid = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bookId);
			pstmt.executeQuery();
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				DatabaseConnection.closeConnection(con);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		response.sendRedirect("AllAudioSong");
		
	
		}

}
