package com.rangde.api;

import java.util.ArrayList;
import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Request;
import javax.ws.rs.core.UriInfo;

import com.rangde.api.model.Patient;
import com.rangde.api.model.PatientsList;

@Path("/search")
public class SearchResource {

	@Context
	UriInfo uriInfo;
	@Context
	Request request;

	@GET
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	public PatientsList search() {
		List<Patient> patients = new ArrayList<Patient>();
		Patient patient1 = new Patient("Abishek");
		Patient patient2 = new Patient("Kousik");
		patients.add(patient1);
		patients.add(patient2);
		PatientsList patientList = new PatientsList(patients);
		return patientList;
	}

}
