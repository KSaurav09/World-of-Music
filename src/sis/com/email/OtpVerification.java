package sis.com.email;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class OtpVerification extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String enterOtp = request.getParameter("enter_otp");
		
		HttpSession sesn = request.getSession();
		String userotp = (String)sesn.getAttribute("otp");
		
		String userEmail = (String)sesn.getAttribute("email");
		String userRecoverEmail = (String)sesn.getAttribute("emailrecover");
		
		
		
		if(enterOtp.equals(userotp) && userEmail!=null){
			response.sendRedirect("signupdetails.jsp");
		}else if(enterOtp.equals(userotp) && userRecoverEmail!=null){
			response.sendRedirect("enterpassword.jsp");
		}else{
			request.getSession().setAttribute("errormsg", "Enter valid OTP");
			response.sendRedirect("enterotp.jsp");
		}
		
		
	
	}

}
