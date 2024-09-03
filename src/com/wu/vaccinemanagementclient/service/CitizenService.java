package com.wu.vaccinemanagementclient.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;

import com.wu.vaccinemanagementclient.entity.Citizen;
import com.wu.vaccinemanagementclient.entity.Dose;

@Service
public class CitizenService {

    private final RestTemplate restTemplate;

//    @Autowired
    public CitizenService(RestTemplate restTemplate) {
        this.restTemplate = restTemplate;
    }

    public ArrayList<Citizen> getAllCitizens() {
        ResponseEntity<ArrayList<Citizen>> response = restTemplate.exchange(
            "http://localhost:1234/api/citizens",
            HttpMethod.GET,
            null,
            new ParameterizedTypeReference<ArrayList<Citizen>>() {}
        );
        
        return (ArrayList<Citizen>) response.getBody();
    }
    
    public void addCitizen(Citizen cz) {
    	Citizen existingCitizen = getCitizenById(cz.getCitizenId());
    	 if (existingCitizen == null) {
 	        // Citizen does not exist, so add a new one
 	        restTemplate.postForObject("http://localhost:1234/api/citizen", cz, Citizen.class);
 	    } else {
 	        // Citizen exists, so update the existing one
 	        restTemplate.put("http://localhost:1234/api/citizen", cz);
 	    }
    }
    	

	public void deleteCustomerById(long citizenId) {
		restTemplate.delete("http://localhost:1234/api/citizen/"+citizenId);
	}
	
	public Citizen getCitizenById(long id) {
	    try {
	        return restTemplate.getForObject("http://localhost:1234/api/citizen/" + id, Citizen.class);
	    } catch (HttpClientErrorException e) {
	        if (e.getStatusCode() == HttpStatus.NOT_FOUND) {
	            System.err.println("Citizen not found: " + e.getMessage());
	        } else {
	            System.err.println("HTTP error occurred: " + e.getMessage());
	        }
	        return null; 
	    } catch (Exception e) {
	        System.err.println("An error occurred: " + e.getMessage());
	        return null; 
	    }
	}


	public ArrayList<Dose> getAllFirstDose() {
		  ResponseEntity<ArrayList<Dose>> response = restTemplate.exchange(
		            "http://localhost:1234/api/firstdoses",
		            HttpMethod.GET,
		            null,
		            new ParameterizedTypeReference<ArrayList<Dose>>() {}
		        );
		       
		        return (ArrayList<Dose>) response.getBody();
	}

	public void addFirstDose(Dose theFirstDose) {		
		restTemplate.postForObject("http://localhost:1234/api/addfirstdose", theFirstDose, Dose.class);
	}

	public ArrayList<Dose> getAllSecondDose() {
		// TODO Auto-generated method stub
		ResponseEntity<ArrayList<Dose>> response = restTemplate.exchange(
	            "http://localhost:1234/api/seconddoses",
	            HttpMethod.GET,
	            null,
	            new ParameterizedTypeReference<ArrayList<Dose>>() {}
	        );
	        return (ArrayList<Dose>) response.getBody();
	}
	
	
	public ArrayList<Dose> getAllBoosterDose() {
		// TODO Auto-generated method stub
		ResponseEntity<ArrayList<Dose>> response = restTemplate.exchange(
	            "http://localhost:1234/api/boosterdoses",
	            HttpMethod.GET,
	            null,
	            new ParameterizedTypeReference<ArrayList<Dose>>() {}
	        );
	       
	        return (ArrayList<Dose>) response.getBody();
	}

	public void addSecondDose(Dose theSecondDose) {
		// TODO Auto-generated method stub
		restTemplate.postForObject("http://localhost:1234/api/addseconddose", theSecondDose, Dose.class);
		
	}
	
	public void addBoosterDose(Dose theBoosterDose) {
		// TODO Auto-generated method stub
		restTemplate.postForObject("http://localhost:1234/api/addboosterdose", theBoosterDose, Dose.class);
		
	}

	public Dose getFirstDoseDetailsById(long theId) {
		// TODO Auto-generated method stub
		ResponseEntity<ArrayList<Dose>> response = restTemplate.exchange(
	            "http://localhost:1234/api/firstdoses",
	            HttpMethod.GET,
	            null,
	            new ParameterizedTypeReference<ArrayList<Dose>>() {}
	        );
	       
		
	        ArrayList<Dose> arrayListDose = response.getBody();
	        for(Dose x: arrayListDose) {
	        	if(x.getcitizenId() == theId) {
	        		return x;
	        	}
	        }
	        
	        return null;
	}

	public Dose getSecondDoseDetailsById(long theId) {
		// TODO Auto-generated method stub
		ArrayList<Dose> arrayListDose = getAllSecondDose();
		for(Dose x: arrayListDose) {
        	if(x.getcitizenId() == theId) {
        		return x;
        	}
        }
        
        return null;
	}
	
	
	
	
	
	
	
	
}
