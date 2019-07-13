package sis.com.admin;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import sis.com.connection.DatabaseConnection;
public class StudentAttachamentAudioUploadConroller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		SongList songList= (SongList)session.getAttribute("songList"); 
		
		
	    List <FileItem> fileItemList= null;
		 ServletFileUpload uploader = new ServletFileUpload(new DiskFileItemFactory());
		 try {
			fileItemList= uploader.parseRequest(request);
		} catch (FileUploadException e) {
			e.printStackTrace();
		}
		 
		 FileItem fileItem = fileItemList.get(0);
		 String fileName =fileItem.getName();
		 long fileSize =fileItem.getSize();
		 InputStream docInputStream  = fileItem.getInputStream();		
		
		//jdbc
		 Connection con =null;
		 PreparedStatement pstmt= null;
		 boolean isUploaded=false;
		 try {
			con = DatabaseConnection.getConnection();
			String sql="insert into audiolist "
					+ "values(song_id.nextval,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, songList.getSongCategory());
			pstmt.setString(2, fileName);
			pstmt.setString(3, songList.getSingerName());
			pstmt.setLong(4, (long) songList.getRating());
			pstmt.setBinaryStream(5, docInputStream, (int)fileSize);
			int result = pstmt.executeUpdate();
			if(result==1) {
				isUploaded=true;
			}
			
			System.out.println("is Uploaded = "+isUploaded);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				DatabaseConnection.closeConnection(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(isUploaded)
			response.sendRedirect("AllAudioSong");
	}

}
