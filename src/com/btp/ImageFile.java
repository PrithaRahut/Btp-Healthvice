package com.btp;

import com.googlecode.objectify.Key;
import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;

@Entity
public class ImageFile {
	@Id
	long ID;
	byte[] data;
	
	public byte[] getData() {
		return data;
	}
	public void setData(byte[] data) {
		this.data = data;
	}
	public static void saveImage(ImageFile img){
		OfyService.ofy().save().entity(img).now();
	}

}
