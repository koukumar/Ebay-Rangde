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
		Patient patient1 = new Patient("Abishek");
		Patient patient2 = new Patient("Kousik");
		patients.add(patient1);
		patients.add(patient2);
		return patients;
	}
	
	@POST
	@Consumes({ MediaType.APPLICATION_JSON })
	@Produces({ MediaType.APPLICATION_JSON })
	public List<Patient> findPatients(Search search) {
		List<Patient> patients = new ArrayList<Patient>();
		
		System.out.println("Search name received: " + search.getFundingStatus());
		System.out.println("Search location received: " + search.getLanguage());
		System.out.println("Search name received: " + search.getLocation());
		System.out.println("Search location received: " + search.getPercentFunded());
		System.out.println("Search name received: " + search.getTimeLeft());
		System.out.println("Search location received: " + search.getVolunteer());
		System.out.println("Search name received: " + search.getCategories());
		
		return patients;
	}

}
