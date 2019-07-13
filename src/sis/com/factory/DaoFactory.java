package sis.com.factory;

import sis.com.dao.CustomerDao;
import sis.com.dao.LoginDao;
import sis.com.impl.CustomerDaoImplOracle;
import sis.com.impl.LoginDaoOracle;

public class DaoFactory {
	public static LoginDao loginDao;
	
	public static LoginDao getLoginDao(){
		if(loginDao == null){
			loginDao = new LoginDaoOracle();
		}
		return loginDao;
	}
	
	public static CustomerDao customerDao;

	public static CustomerDao getCustomerDao(){
		if(customerDao == null){
			return new CustomerDaoImplOracle();
		}
		
		return customerDao;
	}
}
   