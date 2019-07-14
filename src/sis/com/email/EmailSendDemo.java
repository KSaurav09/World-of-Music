package sis.com.email;

import java.io.IOException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class EmailSendDemo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String userEmail = request.getParameter("email");
		String useremailrecover = null;
		
		HttpSession session = request.getSession();
		Object object = session.getAttribute("emailrecover");
		if(object != null){
			 useremailrecover = (String)object;
		}
		
		
		System.out.println("user Email = "+userEmail);
		System.out.println("user email Recover = "+useremailrecover);
		
		String otp = ""+ (int)(Math.random()*10000);
		boolean isOtpSent=false;
		
		final String username = "username@gmail.com";
		final String password ="password";
		
		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
		
		Session email_session = Session.getInstance(props,
				  new javax.mail.Authenticator() {
								protected PasswordAuthentication getPasswordAuthentication() {
									return new PasswordAuthentication(username, password);
								}
				  });
						
		
		try {

			Message message = new MimeMessage(email_session);
			message.setFrom(new InternetAddress(username));
			if(userEmail != null){
				message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(userEmail));
			}else{
				message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(useremailrecover));
			}
			
			
			message.setSubject("Email Verification "+ new Date());
			message.setText("Make sure to enter correct otp \n" + "OTP : " + otp);

			//System.out.println("message sending................");
			Transport.send(message);
			isOtpSent =true;
			//System.out.println("message sent ................");

		} catch (MessagingException e) {

			//System.err.print("ERROR "+e.getMessage());
			e.printStackTrace();
		}	
		if(isOtpSent){
			HttpSession session2 = request.getSession();
			session2.setAttribute("otp",otp);
			if(userEmail != null){
				session2.setAttribute("email",userEmail);
			}else{
				session2.setAttribute("emailrecover",useremailrecover);	
			}
			request.getRequestDispatcher("enterotp.jsp").forward(request,response);
		}else{
			System.out.println("Email not sent....");
		}
		
		
		/*HttpSession session = request.getSession(); 
		session.setAttribute("client",userEmail);
		session.setAttribute("otp",otp);
		System.out.println(otp);
		request.getRequestDispatcher("email_verify.jsp").forward(request,response);
		*/
		
	}

	}


