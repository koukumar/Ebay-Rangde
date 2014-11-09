package com.rangde.api;

import java.util.ArrayList;
import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Request;
import javax.ws.rs.core.UriInfo;

import com.rangde.api.model.Patient;
import com.rangde.api.model.Search;

@Path("/search")
public class SearchResource {

	@Context
	UriInfo uriInfo;
	@Context
	Request request;

	@GET
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	public List<Patient> search() {
		List<Patient> patients = new ArrayList<Patient>();
		Patient patient1 = new Patient();
		patient1.setImageSrc("http://www.rangde.org/images/landingPage/madness_pro_img7.jpg");
		patient1.setAmountRaised(10000);
		patient1.setAmountNeeded(20000);
		patient1.setAmountRemaining(1000);
		patient1.setPercentageRaised(25);
		patient1.setTimeLeft("3 days");
		patient1.setPatientName("Kidney Transplant for Mohan");
		Patient patient2 = new Patient();
		patient1.setImageSrc("http://www.rangde.org/images/landingPage/madness_pro_img7.jpg");
		patient1.setAmountRaised(10000);
		patient1.setAmountNeeded(20000);
		patient1.setAmountRemaining(1000);
		patient1.setPercentageRaised(25);
		patient1.setTimeLeft("3 days");
		patient1.setPatientName("Kidney Transplant for Kumar");
		patients.add(patient1);
		patients.add(patient2);
		return patients;
	}
	
	@POST
	@Consumes({ MediaType.APPLICATION_JSON })
	@Produces({ MediaType.APPLICATION_JSON })
	public List<Patient> findPatients(Search search) {
		List<Patient> patients = new ArrayList<Patient>();
		Patient patient1 = null;
		for(int i = 0; i< 15; i++){
			patient1 = new Patient();
			patient1.setImageSrc("http://www.rangde.org/images/landingPage/madness_pro_img7.jpg");
			patient1.setAmountRaised(10000);
			patient1.setAmountNeeded(20000);
			patient1.setAmountRemaining(1000);
			patient1.setPercentageRaised(25);
			patient1.setTimeLeft("3 days");
			patient1.setPatientName("Kidney Transplant for Mohan");
			patients.add(patient1);
		}
		return patients;
	}

}
