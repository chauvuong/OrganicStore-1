package controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dao.RoleDao;
import entity.Role;
import util.StringUtil;

@Controller
@RequestMapping("admin/role")
public class AdminRoleController {
	@Autowired
	private RoleDao roleDao;

	@RequestMapping("")
	public String index(ModelMap modelMap) {
		modelMap.addAttribute("alRole", roleDao.getItems());
		return "admin.role.index";
	}

	@RequestMapping("add")
	public String add() {
		return "admin.role.add";
	}

	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String add(@Valid @ModelAttribute("role") Role role,BindingResult rs, RedirectAttributes ra, ModelMap modelMap) {
		if (rs.hasErrors()) {
			modelMap.addAttribute("role", role);
			return "admin.role.add";
		}
		if (!role.getName().trim().equals("")) {
			role.setName(role.getName().trim());
			if (StringUtil.checkSpace(role.getName()))
				if (roleDao.checkItem(role))
					if (roleDao.addItem(role) > 0) {
						ra.addFlashAttribute("msg", "Thêm Thành Công!");
						return "redirect:/admin/role";
					} else {
						ra.addFlashAttribute("msg", "Có Lỗi Khi Thêm!");

					}
		}
		return "redirect:/admin/role/add?msg=add";

	}

	@RequestMapping(value = "edit/{id}")
	public String edit(@PathVariable("id") int id, ModelMap modelMap, RedirectAttributes ra) {
		modelMap.addAttribute("objRole", roleDao.getItem(id));
		return "admin.role.edit";
	}

	@RequestMapping(value = "edit/{id}", method = RequestMethod.POST)
	public String edit(@Valid @ModelAttribute("objRole") Role role, BindingResult rs, @PathVariable("id") int id, ModelMap modelMap,
			RedirectAttributes ra) {
		role.setRole_id(id);
		if (rs.hasErrors()) {
			modelMap.addAttribute("objRole", role);
			return "admin.role.edit";
		}
		
		if (roleDao.getItem(id) == null) {
			ra.addFlashAttribute("msg", "ID Không Tồn Tại");
			return "redirect:/admin/cat";

		}
		if (!role.getName().trim().equals("")) {

			role.setName(role.getName().trim());

			if (!roleDao.checkItem(role)) {
				modelMap.addAttribute("err", "error");
				return "admin.role.edit";
			} else {
				if (roleDao.editItem(role) > 0) {
					ra.addFlashAttribute("msg", "Sửa Thành Công!");
					return "redirect:/admin/role";
				} else {
					ra.addFlashAttribute("msg", "Có Lỗi Khi Sửa!");
					return "redirect:/admin/role";
				}

			}
		}
		return "admin.role.edit";
	}

	@RequestMapping(value = "del/{id}")
	public String delItem(@PathVariable("id") int id, RedirectAttributes ra) {

		if (roleDao.getItem(id) == null) {
			ra.addFlashAttribute("msg", "ID Không Tồn Tại");
			return "redirect:/admin/role";
		}
		if (roleDao.delItem(id) > 0) {
			ra.addFlashAttribute("msg", "Xóa Thành Công!");
		} else {
			ra.addFlashAttribute("msg", "Xóa Thất Bại!");
		}

		return "redirect:/admin/role";
	}

}
