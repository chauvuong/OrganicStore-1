package controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import dao.CatDao;
import dao.MemberDao;
import dao.OrderDao;
import dao.ProductDao;
import dao.UserDao;

@Controller
@RequestMapping("admin")
public class AdminIndexController {
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private OrderDao orderDao;
	@Autowired
	private ProductDao productDao;
	@Autowired
	private CatDao catDao;
	@Autowired
	private UserDao userDao ;
	
	@RequestMapping("")
	public String index(ModelMap modelMap, Principal principal) {
		int sumMember = memberDao.countItem();
		int sumNews = productDao.countItem();
		int sumOrder = orderDao.countItem();
		int sumCat = catDao.countItem();
		modelMap.addAttribute("sumMember", sumMember);
		modelMap.addAttribute("sumNews", sumNews);
		modelMap.addAttribute("sumOrder", sumOrder);
		modelMap.addAttribute("sumCat", sumCat);
		modelMap.addAttribute("fullname", principal.getName());
		
		return "admin.index.index";
	}
}
