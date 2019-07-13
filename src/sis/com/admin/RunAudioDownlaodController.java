package sis.com.admin;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sis.com.connection.DatabaseConnection;

public class RunAudioDownlaodController extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String docIdStr = request.getParameter("doc_id");
		long id = Long.parseLong(docIdStr);
		
		String fileName =null;
		InputStream docDbInputStream = null;
		//jdbc
		Connection con =null;
		PreparedStatement pstmt= null;
		ResultSet rs  = null;

		boolean isUploaded=false;
		try {
			con = DatabaseConnection.getConnection();
			String sql="select * from audiolist "
					+ "where songId="+id;
			pstmt = con.prepareStatement(sql);
			rs= pstmt.executeQuery();

			if(rs.next()){
				  docDbInputStream =rs.getBinaryStream("song");
				
				  //write into browser
				   //response.setContentType("application/octet-stream");
				   response.setContentType("audio/mpeg");
					//response.setHeader("Content-Disposition","attachment; filename=\""+fileName+"\"");
					
					ServletOutputStream sos = response.getOutputStream();
					
					byte []buff = new byte[1024];
					int length;
					while((length=docDbInputStream.read(buff))!=-1) {
						sos.write(buff, 0, length);	
					}
					sos.close();
				  
				  
				  // System.out.println("docDbInputStream =" +docDbInputStream.hashCode());
			}//enf if
		} catch (Exception e) {
			e.printStackTrace();
			//out.print("Error" +e.getMessage());
		}finally {
			try {
				DatabaseConnection.closeConnection(con);
			} catch (SQLException e) {
				System.out.print("DB close Error" +e.getMessage());
			}
		}//finally
		
		
		
	}

}
