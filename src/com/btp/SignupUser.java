package com.btp;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;

public class SignupUser extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String fname = request.getParameter("firstname");
		String lname = request.getParameter("lastname");
		String email = request.getParameter("email");
		String pwd = request.getParameter("password");
		String cpwd = request.getParameter("cpass");
		String number = request.getParameter("number");
		//String url = request.getParameter("image");
		
		System.out.println("First Name found:"+fname);
		String msg = null;
		if(pwd.equals(cpwd)){
			User u = new User();
			u.setFirstName(fname);
			u.setLastName(lname);
			u.setEmail(email);
			u.setPassWord(pwd);
			u.setNumber(number);
			
			boolean val = Database.createUser(u);
			if(val == true){
				msg = "User added successfully!";
				System.out.println("SUCCESS SIGNUP");
			}else{
				msg = "User already exists!";
				System.out.println("FAILURE SIGNUP");
			}
			
		}else{
			msg = "Password do not match";
		}
		
		request.setAttribute("msg", msg);
		
		RequestDispatcher dispatch=request.getRequestDispatcher("index.jsp");
		dispatch.forward(request,response);
		
		
		
	}
	

}
