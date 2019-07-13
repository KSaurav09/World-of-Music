package sis.com.dao;

import sis.com.user.User;

public interface LoginDao {
	User validateUser(String loginId, String loginPassword);
	
}
