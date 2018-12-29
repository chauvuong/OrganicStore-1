package controller;

import java.security.Principal;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import dao.CatDao;
import dao.CommentDao;
import dao.ContactDAO;
import dao.MemberDao;
import dao.OrderDao;
import dao.PayDao;
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
	private UserDao userDao;
	@Autowired
	private CommentDao commentDao;
	@Autowired
	private PayDao payDao;
	@Autowired
	private ContactDAO contactDAO;

	

	@RequestMapping("")
	public String index(ModelMap modelMap, Principal principal, HttpSession session) {
		int sumMember = memberDao.countItem();
		int sumNews = productDao.countItem();
		int sumOrder = orderDao.countItem();

		int sumCat = catDao.countItem();
		int sumPay = payDao.countItem();
		int sumAdmin = userDao.countItem();
		int sumComment = commentDao.countItem();
		int sumContact = contactDAO.countItem();
		modelMap.addAttribute("sumMember", sumMember);
		modelMap.addAttribute("sumNews", sumNews);
		modelMap.addAttribute("sumOrder", sumOrder);

		modelMap.addAttribute("sumCat", sumCat);
		modelMap.addAttribute("sumComment", sumComment);
		modelMap.addAttribute("sumPay", sumPay);
		modelMap.addAttribute("sumAdmin", sumAdmin);
		modelMap.addAttribute("sumContact", sumContact);
		String fullname = principal.getName();
		session.setAttribute("listCommentNews", commentDao.getItemsCommentNews());
		session.setAttribute("fullname", fullname);
		session.setAttribute("sumComment", sumComment);
		session.setAttribute("NoActive", orderDao.countItemNoactive());
		session.setAttribute("listOrderNoActive", orderDao.getItemsNoActive());

		return "admin.index.index";
	}
}
