package controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import constant.Defines;
import dao.ContactDAO;
import dao.MemberDao;
import dao.RoleDao;
import dao.UserDao;
import entity.Contact;
import entity.Member;
import entity.User;
import util.BCrypt;

@Controller
@RequestMapping("admin/contact")
public class AdminContactController {
	@Autowired
	private ContactDAO contactDao;
	
	@Autowired
	private Defines defines;

	@RequestMapping("")
	public String index(ModelMap modelMap) {
		modelMap.addAttribute("alContact", contactDao.getItems());
		
		return "admin.contact.index";
	}

	@RequestMapping(value = "del/{id}")
	public String delItem(@PathVariable("id") int id, RedirectAttributes ra) {

		if (contactDao.getItem(id) == null) {
			ra.addFlashAttribute("msg", "ID Không Tồn Tại");
			return "redirect:/admin/contact";
		}
		if (contactDao.delItem(id) > 0) {
			ra.addFlashAttribute("msg", "Xóa Thành Công!");
		} else {
			ra.addFlashAttribute("msg", "Xóa Thất Bại!");
		}

		return "redirect:/admin/contact";
	}

	
}
