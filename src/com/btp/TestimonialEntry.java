package com.btp;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TestimonialEntry extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		User user=(User)request.getSession().getAttribute("user");
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		String sex = request.getParameter("gender");
		String disease = request.getParameter("disease");
		String details = request.getParameter("details");
		String addInfo = request.getParameter("addInfo");
		String pathy = request.getParameter("pathy");
		String contactNo = request.getParameter("contact");
		String email = request.getParameter("email");
		
		System.out.println("In testimonial Entry servlet:" + details);
		
		Testimonial test = new Testimonial();
		test.setName(name);
		test.setAge(age);
		test.setSex(sex);
		test.setDiseaseName(disease);
		//test.setTreatment(pathy);
		test.setPathy(pathy);
		test.setDetails(details);
		test.setContact(contactNo);
		test.setAddInfo(addInfo);
		test.setUserEmail(user.getEmail());
		test.setPatientEmail(email);
		test.setLastUpdatedAt(System.currentTimeMillis());
		Database.addTestimonial(test);
		
		response.sendRedirect("testimonial.jsp");
		
		
	}

}
