package sis.com.image;

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
import javax.servlet.http.HttpSession;

import sis.com.connection.DatabaseConnection;
import sis.com.user.User;


public class GetImageController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession httpSession = request.getSession();
		User user = (User)httpSession.getAttribute("user");
	
		String emailid = null;
		if(user==null){
			emailid = (String)request.getParameter("img_id");
		}else{
			emailid = user.getLoginId();
		}
		
		
		
		String fileName =null;
		InputStream imageInputStream = null;
		Connection con =null;
		PreparedStatement pstmt= null;
		ResultSet rs  = null;

		
		try {
			con = DatabaseConnection.getConnection();
			String sql="select * from user_registration where emailid=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, emailid);
			rs= pstmt.executeQuery();

			if(rs.next()){
				imageInputStream =rs.getBinaryStream("profileimage");
				    response.setContentType("image/jpg");
					ServletOutputStream sos = response.getOutputStream();
					byte []buff = new byte[1024];
					int length;
					while((length=imageInputStream.read(buff))!=-1) {
						sos.write(buff, 0, length);	
					}
					sos.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				DatabaseConnection.closeConnection(con);
			} catch (SQLException e) {
				System.out.print("DB close Error" +e.getMessage());
			}
		}		
		
		
	}

}
