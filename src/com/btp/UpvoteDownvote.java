package com.btp;

import java.io.IOException;
import java.util.ArrayList;

//import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpvoteDownvote extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = -8257191220498721049L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		User user=(User)request.getSession().getAttribute("user");
		if(user == null){
			response.sendRedirect("login.jsp");
		}else{
			String tid = request.getParameter("tid");
			String upvote = request.getParameter("likedByUser");
			String downvote = request.getParameter("disLikedByUser");
			
			Testimonial t = Database.getTestimonialById(Long.parseLong(tid));
			if(t.getUserUpvote() == null){
				t.setUserUpvote(new ArrayList());
			}
			if(t.getUserDownvote() == null){
				t.setUserDownvote(new ArrayList());
			}
			if(upvote != null){
				if(t.getUserUpvote().contains(user.getEmail()) == true){
					t.getUserUpvote().remove(user.getEmail());
				}else{
					t.getUserUpvote().add(user.getEmail());
				}
				if(t.getUserDownvote().contains(user.getEmail())){
					t.getUserDownvote().remove(user.getEmail());
				}
			}else if(downvote != null){
				if(t.getUserDownvote().contains(user.getEmail()) == true){
					t.getUserDownvote().remove(user.getEmail());
				}else{
					t.getUserDownvote().add(user.getEmail());
				}
				if(t.getUserUpvote().contains(user.getEmail())){
					t.getUserUpvote().remove(user.getEmail());
				}
			}
			Database.addTestimonial(t);
		}
		
		
		
		
	}
	

}
