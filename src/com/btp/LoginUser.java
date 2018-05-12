package com.btp;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginUser extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String email = request.getParameter("email");
		String pwd = request.getParameter("password");
		String msg = null;
		boolean incorrectInfo;
		boolean openModal;
		User u = Database.checkUser(email, pwd);
		if(u!=null){
			HttpSession session = request.getSession();
			session.setAttribute("user", u);
			msg = "Successfully logged in!";
			
			request.setAttribute("msg", msg);
			RequestDispatcher req = request.getRequestDispatcher("profile.jsp"); //Redirect to page where user was initially
			req.forward(request, response);
			//System.out.println("Successfully logged in!");
			
		}else{
			//msg="Incorrect email or password";
			incorrectInfo = true;
			openModal = true;
			request.setAttribute("incorrectInfo", String.valueOf(incorrectInfo));
			request.setAttribute("openModal", String.valueOf(openModal));
			RequestDispatcher req=request.getRequestDispatcher("index.jsp");
			req.forward(request, response);
			//System.out.println("Incorrect email or password");

			
		}
	}
	

}
