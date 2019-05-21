package gr.hua.dit.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import gr.hua.dit.entity.User;

@Controller
@RequestMapping("/login")
public class LoginController {

	@GetMapping("/showLoginForm")
	public String showLoginForm(HttpServletRequest request, Model model, HttpServletResponse response) {
		// create model attribute to get form data
		User user = new User();
		model.addAttribute("user", user);

		// add page title
		model.addAttribute("pageTitle", "Login");
		return "login-form";
	}
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logoutPage (HttpServletRequest request, HttpServletResponse response) {
	    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    if (auth != null){    
	        new SecurityContextLogoutHandler().logout(request, response, auth);
	    }
	    return "redirect:/login/showLoginForm";//You can redirect wherever you want, but generally it's a good practice to show login screen again.
	}

//	@RequestMapping("/loginCustomer")
//	public String loginUser(HttpServletRequest request, @ModelAttribute("user") User user, HttpServletResponse response)
//			throws ServletException, IOException {
//
//		System.out.println(user.getUsername());
//		System.out.println(user.getPassword());
//		return "redirect:/login/homePage";
//	}

	@RequestMapping("/homePage")
	public String homePage(HttpServletRequest request, Model model, HttpServletResponse response) {
		// create model attribute to get form data
		User user = new User();
		model.addAttribute("user", user);

		// add page title
		model.addAttribute("pageTitle", "Home");
		return "home";
	}

	@RequestMapping("/locationPage")
	public String locationPage(HttpServletRequest request, Model model, HttpServletResponse response) {
		// create model attribute to get form data
		User user = new User();
		model.addAttribute("user", user);

		// add page title
		model.addAttribute("pageTitle", "Location");
		return "location";
	}

}
