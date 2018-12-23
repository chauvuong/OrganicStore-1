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
import dao.DiscountDao;
import entity.Cat;
import entity.Discount;
import util.StringUtil;

@Controller
@RequestMapping("admin/discount")
public class AdminDiscountController {
	@Autowired
	private DiscountDao discountDao;

	@RequestMapping("")
	public String index(ModelMap modelMap) {
		modelMap.addAttribute("alDiscount", discountDao.getItems());

		return "admin.discount.index";
	}

	@RequestMapping("add")
	public String add() {
		return "admin.discount.add";
	}

	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String add(@Valid @ModelAttribute("discount") Discount discount, BindingResult rs, RedirectAttributes ra,
			ModelMap modelMap) {
		if (rs.hasErrors()) {
			modelMap.addAttribute("discount", discount);
			return "admin.discount.add";
		}
		if (!discount.getName().trim().equals("")) {
			discount.setName(discount.getName().trim());
			if (StringUtil.checkSpace(discount.getName()))
				if (discountDao.checkItem(discount))
					if (discountDao.addItem(discount) > 0) {
						ra.addFlashAttribute("msg", "Thêm Thành Công!");
						return "redirect:/admin/discount";
					} else {
						ra.addFlashAttribute("msg", "Có Lỗi Khi Thêm!");

					}
		}
		return "redirect:/admin/discount/add?msg=add";

	}

	@RequestMapping(value = "edit/{id}")
	public String edit(@PathVariable("id") int id, ModelMap modelMap, RedirectAttributes ra) {
		modelMap.addAttribute("objDiscount", discountDao.getItem(id));
		return "admin.discount.edit";
	}

	@RequestMapping(value = "edit/{id}", method = RequestMethod.POST)
	public String edit(@Valid @ModelAttribute("objDiscount") Discount discount, BindingResult rs,
			@PathVariable("id") int id, ModelMap modelMap, RedirectAttributes ra) {
		discount.setId_discount(id);
		if (rs.hasErrors()) {
			modelMap.addAttribute("objDiscount", discount);
			return "admin.discount.edit";
		}
		Discount oldDiscount = discountDao.getItem(id);
		if (oldDiscount == null) {
			ra.addFlashAttribute("msg", "ID Không Tồn Tại");
			return "redirect:/admin/discount";

		}

		if (!"".equals(discount.getName().trim())) {

			discount.setName(discount.getName().trim());

			if (!discountDao.checkItem(discount)) {
				modelMap.addAttribute("err", "error");
				return "admin.discount.edit";
			} else {
				if (discountDao.editItem(discount) > 0) {
					ra.addFlashAttribute("msg", "Sửa Thành Công!");
					return "redirect:/admin/discount";
				} else {
					ra.addFlashAttribute("msg", "Có Lỗi Khi Sửa!");
					return "redirect:/admin/discount";
				}

			}
		}

		return "admin.discount.edit";
	}

	@RequestMapping(value = "del/{id}")
	public String delItem(@PathVariable("id") int id, RedirectAttributes ra) {

		if (discountDao.getItem(id) == null) {
			ra.addFlashAttribute("msg", "ID Không Tồn Tại");
			return "redirect:/admin/discount";
		}
		if (discountDao.delItem(id) > 0) {
			ra.addFlashAttribute("msg", "Xóa Thành Công!");
		} else {
			ra.addFlashAttribute("msg", "Xóa Thất Bại!");
		}

		return "redirect:/admin/discount";
	}

}
