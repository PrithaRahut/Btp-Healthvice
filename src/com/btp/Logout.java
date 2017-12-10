package com.btp;

import java.io.IOException;

//import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Logout extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		HttpSession session=request.getSession();  
        session.invalidate(); 
      //  String msg = "Successfully logged out!";
//        request.setAttribute("msg", msg);
//		RequestDispatcher req = request.getRequestDispatcher("index.jsp"); //Redirect to page where user was initially
//		req.forward(request, response);
        response.sendRedirect("index.jsp");
		System.out.println("Successfully logged out!");
	}
	

}
