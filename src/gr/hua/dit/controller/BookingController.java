package gr.hua.dit.controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import gr.hua.dit.entity.Booking;
import gr.hua.dit.entity.User;
import gr.hua.dit.entity.Vehicle;
import gr.hua.dit.entity.Vehicle_card;

@Controller
@RequestMapping("/booking")
public class BookingController {
	public static String license_plt;

	@GetMapping("/showBookingForm")
	public String showBookingForm(HttpServletRequest request, Model model, HttpServletResponse response) {
		// create model attribute to get form data
		User user = new User();
		model.addAttribute("user", user);

		// add page title
		model.addAttribute("pageTitle", "Bookings");
		return "booking-form";
	}

	@GetMapping("/myBookings")
	public String myBookings(HttpServletRequest request, Model model, HttpServletResponse response) {
		// create model attribute to get form data
		String username;
		try {
			Client client = Client.create();
			Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			if (principal instanceof UserDetails) {
				username = ((UserDetails) principal).getUsername();
			} else {
				username = principal.toString();
			}
			WebResource webResource = client.resource("http://localhost:8080/intranet-app/api/booking/" + username);

			ClientResponse response1 = webResource.type("application/json").get(ClientResponse.class);

			System.out.println(response1.getStatus());

			System.out.println("Output from Server .... \n");

			String output = response1.getEntity(String.class);
			String output1 = output.substring(15, output.length() - 1);
			System.out.println("* JSON string contains:  * " + output1);
			ObjectMapper objectMapper = new ObjectMapper();
			TypeReference<List<Booking>> mapType = new TypeReference<List<Booking>>() {
			};
			List<Booking> jsonToList = objectMapper.readValue(output1, mapType);

			request.setAttribute("allBookingsOfUser", jsonToList);

			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/myBookings-form.jsp");
			rd.forward(request, response);

		} catch (Exception e) {

			e.printStackTrace();

		}

		return "myBookings-form";
	}

	@RequestMapping("/bookingStep1")
	public String bookingStep1(HttpServletRequest request, @ModelAttribute("vehicleDB") Vehicle vehicle,
			HttpServletResponse response) throws ServletException, IOException {
		String username;
		try {
			Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			if (principal instanceof UserDetails) {
				username = ((UserDetails) principal).getUsername();
			} else {
				username = principal.toString();
			}
			license_plt = vehicle.getLicense_plate();
			Client client = Client.create();
			Client client1 = Client.create();

			WebResource webResource_license_plate = client
					.resource("http://localhost:8080/intranet-app/api/vehicle/" + vehicle.getLicense_plate());

			ClientResponse response_license_plate = webResource_license_plate.type("application/json")
					.get(ClientResponse.class);

			if (response_license_plate.getStatus() == 200) {

				WebResource webResource = client.resource("http://localhost:8080/intranet-app/api/booking/" + username);

				ClientResponse response_bookings = webResource.type("application/json").get(ClientResponse.class);
				String output = response_bookings.getEntity(String.class);

				if (output.contains(vehicle.getLicense_plate())) {
					request.setAttribute("license_plate", "You have already booked with this license plate!");
					RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/booking-form.jsp");
					rd.forward(request, response);
				} else {
					WebResource webResource_date = client1.resource(
							"http://localhost:8080/intranet-app/api/vehicle/next/" + vehicle.getLicense_plate()); //Παίρνουμε το next inspection date από την καρτέλα του οχήματος
					ClientResponse response_date = webResource_date.type("application/json").get(ClientResponse.class);

					String output_dt = response_date.getEntity(String.class);
					
					if (output_dt.equals("[]")) { //Υπάρχει στην Εθνική Ενιαία Βάση αλλά όχι στο ΚΤΕΟ
						request.setAttribute("message", "200");
						RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/booking-form.jsp");
						rd.forward(request, response);
					} else {
						
				
						String output_date = output_dt.substring(2, output_dt.length() - 2);
						request.setAttribute("msg", "200"+output_date);
						RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/booking-form.jsp");
						rd.forward(request, response);
					}
				}

			}

			if (response_license_plate.getStatus() == 500) {
				request.setAttribute("message", "500");
				RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/booking-form.jsp");
				rd.forward(request, response);
			}

			if (response_license_plate.getStatus() == 404) {
				request.setAttribute("message", "404");
				RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/booking-form.jsp");
				rd.forward(request, response);
			}

			System.out.println("Output from Server .... \n");
			String output = response_license_plate.getEntity(String.class);
			System.out.println(output);

		} catch (Exception e) {

			e.printStackTrace();

		}
		return "booking-form";
	}

	@RequestMapping("/bookingStep2")
	public String bookingStep2(HttpServletRequest request, @ModelAttribute("vehicle_card") Vehicle_card v_card,
			@ModelAttribute("bookings") Booking booking, HttpServletResponse response)
			throws ServletException, IOException {
		String username;
		try {
			Client client = Client.create();
			Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			if (principal instanceof UserDetails) {
				username = ((UserDetails) principal).getUsername();
			} else {
				username = principal.toString();
			}

			WebResource webResource = client
					.resource("http://localhost:8080/intranet-app/api/booking/add?date=" + booking.getDate() + "&time="
							+ booking.getTime() + "&username=" + username + "&vehicleToCheck=" + license_plt);

			ClientResponse response1 = webResource.type("application/json").post(ClientResponse.class);

			System.out.println("Output from Server .... \n");
			String output = response1.getEntity(String.class);
			System.out.println(output);

		} catch (Exception e) {

			e.printStackTrace();

		}
		return "booking-form";
	}

}
