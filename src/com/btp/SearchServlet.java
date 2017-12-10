package com.btp;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.btp.IndexingWrapper.SearchResult;

public class SearchServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String searchterm = request.getParameter("searchterm");
		Iterable<Testimonial> testimonials = null ;
		if(searchterm!=null && searchterm.length() > 0){
		
			SearchResult<Testimonial> result = IndexingWrapper.searchTestimonial(searchterm);
	       // allShown = result.getNumberFound() == result.getNumberReturned();
	        testimonials = result;
		}
		request.setAttribute("testimonials", testimonials);
		RequestDispatcher req = request.getRequestDispatcher("SearchResult.jsp");
		req.forward(request, response);
	}

}
