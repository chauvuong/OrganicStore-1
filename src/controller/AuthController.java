package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AuthController {
	@RequestMapping("/login")
	public String login() {
		return "auth.login";
	}

	@RequestMapping("/403")
	public String err403() {
		return "auth.403";
	}
	
	@RequestMapping("/404")
	public String err404() {
		return "public.shop.404";
	}

}
