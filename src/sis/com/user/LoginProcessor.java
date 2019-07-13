package sis.com.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sis.com.dao.LoginDao;
import sis.com.factory.DaoFactory;


public class LoginProcessor extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		
		
		String loginId = request.getParameter("uname");
		String loginPwd = request.getParameter("psw");
		
		LoginDao dao = DaoFactory.getLoginDao();
		User user = dao.validateUser(loginId, loginPwd);
		
		if(loginId.equals("admin") && loginPwd.equals("password")){
			HttpSession session = request.getSession();
			session.setAttribute("admin",loginId);
			response.sendRedirect("admin.jsp");
		}else if(user!=null){
			HttpSession session = request.getSession();
			session.setAttribute("user",user);
			response.sendRedirect("main.jsp");
		}else{
			request.getSession().setAttribute("errmsg", "Invalid username or password");
			response.sendRedirect("Login.jsp");
		}
	}

}
