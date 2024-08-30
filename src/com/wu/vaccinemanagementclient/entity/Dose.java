package com.wu.vaccinemanagementclient.entity;

import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;

public class Dose {
	private Long citizenId;
	private String doseName;
	private String docName;
	private String location;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate doseDate;

	
	public Dose()
	{
		
	}
	
	public Dose(Long citizenId, String doseName, String docName, String location, LocalDate doseDate) {
		super();
		this.citizenId = citizenId;
		this.doseName = doseName;
		this.docName = docName;
		this.location = location;
		this.doseDate = doseDate;
	}
	public Long getcitizenId() {
		return citizenId;
	}
	public void setcitizenId(Long citizenId) {
		this.citizenId = citizenId;
	}
	public String getDoseName() {
		return doseName;
	}
	public void setDoseName(String doseName) {
		this.doseName = doseName;
	}
	public String getdocName() {
		return docName;
	}
	public void setdocName(String docName) {
		this.docName = docName;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public LocalDate getDoseDate() {
		return doseDate;
	}
	public void setDoseDate(LocalDate doseDate) {
		this.doseDate = doseDate;
	}
	
	
	

}
