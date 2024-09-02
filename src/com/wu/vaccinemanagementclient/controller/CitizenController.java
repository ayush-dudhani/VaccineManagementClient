package com.wu.vaccinemanagementclient.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.wu.vaccinemanagementclient.entity.Citizen;
import com.wu.vaccinemanagementclient.entity.Dose;
import com.wu.vaccinemanagementclient.service.CitizenService;

@Controller
public class CitizenController {

    @Autowired
    private CitizenService citizenService;

    @GetMapping("/citizens")
    public String getUsers(Model model) {
        ArrayList<Citizen> citizens = citizenService.getAllCitizens();
        model.addAttribute("citizens", citizens);
        return "list-citizen";
    }
    
    @GetMapping("/addformforcitizen")
    public String addCitizen(Model model) {
    	Citizen cz = new Citizen();
    	model.addAttribute("citizen", cz);
    	return "citizen-form";
    }
    
    @PostMapping("/savecitizen")
    public String saveCitizen(@ModelAttribute("citizen") Citizen theCitizen) {
    	citizenService.addCitizen(theCitizen);
    	return "redirect:citizens";
    }
    
    @GetMapping("/deleteform")
    public String deleteCitizen(@RequestParam("citizenId") long citizenId) {
    	citizenService.deleteCustomerById(citizenId);
    	return "redirect:citizens";
    }
   
    @GetMapping("/updateform")
    public String showUpdateForm(@RequestParam("citizenId") long theId, Model theModel) {
    	Citizen cz = citizenService.getCitizenById(theId);
    	theModel.addAttribute("citizen", cz);
    	return "citizen-form";
    } 
    
    
    @GetMapping("/firstdoselist")
    public String getFirstDose(Model model) {
        ArrayList<Dose> firstdose = citizenService.getAllFirstDose();
        model.addAttribute("dose", firstdose);
        model.addAttribute("doseno", 1);
        return "list-dose";
    }
    
    @GetMapping("/seconddoselist")
    public String getSecondDose(Model model) {
        ArrayList<Dose> seconddose = citizenService.getAllSecondDose();
        model.addAttribute("dose", seconddose);
        model.addAttribute("doseno", 2);
        return "list-dose";
    }
    
    @GetMapping("/boosterdoselist")
    public String getBoosterDose(Model model) {
        ArrayList<Dose> boosterdose = citizenService.getAllBoosterDose();
        model.addAttribute("dose", boosterdose);
        model.addAttribute("doseno", 3);
        return "list-dose";
    }
    
    @GetMapping("/adddoseform")
    public String showFirstDoseForm(@RequestParam("citizenId") long theId, @RequestParam("doseTaken") int doseTaken, Model theModel) {
    	Dose dose = new Dose();
    	dose.setcitizenId(theId);
    	Citizen cz  = citizenService.getCitizenById(theId);
    	if(doseTaken == 0) {
//    		nothing to do
    		dose.setDoseName("");
    	} else if( doseTaken == 1) {
    		Dose fDose = citizenService.getFirstDoseDetailsById(theId);
    		dose.setDoseName(fDose.getDoseName());
    	} else if( doseTaken == 2) {
    		Dose sDose = citizenService.getSecondDoseDetailsById(theId);
    		dose.setDoseName(sDose.getDoseName());
    	} 
    	theModel.addAttribute("DoseDetails", dose);
    	 theModel.addAttribute("doseNo", doseTaken);
    	return "dose-form";
    }
    
    @PostMapping("/adddose")
    public String addFirstDose(@ModelAttribute("FirstDose") Dose theFirstDose) {
    	Long cid = theFirstDose.getcitizenId();
    	Citizen cz = citizenService.getCitizenById(cid);
    	int dosesTaken = cz.getDosesTaken();
    	if(dosesTaken == 0) {
    		citizenService.addFirstDose(theFirstDose);
    	} else if (dosesTaken == 1) {
    		citizenService.addSecondDose(theFirstDose);
    	} else if (dosesTaken == 2) {
    		citizenService.addBoosterDose(theFirstDose);
    	}
    	
    	return "redirect:citizens";
    }
    

    	
    
 
}
