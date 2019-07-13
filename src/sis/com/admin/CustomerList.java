package sis.com.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sis.com.dao.CustomerDao;
import sis.com.factory.DaoFactory;
import sis.com.user.User;


public class CustomerList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		CustomerDao dao = DaoFactory.getCustomerDao();
		List<User> customerList = dao.getAll();
		
		request.setAttribute("customerList", customerList);
		
		request.getRequestDispatcher("customerlist.jsp").forward(request, response);
		
		
		
	}

}
