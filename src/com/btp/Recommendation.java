package com.btp;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

//import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;

public class Recommendation extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		User u = (User)request.getSession().getAttribute("user");
		
		List<Testimonial> listRecent = Database.getRecentFiftyTestimonial();
		List<Testimonial> listLiked = Database.getTestimonialLikedByUser(u.getEmail());
		
		HashMap<String,Integer> diseasesLiked = new HashMap<String,Integer>();
		HashMap<String,Integer> pathyLiked = new HashMap<String,Integer>();
		
		for(Testimonial t : listLiked){
			if(diseasesLiked.containsKey(t.getDiseaseName())){
				diseasesLiked.put(t.getDiseaseName(), diseasesLiked.get(t.getDiseaseName()) + 1);
			}else{
				diseasesLiked.put(t.getDiseaseName(),1);
			}
			if(pathyLiked.containsKey(t.getPathy())){
				pathyLiked.put(t.getPathy(), pathyLiked.get(t.getPathy()) + 1);
			}else{
				pathyLiked.put(t.getPathy(),1);
			}
		}
		
		
	}
	

}


