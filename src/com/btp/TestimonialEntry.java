package com.btp;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.io.IOUtils;

import com.googlecode.objectify.Key;


public class TestimonialEntry extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		User user=(User)request.getSession().getAttribute("user");
		
		//System.out.println("In testimonial Entry servlet:" + details);
		
		 //List<Part> fileParts = request.getParts().stream().filter(part -> "file".equals(part.getName())).collect(Collectors.toList());
		
//		
//		
//		response.sendRedirect("testimonial.jsp");
		
		try{
			String name = null;
			String age = null;
			String sex = null;
			String disease = null;
			String details = null;
			String pathy = null;
			String contactNo = null;
			String email = null;
			Long imgId = null;
			
			List<FileItem> items = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
			for (FileItem item : items) {
	            if (item.isFormField()) {
	                // Process regular form field (input type="text|radio|checkbox|etc", select, etc).
	                String fieldName = item.getFieldName();
	                String fieldValue = item.getString();
	                switch (fieldName) {
	                case "name":
	                	name = fieldValue;
	                	break;
	                case "age":
	                	age = fieldValue;
	                	break;
	                case "gender":
	                	sex = fieldValue;
	                	break;
	                case "disease":
	                	disease = fieldValue;
	                	break;
	                case "details":
	                	details = fieldValue;
	                	break;
	                case "pathy":
	                	pathy = fieldValue;
	                	break;
	                case "contact":
	                	contactNo = fieldValue;
	                	break;
		            case "email":
	                	email = fieldValue;
	                	break;
	                }
	            } else {
	                // Process form file field (input type="file").
	                String fieldName = item.getFieldName();
	                String fileName = FilenameUtils.getName(item.getName());
	                System.out.println("Found file field:" + fieldName);
	                System.out.println("Found file:" + fileName);
	                InputStream fileContent = item.getInputStream();
	                byte[] bytes = IOUtils.toByteArray(fileContent);
	                ImageFile img = new ImageFile();
	                img.setData(bytes);
	                Key<ImageFile> imgFile = ImageFile.saveImage(img);
	                imgId = imgFile.getId();
	            }
	        }
			Testimonial test = new Testimonial();
			test.setName(name);
			test.setAge(age);
			test.setSex(sex);
			test.setDiseaseName(disease);
			test.setPathy(pathy);
			test.setDetails(details);
			test.setContact(contactNo);
			test.setUserEmail(user.getEmail());
			test.setPatientEmail(email);
			test.setLastUpdatedAt(System.currentTimeMillis());
			test.setYear(System.currentTimeMillis());
			test.setImageId(imgId);
			Database.addTestimonial(test);
		}catch(FileUploadException e){
			throw new ServletException("Cannot parse multipart request.", e);
		}
		
		
	}

}
