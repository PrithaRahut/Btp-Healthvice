package com.btp;

import java.io.Serializable;
import java.util.List;

import com.googlecode.objectify.annotation.*;

@Entity
public class Testimonial implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1490238090919758234L;
	@Id
	Long Id;
	@Index
	String userEmail;	//Email id of user who is posting testimonial
	String age;
	String sex;
	@Index
	String diseaseName;
	String pathy;
	String treatment;
	String details;
	String addInfo;
	String name;
	String contact;
	String patientEmail;	//Email id of patient
	List<String> userUpvote;
	List<String> userDownvote;
	int numOfUpvotes;
	int numOfDownvotes;
	int score;
	
//	public long getId() {
//		return Id;
//	}
//	public void setId(long id) {
//		Id = id;
//	}
	
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getDiseaseName() {
		return diseaseName;
	}
	public void setDiseaseName(String diseaseName) {
		this.diseaseName = diseaseName;
	}
	public String getPathy() {
		return pathy;
	}
	public void setPathy(String pathy) {
		this.pathy = pathy;
	}
	public String getTreatment() {
		return treatment;
	}
	public void setTreatment(String treatment) {
		this.treatment = treatment;
	}
	public String getDetails() {
		return details;
	}
	public void setDetails(String details) {
		this.details = details;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	
	public String getAddInfo() {
		return addInfo;
	}
	public void setAddInfo(String addInfo) {
		this.addInfo = addInfo;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getPatientEmail() {
		return patientEmail;
	}
	public void setPatientEmail(String patientEmail) {
		this.patientEmail = patientEmail;
	}
	public List<String> getUserUpvote() {
		return userUpvote;
	}
	public void setUserUpvote(List<String> userUpvote) {
		this.userUpvote = userUpvote;
	}
	public List<String> getUserDownvote() {
		return userDownvote;
	}
	public void setUserDownvote(List<String> userDownvote) {
		this.userDownvote = userDownvote;
	}
	public int getNumOfUpvotes() {
		return numOfUpvotes;
	}
	public void setNumOfUpvotes(int numOfUpvotes) {
		this.numOfUpvotes = numOfUpvotes;
	}
	public int getNumOfDownvotes() {
		return numOfDownvotes;
	}
	public void setNumOfDownvotes(int numOfDownvotes) {
		this.numOfDownvotes = numOfDownvotes;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}

}
