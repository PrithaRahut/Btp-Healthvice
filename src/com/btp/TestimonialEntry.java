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


public class TestimonialEntry extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		User user=(User)request.getSession().getAttribute("user");
//		String name = request.getParameter("name");
//		String age = request.getParameter("age");
//		String sex = request.getParameter("gender");
//		String disease = request.getParameter("disease");
//		String details = request.getParameter("details");
//		String addInfo = request.getParameter("addInfo");
//		String pathy = request.getParameter("pathy");
//		String contactNo = request.getParameter("contact");
//		String email = request.getParameter("email");
		
		//System.out.println("In testimonial Entry servlet:" + details);
		
		 //List<Part> fileParts = request.getParts().stream().filter(part -> "file".equals(part.getName())).collect(Collectors.toList());
		
//		
//		Testimonial test = new Testimonial();
//		test.setName(name);
//		test.setAge(age);
//		test.setSex(sex);
//		test.setDiseaseName(disease);
//		//test.setTreatment(pathy);
//		test.setPathy(pathy);
//		test.setDetails(details);
//		test.setContact(contactNo);
//		test.setAddInfo(addInfo);
//		test.setUserEmail(user.getEmail());
//		test.setPatientEmail(email);
//		test.setLastUpdatedAt(System.currentTimeMillis());
//		test.setYear(System.currentTimeMillis());
//		Database.addTestimonial(test);
//		
//		response.sendRedirect("testimonial.jsp");
		
		try{
			List<FileItem> items = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
			for (FileItem item : items) {
	            if (item.isFormField()) {
	                // Process regular form field (input type="text|radio|checkbox|etc", select, etc).
//	                String fieldName = item.getFieldName();
//	                String fieldValue = item.getString();
	                // ... (do your job here)
	            } else {
	                // Process form file field (input type="file").
	                String fieldName = item.getFieldName();
	                String fileName = FilenameUtils.getName(item.getName());
	                InputStream fileContent = item.getInputStream();
	                byte[] bytes = IOUtils.toByteArray(fileContent);
	                ImageFile img = new ImageFile();
	                img.setData(bytes);
	                ImageFile.saveImage(img);
	            }
	        }
			
		}catch(FileUploadException e){
			throw new ServletException("Cannot parse multipart request.", e);
		}
		
		
	}

}
