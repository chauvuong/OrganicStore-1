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

import dao.CatDao;
import entity.Cat;
import util.StringUtil;

@Controller
@RequestMapping("admin/cat")
public class AdminCatController {
	@Autowired
	private CatDao catDao;

	@RequestMapping("")
	public String index(ModelMap modelMap) {
		modelMap.addAttribute("alCat", catDao.getItems());

		return "admin.cat.index";
	}

	@RequestMapping("add")
	public String add() {
		return "admin.cat.add";
	}

	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String add(@Valid @ModelAttribute("cat") Cat cat,BindingResult rs,RedirectAttributes ra,  ModelMap modelMap) {
		if (rs.hasErrors()) {
			modelMap.addAttribute("cat", cat);
			return "admin.cat.add";
		}
		if (!cat.getName().trim().equals("")) {
			cat.setName(cat.getName().trim());
			if (StringUtil.checkSpace(cat.getName()))
				if (catDao.checkItem(cat))
					if (catDao.addItem(cat) > 0) {
						ra.addFlashAttribute("msg", "Thêm Thành Công!");
						return "redirect:/admin/cat";
					} else {
						ra.addFlashAttribute("msg", "Có Lỗi Khi Thêm!");

					}
		}
		return "redirect:/admin/cat/add?msg=add";

	}

	@RequestMapping(value = "edit/{id}")
	public String edit(@PathVariable("id") int id, ModelMap modelMap, RedirectAttributes ra) {
		modelMap.addAttribute("objCat", catDao.getItem(id));
		return "admin.cat.edit";
	}

	@RequestMapping( value = "edit/{id}", method = RequestMethod.POST)
	public String edit(@Valid @ModelAttribute("objCat") Cat cat,BindingResult rs, @PathVariable("id") int id, ModelMap modelMap,
			RedirectAttributes ra) {
		cat.setId_cat(id);
		if (rs.hasErrors()) {
			modelMap.addAttribute("objCat", cat);
			return "admin.cat.edit";
		}
		Cat oldCat = catDao.getItem(id);
		if (oldCat == null) {
			ra.addFlashAttribute("msg", "ID Không Tồn Tại");
			return "redirect:/admin/cat";

		}
	
		if (!"".equals(cat.getName().trim())) {

			cat.setName(cat.getName().trim());

			if (!catDao.checkItem(cat)) {
				modelMap.addAttribute("err", "error");
				return "admin.cat.edit";
			} else {
				if (catDao.editItem(cat) > 0) {
					ra.addFlashAttribute("msg", "Sửa Thành Công!");
					return "redirect:/admin/cat";
				} else {
					ra.addFlashAttribute("msg", "Có Lỗi Khi Sửa!");
					return "redirect:/admin/cat";
				}

			}
		}
		
		return "admin.cat.edit";
	}

	@RequestMapping(value = "del/{id}")
	public String delItem(@PathVariable("id") int id, RedirectAttributes ra) {

		if (catDao.getItem(id) == null) {
			ra.addFlashAttribute("msg", "ID Không Tồn Tại");
			return "redirect:/admin/cat";
		}
		if (catDao.delItem(id) > 0) {
			ra.addFlashAttribute("msg", "Xóa Thành Công!");
		} else {
			ra.addFlashAttribute("msg", "Xóa Thất Bại!");
		}

		return "redirect:/admin/cat";
	}

}
