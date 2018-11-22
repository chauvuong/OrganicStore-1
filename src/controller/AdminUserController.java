package controller;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import constant.Defines;
import dao.RoleDao;
import dao.UserDao;
import entity.Cat;
import entity.User;
import util.BCrypt;

@Controller
@RequestMapping("admin/user")
public class AdminUserController {
	@Autowired
	private UserDao userDao;
	@Autowired
	private RoleDao roleDao;
	@Autowired
	private Defines defines;
	
	
	@RequestMapping("")
	public String index(ModelMap modelMap) {
		modelMap.addAttribute("alUser", userDao.getItems());
		return "admin.user.index";
	}

	@RequestMapping("add")
	public String add(ModelMap modelMap) {
		modelMap.addAttribute("listRole", roleDao.getItems());
		return "admin.user.add";
	}

	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String add(@Valid @ModelAttribute("user") User user,BindingResult rs,ModelMap modelMap, RedirectAttributes ra) {
		if (rs.hasErrors()) {
			modelMap.addAttribute("user", user);
			modelMap.addAttribute("listRole", roleDao.getItems());
			return "admin.user.add";
		}
		if (!user.getUsername().trim().equals("") && !user.getFullname().trim().equals("")) {
			user.setUsername(user.getUsername().trim());
			user.setFullname(user.getFullname().trim());
			String hashed = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
			user.setPassword(hashed);
			if (userDao.checkItemUs(user))
				if (userDao.addItem(user) > 0) {
					ra.addFlashAttribute("msg", "Thêm Thành Công!");
					return "redirect:/admin/user";
				} else {
					ra.addFlashAttribute("msg", "Có Lỗi Khi Thêm!");
				}
		}
		return "redirect:/admin/user/add?msg=add";
	}

	@RequestMapping(value = "del/{id}")
	public String delItem(@PathVariable("id") int id, RedirectAttributes ra) {
		if (userDao.getItem(id) == null) {
			ra.addFlashAttribute("msg", "ID Không Tồn Tại");
			return "redirect:/admin/user";
		}

		if ("admin".equals(userDao.getItem(id).getUsername())) {
			ra.addFlashAttribute("msg", "Không Thể Xóa Admin!");
		} else {
			if (userDao.delItem(id) > 0) {
				ra.addFlashAttribute("msg", "Xóa Thành Công!");
			} else {
				ra.addFlashAttribute("msg", "Xóa Thất Bại!");
			}
		}
		return "redirect:/admin/user";
	}
	
	@RequestMapping(value = "edit/{id}")
	public String edit(@PathVariable("id") int id, ModelMap modelMap, RedirectAttributes ra) {
		modelMap.addAttribute("objUser", userDao.getItem(id));
		modelMap.addAttribute("listRole", roleDao.getItems());
		return "admin.user.edit";
		
	}


	@RequestMapping(value = "edit/{id}", method = RequestMethod.POST)
	public String edit(@Valid  @ModelAttribute("objUser") User user,BindingResult rs,@PathVariable("id") int id, RedirectAttributes ra,
			ModelMap modelMap, @RequestParam("password") String password, HttpServletRequest request) {
		user.setId_user(id);
		if (rs.hasErrors()) {
			modelMap.addAttribute("objUser", user);
			modelMap.addAttribute("listRole", roleDao.getItems());
			return "admin.user.edit";
		}
		
		if (!"".equals(user.getFullname().trim())) {
			user.setFullname(user.getFullname().trim());
			
			if (!"".equals(user.getPassword())) {
				String hashed = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
				user.setPassword(hashed);
				//System.out.println("mk sau khi bcrypt--sua: " + hashed);
			} else {
				user.setPassword(userDao.getItem(id).getPassword());
			}

			if (userDao.checkItemUs(user))
				if (userDao.editItem(user) > 0) {
					ra.addFlashAttribute("msg", "Sửa Thành Công!");
					return "redirect:/admin/user";
				} else {
					ra.addFlashAttribute("msg", "Có Lỗi Khi Sửa!");
				}
		}
		return "redirect:/admin/user/edit?msg=edit";
	}

	

}
