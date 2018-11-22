package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import dao.CatDao;
import dao.MemberDao;
import dao.OrderDao;
import dao.ProductDao;

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
	
	@RequestMapping("")
	public String index(ModelMap modelMap) {
		int sumMember = memberDao.countItem();
		int sumNews = productDao.countItem();
		int sumOrder = orderDao.countItem();
		int sumCat = catDao.countItem();
		modelMap.addAttribute("sumMember", sumMember);
		modelMap.addAttribute("sumNews", sumNews);
		modelMap.addAttribute("sumOrder", sumOrder);
		modelMap.addAttribute("sumCat", sumCat);
		return "admin.index.index";
	}
}
