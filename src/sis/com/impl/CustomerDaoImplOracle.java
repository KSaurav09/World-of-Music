package sis.com.impl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


import sis.com.connection.DatabaseConnection;
import sis.com.dao.CustomerDao;
import sis.com.user.User;

public class CustomerDaoImplOracle implements CustomerDao {

	public List<User> getAll() {
		List<User> customerList = new ArrayList<User>();
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try{
			con = DatabaseConnection.getConnection();
			String sql = "select * from user_registration";
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()){
				
				String fname = rs.getString("fname");
				String lname = rs.getString("lname");
				long mobno = rs.getLong("mobno");
				String emailid = rs.getString("emailid");
				Date dob = rs.getDate("dob");
				
				User user = new User();
				
				user.setDob(dob);
				user.setFname(fname);
				user.setLname(lname);
				user.setLoginId(emailid);
				user.setMobno(mobno);
				
				customerList.add(user);
				
				
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
		System.out.println("customerList = "+customerList);
		return customerList;
	}
	
}
