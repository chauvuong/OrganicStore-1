package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

import dao.CatDao;
import dao.CommentDao;
import dao.ContactDAO;
import dao.MemberDao;
import dao.PayDao;
import dao.ProductDao;
import entity.Comment;
import entity.Contact;
import entity.Member;
import entity.Product;
import util.SendMail;
import util.SlugUtil;
import util.StringUtil;


	
@Controller
@RequestMapping("")
public class PublicController {
	private ArrayList<Product> listCart = new ArrayList<>();
	@Autowired
	private CatDao catDao;
	@Autowired
	private ProductDao productDao;
	@Autowired
	private PayDao payDao;
	@Autowired
	private StringUtil stringUtil;
	@Autowired
	private SlugUtil slugUtil;
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private SendMail sendMail;
	@Autowired
	private ContactDAO contactDao;
	@Autowired
	private CommentDao commentDao;
	
	@ModelAttribute
	public void addCommon(ModelMap modelMap, HttpSession session) {
		modelMap.addAttribute("listCat", catDao.getItems());
		modelMap.addAttribute("stringUtil", stringUtil);
		modelMap.addAttribute("productDao", productDao);
		modelMap.addAttribute("slugUtil", slugUtil);
		modelMap.addAttribute("alProduct", productDao.getItemsPublics());
		modelMap.addAttribute("alProductViews", productDao.getItemsViews());
		modelMap.addAttribute("listNews", productDao.getItemsPublicNew());
	/*	modelMap.addAttribute("alProduct", productDao.getItemsPublicNews());
		
		
		modelMap.addAttribute("alProduct", productDao.getItemsPublics());*/

	}

	@RequestMapping("")
	public String index() {
		return "public.shop.index";
		
	}
	@RequestMapping("/{slug}/{id}")
	public String cat(@PathVariable("id") int id, ModelMap modelMap,
			@RequestParam(value = "page", defaultValue = "1") int page) {
		/*Product objProduct = productDao.getItem(id);*/
		/*int current_page = 1;
		int sum = Defines.ROW_COUNT;
		int sumNews = productDao.countNewPublicCat(objProduct.getId_cat());
		int sumPage = (int) Math.ceil((float) sumNews / sum);
		modelMap.addAttribute("sumPage", sumPage);
		if (page != 0) {
			current_page = page;
		}
		modelMap.addAttribute("sum", sum);
		modelMap.addAttribute("current_page", current_page);
		int offset = (current_page - 1) * sum;
		// modelMap.addAttribute("listProduct", productDao.getItemsCat(id,
		// offset));
*/		modelMap.addAttribute("listProduct", productDao.getItemsCat(id));
		modelMap.addAttribute("objCat", catDao.getItem(id));
		
		return "public.shop.cat";
	}
	
	
	
	@RequestMapping(value = "/huy/{id}", method = RequestMethod.GET)
	public String huy(@PathVariable("id") int id, HttpSession session) {
		ArrayList<Product> listCart = (ArrayList<Product>) session.getAttribute("listCart");
		for (Product item : listCart) {
			if (id == item.getId_product()) {
				listCart.remove(item);
				break;
			}
		}
		return "redirect:/cart";
	}
	@RequestMapping(value = "/huy/{id}", method = RequestMethod.POST)
	public String huysanpham(@PathVariable("id") int id, HttpSession session) {
		ArrayList<Product> listCart = (ArrayList<Product>) session.getAttribute("listCart");
		
		for (Product item : listCart) {
			if (id == item.getId_product()) {
				listCart.remove(item);
				break;
			}
			
		}
		
		return "redirect:/cart";
	}
	
	
	
	@RequestMapping(value = "/editsoluong", method = RequestMethod.POST)
	public void soluong(HttpServletRequest request, HttpSession session, HttpServletResponse response)
			throws IOException {
		int soluong = Integer.parseInt(request.getParameter("soluong"));
		int id = Integer.parseInt(request.getParameter("id"));
		
		PrintWriter out = response.getWriter();
		int money = 0;
		if (soluong > 0) {
			ArrayList<Product> listCart = (ArrayList<Product>) session.getAttribute("listCart");
			for (Product obj : listCart) {
				if (id == obj.getId_product()) {
					obj.setQuatity(soluong);
				}
				money += obj.getPrice() * obj.getQuatity();
			}
			out.print("<span class=\"size-w-59 txt-m-104 cl6\"  id= \"tongtien\">" + money
					+ "</span>"

			);

		}

	}
	
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public String themvaogiohang() {
		return "public.shop.cart";
	}
	
