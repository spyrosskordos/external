package gr.hua.dit.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.exception.ConstraintViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import gr.hua.dit.entity.User;

@Controller
@RequestMapping("/user")
public class UserController {
	public static String vhcl = null;

	@GetMapping("/register")
	public String adminForm(Model model) {

		// create model attribute to get form data
		User user = new User();
		model.addAttribute("user", user);

		// add page title
		model.addAttribute("pageTitle", "Register");
		return "register-form";
	}

	@RequestMapping("/createUser")
	public String createUser(HttpServletRequest request, @ModelAttribute("user") User user,
			HttpServletResponse response) throws ServletException, IOException {
		try {

			Client client = Client.create();

			WebResource webResource = client
					.resource("http://localhost:8080/intranet-app/api/user/add/?username=" + user.getUsername()
							+ "&password=" + user.getPassword() + "&name=" + user.getName() + "&surname="
							+ user.getSurname() + "&email=" + user.getEmail());

			ClientResponse response1 = webResource.type("application/json").post(ClientResponse.class);

			if (response1.getStatus() == 200) {
				System.out.println("Output from Server .... \n");
				String output = response1.getEntity(String.class);
				System.out.println(output);
			}

			if (response1.getStatus() == 500) {
				request.setAttribute("message", "User already exist!");
				RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/register-form.jsp");
				rd.forward(request, response);
			}

		} catch (ConstraintViolationException e) {

			e.printStackTrace();

		}
		return "redirect:/user/register";
	}

}
