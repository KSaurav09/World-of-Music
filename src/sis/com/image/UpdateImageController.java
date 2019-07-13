package sis.com.image;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
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
import sis.com.user.User;

public class UpdateImageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession httpSession = request.getSession();
		User user = (User)httpSession.getAttribute("user");
		
		List <FileItem> fileItemList= null;
		 ServletFileUpload uploader = new ServletFileUpload(new DiskFileItemFactory());
		 try {
			fileItemList= uploader.parseRequest(request);
			System.out.println("fileItemList = "+fileItemList);
		} catch (FileUploadException e) {
			e.printStackTrace();
		}
		 
		 FileItem fileItem = fileItemList.get(0);
		 String fileName =fileItem.getName();
		 long fileSize =fileItem.getSize();
		 InputStream imageInputStream  = fileItem.getInputStream();		
		
		 Connection con =null;
		 PreparedStatement pstmt= null;
		 boolean isUploaded=false;
		 try{
			 con = DatabaseConnection.getConnection();
			 String sql = "update user_registration set profileimage = ? where emailid = ?";
			 pstmt = con.prepareStatement(sql);
			 pstmt.setBinaryStream(1,imageInputStream, (int)fileSize);
			 pstmt.setString(2,user.getLoginId());
			 
			 int result = pstmt.executeUpdate();
			 if(result==1) {
				isUploaded=true;
			}
			 System.out.println("is Uploaded = "+isUploaded);
			 
		 }catch(Exception e){
			 e.printStackTrace();
			 System.out.println("is Uploaded = "+isUploaded);
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
