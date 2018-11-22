package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dao.PayDao;
import dao.ProductDao;
import entity.Payment;
import entity.Product;
import util.StringUtil;

@Controller
@RequestMapping("admin/payment")
public class AdminPaymentController {
	@Autowired
	private PayDao payDao;
	@Autowired
	private ProductDao productDao;

	@RequestMapping("")
	public String index(ModelMap modelMap) {
		modelMap.addAttribute("alPayment", payDao.getItems());
		return "admin.payment.index";
	}

	@RequestMapping("add")
	public String add() {
		return "admin.payment.add";
	}

	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String add(@Valid  @ModelAttribute("pay") Payment pay, BindingResult rs, RedirectAttributes ra, ModelMap modelMap) {
		
		if (rs.hasErrors()) {
			modelMap.addAttribute("pay", pay);
			return "admin.payment.add";
		}
		if (!pay.getName().trim().equals("")) {
			pay.setName(pay.getName().trim());
			if (StringUtil.checkSpace(pay.getName()))
				if (payDao.checkItem(pay))
					if (payDao.addItem(pay) > 0) {
						ra.addFlashAttribute("msg", "Thêm Thành Công!");
						return "redirect:/admin/payment";
					} else {
						ra.addFlashAttribute("msg", "Có Lỗi Khi Thêm!");

					}
		}
		return "redirect:/admin/payment/add?msg=add";

	}

	@RequestMapping(value = "edit/{id}")
	public String edit(@PathVariable("id") int id, ModelMap modelMap, RedirectAttributes ra) {
		modelMap.addAttribute("objPay", payDao.getItem(id));
		return "admin.payment.edit";
	}

	@RequestMapping(value = "edit/{id}", method = RequestMethod.POST)
	public String edit(@Valid @ModelAttribute("objPay") Payment pay,BindingResult rs, @PathVariable("id") int id, ModelMap modelMap,
			RedirectAttributes ra) {
		pay.setId_pay(id);
		if (rs.hasErrors()) {
			modelMap.addAttribute("objPay", pay);
			return "admin.payment.edit";
		}
		
		if (payDao.getItem(id) == null) {
			ra.addFlashAttribute("msg", "ID Không Tồn Tại");
			return "redirect:/admin/payment";

		}
		if (!pay.getName().trim().equals("")) {

			pay.setName(pay.getName().trim());

			if (!payDao.checkItem(pay)) {
				modelMap.addAttribute("err", "error");
				return "admin.payment.edit";
			} else {
				if (payDao.editItem(pay) > 0) {
					ra.addFlashAttribute("msg", "Sửa Thành Công!");
					return "redirect:/admin/payment";
				} else {
					ra.addFlashAttribute("msg", "Có Lỗi Khi Sửa!");
					return "redirect:/admin/payment";
				}

			}
		}
		return "admin.payment.edit";
	}

	@RequestMapping(value = "del/{id}")
	public String delItem(@PathVariable("id") int id, RedirectAttributes ra) {

		if (payDao.getItem(id) == null) {
			ra.addFlashAttribute("msg", "ID Không Tồn Tại");
			return "redirect:/admin/payment";
		}
		if (payDao.delItem(id) > 0) {
			ra.addFlashAttribute("msg", "Xóa Thành Công!");
		} else {
			ra.addFlashAttribute("msg", "Xóa Thất Bại!");
		}

		return "redirect:/admin/payment";
	}
	
	
	
	
	
	
	
	
}