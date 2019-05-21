package gr.hua.dit.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/customer")
public class CustomerController {

	@GetMapping("/MaintenanceInstructions")
	public String MaintenanceInstructions(HttpServletRequest request, Model model, HttpServletResponse response) {
		// add page title
		model.addAttribute("pageTitle", "Vehicle Maintenance Tips");
		return "instructions-form";
	}
	

	@GetMapping("/AboutUs")
	public String AboutUs(HttpServletRequest request, Model model, HttpServletResponse response) {
		// add page title
		model.addAttribute("pageTitle", "About Us");
		return "rules-form";
	}
	
	@GetMapping("/checkVehicle")
	public String checkVehicle(HttpServletRequest request, Model model, HttpServletResponse response) {
		// add page title
		model.addAttribute("pageTitle", "About Us");
		return "rules-form";
	}
}