	@RequestMapping(value = "/cart", method = RequestMethod.POST)
	public void themvaogiohang(ModelMap modelMap, HttpSession session, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		int id_sp = Integer.parseInt(request.getParameter("aid_sp"));
		Product itemProduct = productDao.getItem(id_sp);
		itemProduct.setQuatity(itemProduct.getQuatity() + 1);
		boolean check = true;
		if (listCart.size() > 0) {
			for (Product item : listCart) {
				if (id_sp == item.getId_product()) {
					item.setQuatity(item.getQuatity() + 1);
					check = false;
					break;
				}
			}
		}
		if (check == true) {
			listCart.add(itemProduct);
		}
		int tongtien = 0;
		session.setAttribute("listCart", listCart);
		if (listCart.size() > 0) {
			ArrayList<Product> listCart = (ArrayList<Product>) session.getAttribute("listCart");
			String s = "<div class=\"bo-b-1 bocl15\"><div class=\"size-h-2 js-pscroll m-r--15 p-r-15\" style=\"overflow:auto; \">";
			for (Product obj : listCart) {
				tongtien = (int) (tongtien + obj.getPrice() * obj.getQuatity());
				s += "<div class=\"flex-w flex-str m-b-25\">" + "<div class=\"size-w-15 flex-w flex-t\"><a href='' class=\"wrap-pic-w bo-all-1 bocl12 size-w-16 hov3 trans-04 m-r-14\"> " + "<img width='77px' height='64.33px' src='"
						+ request.getContextPath() + "/files/" + obj.getPicture() + "' /></a>" + "<div class=\"size-w-17 flex-col-l\">"
						+ "<a href=''>" + obj.getName() + "</a>" + "<span class=\"txt-s-101 cl9\">$"
						+ obj.getPrice() + "</span>" + "<span class=\"txt-s-109 cl12\">" + obj.getQuatity()+ "</span>"
						+ "</div></div><div class=\"size-w-14 flex-b\"><button class=\"lh-10\"><img src='" + request.getContextPath()
						+ "/templates/public/images/icons/icon-close.png" + "'alt='CLOSE'  /></button></div></div>";
			}
			s += "</div></div><div class=\"flex-w flex-sb-m p-t-22 p-b-12\">" + "<span class=\"txt-m-103 cl3 p-r-20\">Tổng tiền:</span>"
					+ "<span class=\"txt-m-111 cl6\">$" + tongtien + " USD</span></div>"
					+ "<a class=\"flex-c-m size-a-8 bg10 txt-s-105 cl13 hov-btn2 trans-04\" href='" + request.getContextPath()
					+ "/cart'>Xem Giỏ Hàng</a>";

			out.print(s);

		}

	}
	
	
	@RequestMapping("cart")
	public String cart() {
		return "public.shop.cart";
	}
	
	@RequestMapping("checkout")
	public String checkout() {

		return "public.shop.checkout";
	}
	
	@RequestMapping("contact")
	public String contact() {

		return "public.shop.contact";
	}
	@RequestMapping(value = "/addContact", method = RequestMethod.POST)
	public String register(@ModelAttribute("objUser") Contact objUser, ModelMap modelMap, RedirectAttributes ra) {
		if (contactDao.addItem(objUser) > 0) {
			//gá»­i mail
			ra.addFlashAttribute("msg","Thông Tin Của Bạn Đã Được Gửi Đến Chúng Tôi ! Chúng Tôi Sẽ Liên Hệ Sớm Đến Bạn ! Xin Cảm Ơn !");
			return "redirect:/contact";
		} else {
			ra.addFlashAttribute("msg", "Gửi Không Thành Công...Xin Kiểm Tra Lại !");
			return "redirect:/contact";
		}
	}

	// LOGIN
	
	
	@RequestMapping(value = "/login-member", method = RequestMethod.GET)
	public String login() {
		return "redirect:/";
	}

	@RequestMapping(value = "/login-member", method = RequestMethod.POST)
	public String checklogin(@RequestParam("email") String email, @RequestParam("password") String password,
			HttpSession session, RedirectAttributes ra, ModelMap modelMap) {
		if (memberDao.checkLogin(email, password) != null) {
			Member userInfo = memberDao.checkLogin(email, password);
			session.setAttribute("userInfo", userInfo);
			
		} else {
			ra.addFlashAttribute("msg", "Sai Username Hoặc Password!");
			return "redirect:/";
		}
		return "redirect:/";
	}
	@RequestMapping(value = "/logout-member", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("userInfo");
		session.removeAttribute("listCart");
		return "redirect:/";
	}
	
	@RequestMapping("register")
	public String register() {
		return "public.shop.register";
	}
	
	@RequestMapping(value = "/addUser", method = RequestMethod.POST)
	public String register(@ModelAttribute("objUser") Member objUser, ModelMap modelMap, RedirectAttributes ra) {
		if (memberDao.check(objUser.getEmail()).size() > 0) {
			modelMap.addAttribute("objUser", objUser);
			return "public.shop.register";
		}
		if (memberDao.addItemMember(objUser) > 0) {
			//gá»­i mail
			sendMail.sendMail(objUser.getEmail(), "ĐĂNG KÝ TÀI KHOẢN THÀNH CÔNG", "\nBạn Đã Tạo Tài Khoản Thành Công ! XIN HÃY ĐĂNG NHẬP ĐỂ MUA HÀNG");	
			ra.addFlashAttribute("msg",
					"Đăng Ký Thành Công ! Tiếp Tục Mua Hàng Bằng Cách Đăng Nhập Tài Khoản ! Xin Cảm Ơn !");
			return "redirect:/register";
		} else {
			ra.addFlashAttribute("msg", "Đăng Ký Không Thành Công...Xin Kiểm Tra Lại !");
			return "redirect:/register";
		}
	}
	
	
	@RequestMapping("myaccount")
	public String myaccount() {
		return "public.shop.myaccount";
	}
	
	@RequestMapping("/{slug}-{id}.html")
	public String detail(@PathVariable("id") int id, ModelMap modelMap,HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		productDao.upViews(id);
		Product objNews = productDao.getItem(id);
		modelMap.addAttribute("objNews", productDao.getItem(id));
		modelMap.addAttribute("objCat", catDao.getItem(id));
		modelMap.addAttribute("listNewsTLQ", productDao.getTinLienQuan(id, objNews.getId_cat()));
		ArrayList<Comment> listComment= (ArrayList<Comment>) commentDao.getListCommenPublic(id);
		modelMap.addAttribute("listComment", listComment);
		modelMap.addAttribute("numberComment", commentDao.countNewPublicComment(id));
		return "public.shop.detail";
	}
	
	
	

	
	
	
	
	
}
