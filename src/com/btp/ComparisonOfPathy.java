package com.btp;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class ComparisonOfPathy {
	public static HashMap<String, Integer> comparePathyForDisease(String diseaseName){
		List<Testimonial> list = Database.getTestimonialByDisease(diseaseName);
		HashMap<String,Integer> mapCount = new HashMap<String,Integer>(); //for pathy vs count Of Testimonials with that pathy
		HashMap<String,Integer> mapUpvotes = new HashMap<String,Integer>(); //for pathy vs count of upvotes with that pathy
		for(Testimonial t:list){
			if(mapCount.containsKey(t.getPathy())){
				mapCount.put(t.getPathy(), mapCount.get(t.getPathy()) + 1);
			}else{
				mapCount.put(t.getPathy(), 1);
			}
			
			if(mapUpvotes.containsKey(t.getPathy())){
				mapUpvotes.put(t.getPathy(), mapUpvotes.get(t.getPathy()) + t.getNumOfUpvotes());
			}else{
				mapUpvotes.put(t.getPathy(), t.getNumOfUpvotes());
			}
		}
		List<HashMap> listmap = new ArrayList<HashMap>();
		listmap.add(mapUpvotes);
		listmap.add(mapCount);
		//return listmap;
		return mapCount;
	}

}