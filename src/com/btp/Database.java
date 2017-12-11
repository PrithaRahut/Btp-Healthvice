package com.btp;

import java.io.IOException;
import java.util.List;

import com.googlecode.objectify.Key;

public class Database {
	public static boolean createUser(User user){
		if(isUserAvailable(user.getEmail())){
			OfyService.ofy().save().entity(user).now();
			return true;
		}
		else{
			return false;
		}
		
	}
	
	public static boolean isUserAvailable(String email){
		User u=OfyService.ofy().load().key(Key.create(User.class, email)).now();
		if(u==null){
			return true;
		}else{
			return false;
		}
	}
	public static User checkUser(String email,String pwd){
		User u=OfyService.ofy().load().key(Key.create(User.class, email)).now();
		if(u==null){
			return null;
		}
		else{
			if(pwd.equals(u.getPassWord())){
				return u;
			}else{
				return null;
			}
		}
		
	}
	public static User getByEmail(String email){
		User user = OfyService.ofy().load().key(Key.create(User.class, email)).now();
		return user;
	}
	public static Testimonial getTestimonialById(Long Id){
		Testimonial t = OfyService.ofy().load().key(Key.create(Testimonial.class, Id)).now();
		return t;
	}
	public static void addTestimonial(Testimonial t){
		Key<Testimonial> key = OfyService.ofy().save().entity(t).now();
		try {
			IndexingWrapper.createAndIndexDocumentForTestimonial(key.getId());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	public static List<Testimonial> getTestimonialByUser(String userEmail){
		List<Testimonial> list = OfyService.ofy().load()
				.type(Testimonial.class).
				filter("userEmail", userEmail).list();
		return list;
	}
	public static List<Testimonial> getTestimonialByDisease(String diseaseName){
		List<Testimonial> list= OfyService.ofy().load()
				.type(Testimonial.class)
				.filter("diseaseName",diseaseName)
				
				.list();
		return list;
		
	}
	public static List<Testimonial> getRecentFiftyTestimonial(){
		List<Testimonial> list = OfyService.ofy().load().type(Testimonial.class).order("-lastUpdatedAt").limit(50).list();
		return list;
	}
	public static List<Testimonial> getTestimonialLikedByUser(String userId){
		List<Testimonial> list = OfyService.ofy().load().type(Testimonial.class).filter("userUpvote", userId).limit(50).list();
		return list;
	}
	public static void addDisease(Disease d){
		OfyService.ofy().save().entity(d).now();
	}
	public static Disease getDisease(String val){
		System.out.println("Sending key for disease:" + val);
		Disease d=OfyService.ofy().load().key(Key.create(Disease.class, val)).now();
		if(d==null){
			System.out.println("No disease found");
			return null;
		}
		return d;
		
	}
}
