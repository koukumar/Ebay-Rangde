package com.rangde.api.model;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class Patient {
	
	private String imageSrc;
	private float amountRaised;
	private float amountNeeded;
	private float amountRemaining;
	private float percentageRaised;
	private String timeLeft;
	private String patientName;
	
	public Patient(){	
	}
	
	public Patient(String imageSrc, float amountRaised, float amountNeeded, float amountRemaining, float percentageRaised, String timeLeft, String patientName){
		this.imageSrc = imageSrc;
		this.amountRaised = amountRaised;
		this.amountNeeded = amountNeeded;
		this.amountRemaining = amountRemaining;
		this.percentageRaised = percentageRaised;
		this.timeLeft = timeLeft;
		this.patientName = patientName;
	}
	
	public String getImageSrc() {
		return imageSrc;
	}
	public void setImageSrc(String imageSrc) {
		this.imageSrc = imageSrc;
	}
	public float getAmountRaised() {
		return amountRaised;
	}
	public void setAmountRaised(float amountRaised) {
		this.amountRaised = amountRaised;
	}
	public float getAmountNeeded() {
		return amountNeeded;
	}
	public void setAmountNeeded(float amountNeeded) {
		this.amountNeeded = amountNeeded;
	}
	public float getAmountRemaining() {
		return amountRemaining;
	}
	public void setAmountRemaining(float amountRemaining) {
		this.amountRemaining = amountRemaining;
	}
	public float getPercentageRaised() {
		return percentageRaised;
	}
	public void setPercentageRaised(float percentageRaised) {
		this.percentageRaised = percentageRaised;
	}
	public String getTimeLeft() {
		return timeLeft;
	}
	public void setTimeLeft(String timeLeft) {
		this.timeLeft = timeLeft;
	}
	public String getPatientName() {
		return patientName;
	}
	public void setPatientName(String patientName) {
		this.patientName = patientName;
	}
	
}
