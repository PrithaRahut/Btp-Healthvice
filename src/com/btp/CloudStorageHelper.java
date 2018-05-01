package com.btp;

import javax.servlet.http.HttpServlet;
import com.google.cloud.storage.Acl;
import com.google.cloud.storage.Acl.Role;
import com.google.cloud.storage.Acl.User;
import com.google.cloud.storage.BlobInfo;
import com.google.cloud.storage.Storage;
import com.google.cloud.storage.StorageOptions;


import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig
public class CloudStorageHelper extends HttpServlet{

//	private static final long serialVersionUID = 1L;
//	  @SuppressWarnings("deprecation")
//	  public String uploadFile(Part filePart, final String bucketName) throws IOException {
//	    final String fileName = filePart.getSubmittedFileName() + System.currentTimeMillis();
//
//	    // the inputstream is closed by default, so we don't need to close it here
////	    BlobInfo blobInfo =
////	        storage.create(
////	            BlobInfo
////	                .newBuilder(bucketName, fileName)
////	                // Modify access list to allow all users with link to read file
////	                .setAcl(new ArrayList<>(Arrays.asList(Acl.of(User.ofAllUsers(), Role.READER))))
////	                .build(),
////	            filePart.getInputStream());
//	    // return the public download link
//	    return blobInfo.getMediaLink();
//	  }
//	  
//	  public String getImageUrl(HttpServletRequest req, HttpServletResponse resp,
//              final String bucket) throws IOException, ServletException {
//		 
//		  Part filePart = req.getPart("file"); 
//		  Part filePart = ((Object) req).getPart("file");
//		  final String fileName = filePart.getSubmittedFileName();
//		  String imageUrl = req.getParameter("imageUrl");
//		  // Check extension of file
//		  if (fileName != null && !fileName.isEmpty() && fileName.contains(".")) {
//		  final String extension = fileName.substring(fileName.lastIndexOf('.') + 1);
//		  String[] allowedExt = { "jpg", "jpeg", "png", "gif" };
//		  for (String s : allowedExt) {
//			  if (extension.equals(s)) {
//				  	return this.uploadFile(filePart, bucket);
//			  }
//		  }
//		  throw new ServletException("file must be an image");
//	      }
//		  return imageUrl;
//	  }
	
}
