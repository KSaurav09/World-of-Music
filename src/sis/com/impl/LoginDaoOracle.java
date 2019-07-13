package sis.com.impl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import sis.com.connection.DatabaseConnection;
import sis.com.dao.LoginDao;
import sis.com.user.User;

public class LoginDaoOracle implements LoginDao{
	
	public User validateUser(String loginId,String loginpassword){
		
		User foundUser = null;
		
		Connection con = null;
		PreparedStatement  pstmt = null;
		ResultSet rs = null;
		
		try{
			con = DatabaseConnection.getConnection();
			String sql = "select * from user_registration where"
					+ " emailid = ? and password = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,loginId);
			pstmt.setString(2,loginpassword);
			
			rs = pstmt.executeQuery();
			if(rs.next()){
				
				Date dob = rs.getDate("dob");
				long mobno = rs.getLong("mobno");
				String emailId = rs.getString("emailid");
				String role = rs.getString("role");
				String fname = rs.getString("fname");
				String profileImage = rs.getString("profileimage");
				String lname = rs.getString("lname");
				
				//String name = fname+" "+lname;
				
				foundUser = new User();
				foundUser.setName(fname);
				foundUser.setRole(role);
				foundUser.setLoginId(emailId);
				foundUser.setDob(dob);
				foundUser.setMobno(mobno);
				foundUser.setFname(fname);
				foundUser.setLname(lname);
				foundUser.setProfileImage(profileImage);
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
		
		return foundUser;
		
		
	}
}
