package com.btp;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;

//import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;

public class Recommendation{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	static public List<Testimonial> getLatestTestimonial(HttpServletRequest request){
		User u = (User)request.getSession().getAttribute("user");
		
		List<Testimonial> listRecent = Database.getRecentFiftyTestimonial();
		List<Testimonial> listLiked = Database.getTestimonialLikedByUser(u.getEmail());
	//	List<Testimonial> listrecom = null;
		HashMap<String,Integer> diseasesLiked = new HashMap<String,Integer>();
		HashMap<String,Integer> pathyLiked = new HashMap<String,Integer>();
		if(listLiked != null){
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
		if(listRecent != null){
			for(Testimonial t : listRecent){
				if(diseasesLiked.containsKey(t.getDiseaseName()) && pathyLiked.containsKey(t.getPathy())){
					int score = diseasesLiked.get(t.getDiseaseName())*2 + pathyLiked.get(t.getPathy());
					t.setScore(score);
					
				}
			}
			//sort the list on the basis of score assigned
			Collections.sort(listRecent, new Comparator<Testimonial>() {
	
		        public int compare(Testimonial t1, Testimonial t2) {
		        	if(t1.getScore() != 0 || t1.getScore() != 0)
		        		return new Integer(t2.getScore()).compareTo(t1.getScore());
		        	else
		        		return new Long(t2.getLastUpdatedAt()).compareTo(t1.getLastUpdatedAt());
		        }
		    });
		} else {
			listRecent = new ArrayList();
		}
		return listRecent;
		
	}
	

}


