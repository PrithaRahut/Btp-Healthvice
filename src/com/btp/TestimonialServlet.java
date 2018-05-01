package com.btp;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TestimonialServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		User user=(User)request.getSession().getAttribute("user");
		boolean openModal;
		if(user == null){
			openModal = true;
			request.setAttribute("openModal", String.valueOf(openModal));
			RequestDispatcher dispatch=request.getRequestDispatcher("index.jsp");
			dispatch.forward(request,response);
			//response.sendRedirect("login.jsp");
		}else{
			//response.sendRedirect("testimonial.jsp");
			request.setAttribute("user", user);
			RequestDispatcher dispatch=request.getRequestDispatcher("profile.jsp");
			dispatch.forward(request,response);
		}
	}
	

}
