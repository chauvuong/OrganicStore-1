package controller;

import java.io.PrintWriter;
import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import dao.DetailOrderDao;
import dao.OrderDao;
import dao.ProductDao;
import dao.UserDao;
import entity.Order;
import util.SendMail;

@Controller
@RequestMapping(value = "admin/order")
public class AdminOrderController {

	@Autowired
	private Defines defines;

	@Autowired
	private ProductDao productDao;
	@Autowired
	private UserDao userDao;
	@Autowired
	private DetailOrderDao detailOrderDao;
	@Autowired
	private OrderDao orderDao;

	@ModelAttribute
	public void addCommons(ModelMap modelMap,HttpSession session) {
		modelMap.addAttribute("defines", defines);
		session.setAttribute("NoActive", orderDao.countItemNoactive());
		session.setAttribute("listOrderNoActive", orderDao.getItemsNoActive());

	}

	@RequestMapping(value = "", method = RequestMethod.GET)
	public String index(ModelMap modelMap, Principal principal,
			@RequestParam(value = "page", defaultValue = "1") int page) {
		modelMap.addAttribute("user", userDao.getUser(principal.getName()));

		int current_page = 1;
		int sum = Defines.ROW_COUNT;
		int sumOrder = orderDao.countItem();
		int sumPage = (int) Math.ceil((float) sumOrder / sum);
		modelMap.addAttribute("sumPage", sumPage);
		if (page != 0) {
			current_page = page;
		}
		modelMap.addAttribute("sum", sum);
		modelMap.addAttribute("current_page", current_page);
		int offset = (current_page - 1) * sum;
		modelMap.addAttribute("listOrder", orderDao.getItemsAdmin(offset));

		return "admin.order.index";
	}

	@RequestMapping(value = "detail/{id}", method = RequestMethod.GET)
	public String edit(@PathVariable("id") int id, ModelMap modelMap) {
		modelMap.addAttribute("listDetail", detailOrderDao.getItems(id));
		return "admin.order.detail";
	}

	@RequestMapping(value = "dels", method = RequestMethod.POST)
	public String delItems(HttpServletRequest request, RedirectAttributes ra) {
		String[] selected = request.getParameterValues("selected");
		if (selected == null) {
			return "redirect:/admin/order";
		} else {
			int dem = 0;
			for (String string : selected) {
				int id = Integer.parseInt(string);
				if (orderDao.delItem(id) > 0) {
					dem++;
				}
			}

			if (dem == selected.length) {
				ra.addFlashAttribute("msg", "Xóa " + dem + " Đơn Hàng Thành Công");
				return "redirect:/admin/order";
			} else {
				ra.addFlashAttribute("msg", "Xóa Thất Bại");
				return "redirect:/admin/order";
			}
		}

	}

	@RequestMapping("del/{id}")
	public String delItem(@PathVariable("id") int id, RedirectAttributes ra) {

		if (orderDao.getItem(id) == null) {
			ra.addFlashAttribute("msg", "ID Không Tồn Tại");
			return "redirect:/admin/order";
		}
		if (orderDao.delItem(id) > 0) {
			ra.addFlashAttribute("msg", "Xóa Thành Công");
		} else {
			ra.addFlashAttribute("msg", "Xóa Thất Bại");
		}
		return "redirect:/admin/order";
	}

	@RequestMapping(value = "/ajax", method = RequestMethod.POST)
	public void xuly(@RequestParam("aimg") String img, @RequestParam("aid") int id, PrintWriter out,
			ModelMap modelMap) {

		String imgTick = defines.getSHOP_TEMPLATE_URL() + "/images/active.gif";
		String imgLock = defines.getSHOP_TEMPLATE_URL() + "/images/deactive.gif";
		String htmlTick = "<a href='javascript:void(0)' onclick='return changes" + id + "()'><img id='img" + id
				+ "' width='15px' height='15px' src='" + imgTick + "' alt='tick' /></a>";
		String htmlLock = "<a href='javascript:void(0)' onclick='return changes" + id + "()'><img id='img" + id
				+ "' width='15px' height='15px' src='" + imgLock + "' alt='lock' /></a>";
		Order objOrder = orderDao.getItem(id);

		if (imgTick.equals(img)) {
			objOrder.setStatus(0);
			orderDao.editActiveStatus(objOrder);
			out.print(htmlLock);
		} else {
			objOrder.setStatus(1);
			orderDao.editActiveStatus(objOrder);
			out.print(htmlTick);

		}
	}

}
