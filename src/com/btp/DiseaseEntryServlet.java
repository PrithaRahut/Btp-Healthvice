package com.btp;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DiseaseEntryServlet extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String name = request.getParameter("diseaseName");
		String desc = request.getParameter("desc");
		String symptom = request.getParameter("symptom");
		String cause = request.getParameter("cause");
		
		Disease d = new Disease();
		d.setName(name);
		d.setDesc(desc);
		d.setSymptoms(symptom);
		d.setCause(cause);
		
		Database.addDisease(d);
		
		response.sendRedirect("DiseaseEntry.jsp");
		
	}

}

