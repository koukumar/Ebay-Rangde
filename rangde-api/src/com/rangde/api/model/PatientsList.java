package com.rangde.api.model;

import java.util.List;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class PatientsList {
	
	private List<Patient> patients;
	
	public PatientsList(){
		
	}
	
	public PatientsList(List<Patient> patients){
		this.patients = patients;
	}
	
	public List<Patient> getPatients() {
		return patients;
	}

	public void setPatients(List<Patient> patients) {
		this.patients = patients;
	}

}
