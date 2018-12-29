package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

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

import constant.Defines;
import dao.CatDao;
import dao.CommentDao;
import dao.ContactDAO;
import dao.DetailOrderDao;
import dao.MemberDao;
import dao.OrderDao;
import dao.PayDao;
import dao.ProductDao;
import entity.Comment;
import entity.Contact;
import entity.Member;
import entity.Order;
import entity.Product;
import util.SendMail;
import util.SlugUtil;
import util.StringUtil;

@Controller
@RequestMapping("")
public class PublicController {
	private ArrayList<Product> listCart = new ArrayList<>();

	private ArrayList<Product> wishList = new ArrayList<>();
	private ArrayList<Product> allProduct = new ArrayList<>();
	@Autowired
	private Defines defines;
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
	@Autowired
	private OrderDao orderDao;
	@Autowired
	private DetailOrderDao detailOrderDao;

	@ModelAttribute
	public void addCommon(ModelMap modelMap, HttpSession session) {
		modelMap.addAttribute("listCat", catDao.getItems());
		modelMap.addAttribute("stringUtil", stringUtil);
		modelMap.addAttribute("productDao", productDao);
		modelMap.addAttribute("catDao", catDao);
		modelMap.addAttribute("slugUtil", slugUtil);
		modelMap.addAttribute("alProduct", productDao.getItemsPublics());
		modelMap.addAttribute("alProductViews", productDao.getItemsViews());
		modelMap.addAttribute("listNews", productDao.getItemsPublicNew());

	}

	@RequestMapping("")
	public String index() {

		return "public.shop.index";

	}

	@RequestMapping(value = "/huy/{id}", method = RequestMethod.GET)
	public String huy(@PathVariable("id") int id, HttpSession session) {
		for (Product item : listCart) {
			if (id == item.getId_product()) {
				listCart.remove(item);
				break;
			}

		}
		return "redirect:/gio-hang";
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
			out.print("<span class=\"size-w-59 txt-m-104 cl6\"  id= \"tongtien\">" + money + "</span>"

			);

		}

	}

	@RequestMapping(value = "/gio-hang", method = RequestMethod.GET)
	public String themvaogiohang() {
		return "public.shop.cart";
	}

	@RequestMapping(value = "/upsize", method = RequestMethod.POST)
	public void upsize(HttpServletRequest request, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		String s = "	<div class=\"icon-header-item flex-c-m trans-04 icon-header-noti\" data-notify=\""
				+ listCart.size() + "\">\r\n" + "			<img src=\"" + request.getContextPath()
				+ "/templates/public/images/icons/icon-cart-2.png\" alt=\"CART\">\r\n" + "	</div>";
		out.print(s);
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
				s += "<div class=\"flex-w flex-str m-b-25\">"
						+ "<div class=\"size-w-15 flex-w flex-t\"><a href='' class=\"wrap-pic-w bo-all-1 bocl12 size-w-16 hov3 trans-04 m-r-14\"> "
						+ "<img width='77px' height='64.33px' src='" + request.getContextPath() + "/files/"
						+ obj.getPicture() + "' /></a>" + "<div class=\"size-w-17 flex-col-l\">" + "<a href='"
						+ request.getContextPath() + "/san-pham/" + SlugUtil.createSlug(obj.getName()) + "-"
						+ obj.getId_product() + ".html'>" + obj.getName() + "</a>" + "<span class=\"txt-s-101 cl9\">$"
						+ obj.getPrice() + "</span>" + "<span class=\"txt-s-109 cl12\">" + obj.getQuatity() + "</span>"
						+ "</div></div><div class=\"size-w-14 flex-b\"><button class=\"lh-10\"><a href='"
						+ request.getContextPath() + "/huy/" + obj.getId_product() + "  '><img src='"
						+ request.getContextPath() + "/templates/public/images/icons/icon-close.png"
						+ "'alt='CLOSE'  /></a></button></div></div>";
			}
			s += "</div></div><div class=\"flex-w flex-sb-m p-t-22 p-b-12\">"
					+ "<span class=\"txt-m-103 cl3 p-r-20\">Tổng tiền:</span>" + "<span class=\"txt-m-111 cl6\">$"
					+ tongtien + " USD</span></div>"
					+ "<a class=\"flex-c-m size-a-8 bg10 txt-s-105 cl13 hov-btn2 trans-04\" href='"
					+ request.getContextPath() + "/gio-hang'>Xem Giỏ Hàng</a><br />"
					+ "<a class=\"flex-c-m size-a-8 bg10 txt-s-105 cl13 hov-btn2 trans-04\" href='"
					+ request.getContextPath() + "/thanh-toan'>Thanh Toán</a>";

			out.print(s);

		}

	}

	@RequestMapping("thong-tin-cua-toi")
	public String myaccount(HttpServletRequest request, HttpSession session) {
		Member mem = (Member) session.getAttribute("userInfo");
		if (session.getAttribute("userInfo") == null) {
			return "redirect:/";
		} else {
			List<Order> listOrder = orderDao.getItemByMemId(mem.getId_member());
			request.setAttribute("orderList", listOrder);
			return "public.shop.myaccount";
		}
	}

	@RequestMapping(value = "/thong-tin-cua-toi/chi-tiet-don-hang/{id}/{uid}", method = RequestMethod.GET)
	public String detailOrder(@PathVariable("id") int id, @PathVariable("uid") int uid, ModelMap modelMap,
			HttpSession session) {
		Member member = (Member) session.getAttribute("userInfo");

		if (session.getAttribute("userInfo") == null) {
			return "redirect:/";
		} else {
			if (uid != member.getId_member()) {
				return "public.shop.404";
			}
			modelMap.addAttribute("listDetail", detailOrderDao.getItemsPublic(id, uid));

		}
		return "public.shop.myorder";
	}

	@RequestMapping(value = "thay-doi-thong-tin-ca-nhan/{id}", method = RequestMethod.POST)
	public String medit(@PathVariable("id") int id, ModelMap modelMap, HttpSession session, HttpServletRequest request,
			RedirectAttributes ra, HttpServletResponse response) throws IOException {
		Member mem = memberDao.getItem(id);
		if (mem == null) {
			ra.addFlashAttribute("msg", "ID Không Tồn Tại");
			return "redirect:/thong-tin-cua-toi";
		}
		mem.setFullname(request.getParameter("fullname"));
		//mem.setEmail(request.getParameter("email"));
		mem.setAddress(request.getParameter("address"));
		mem.setPhone(request.getParameter("phone"));
		memberDao.editItem(mem);
		session.setAttribute("userInfo", mem);
		ra.addFlashAttribute("msg", "Cập Nhật Thông Tin Thành Công!");
		return "redirect:/thong-tin-cua-toi";
	}

	@RequestMapping(value = "/thay-doi-mat-khau/{id}", method = RequestMethod.POST)
	public String passchange(@PathVariable("id") int id, ModelMap modelMap, HttpSession session,
			HttpServletRequest request, RedirectAttributes ra, HttpServletResponse response) throws IOException {
		Member mem = memberDao.getItem(id);
		if (mem == null) {
			ra.addFlashAttribute("msg", "ID Không Tồn Tại");
			return "redirect:/thong-tin-cua-toi";
		}
		String cp = request.getParameter("current-pw");
		if (mem.getPassword().equals(stringUtil.md5(cp))) {
			String np = request.getParameter("new-pw");
			mem.setPassword(stringUtil.md5(np));
			memberDao.editItem(mem);
			// System.out.println("Thành công!");
			ra.addFlashAttribute("msg", "Cập Nhật Mật Khẩu Thành Công!");
			return "redirect:/thong-tin-cua-toi";
		} else {
			// System.out.println("không thành công!");
			ra.addFlashAttribute("msg", "Cập Nhật Thất Bại!");
			return "redirect:/thong-tin-cua-toi";
		}
	}

	@RequestMapping("thanh-toan")
	public String checkout(ModelMap modelMap, HttpSession session) {
		modelMap.addAttribute("alPay", payDao.getItems());
		return "public.shop.checkout";
	}

	@RequestMapping("lien-he")
	public String contact() {

		return "public.shop.contact";
	}

	@RequestMapping(value = "/addContact", method = RequestMethod.POST)
	public String register(@ModelAttribute("objUser") Contact objUser, ModelMap modelMap, RedirectAttributes ra) {
		if (contactDao.addItem(objUser) > 0) {
			// gá»­i mail
			ra.addFlashAttribute("msg",
					"Thông Tin Của Bạn Đã Được Gửi Đến Chúng Tôi ! Chúng Tôi Sẽ Liên Hệ Sớm Đến Bạn ! Xin Cảm Ơn !");
			return "redirect:/lien-he";
		} else {
			ra.addFlashAttribute("msg", "Gửi Không Thành Công...Xin Kiểm Tra Lại !");
			return "redirect:/lien-he";
		}
	}

	// LOGIN

	/*
	 * @RequestMapping(value = "/login-member", method = RequestMethod.GET) public
	 * String login() { return "redirect:/"; }
	 */

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

	@RequestMapping("/dang-ky-tai-khoan")
	public String register(HttpSession session) {

		if (session.getAttribute("userInfo") != null) {
			return "redirect:/";
		} else {
			return "public.shop.register";
		}
	}

	@RequestMapping(value = "/addUser", method = RequestMethod.POST)
	public String register(@ModelAttribute("objUser") Member objUser, ModelMap modelMap, RedirectAttributes ra) {
		if (memberDao.checkItem(objUser))
			if (memberDao.addItemMember(objUser) > 0) {
				// gá»­i mail
				sendMail.sendMail(objUser.getEmail(), "YOU HAVE REGISTERED SUCCESS",
						"\nYOU HAVE REGISTERED SUCCESS" + "\nEmail: " + objUser.getEmail() + "" + "\nPassword: "
								+ objUser.getPassword() + "\n SIGN IN TO BUY");
				ra.addFlashAttribute("msg",
						"Đăng Ký Thành Công ! Tiếp Tục Mua Hàng Bằng Cách Đăng Nhập Tài Khoản ! Xin Cảm Ơn !");
				return "redirect:/dang-ky-tai-khoan";
			} else {
				ra.addFlashAttribute("msg", "Đăng Ký Không Thành Công...Xin Kiểm Tra Lại !");

			}
		return "redirect:/dang-ky-tai-khoan?msg=add";

	}

	@RequestMapping("/san-pham/{slug}-{id}.html")
	public String detail(@PathVariable("id") String ids, ModelMap modelMap, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		int id = 0;
		try {
			id = Integer.parseInt(ids);
		} catch (NumberFormatException e) {
			return "redirect:/404";
		}

		int numRating = productDao.getItem(id).getRating();
		System.out.println(numRating);
		modelMap.addAttribute("numRating", numRating);

		productDao.upViews(id);
		Product objNews = productDao.getItem(id);
		modelMap.addAttribute("objNews", productDao.getItem(id));
		modelMap.addAttribute("objCat", catDao.getItem(id));
		modelMap.addAttribute("listNewsTLQ", productDao.getTinLienQuan(id, objNews.getId_cat()));
		ArrayList<Comment> listComment = (ArrayList<Comment>) commentDao.getListCommenPublic(id);
		modelMap.addAttribute("listComment", listComment);
		modelMap.addAttribute("numberComment", commentDao.countNewPublicComment(id));
		return "public.shop.detail";
	}
	// THANH TOÁN

	@RequestMapping(value = "/xac-nhan-don-hang", method = RequestMethod.GET)
	public String cofirm(HttpSession session) {
		if (session.getAttribute("listCart") == null) {
			return "redirect:/";
		} else {
			return "public.shop.confirm";
		}
	}

	@RequestMapping(value = "/xac-nhan-don-hang", method = RequestMethod.POST)
	public String cofirm(@ModelAttribute("objItem") Order objItem, @RequestParam("pay") String pay, HttpSession session,
			ModelMap modelMap) {
		session.setAttribute("setInfo", objItem);
		Order setInfo = (Order) session.getAttribute("setInfo");
		int id_thanhtoan = Integer.parseInt(pay);
		setInfo.setId_pay(id_thanhtoan);
		setInfo.setPay(payDao.getItem(id_thanhtoan).getName());
		session.setAttribute("setInfo", setInfo);
		return "public.shop.confirm";
	}

	@RequestMapping(value = "/thanh-toan-hoan-tat", method = RequestMethod.POST)
	public String pay(HttpSession session, ModelMap modelMap, HttpServletRequest request) {
		if (session.getAttribute("listCart") != null) {

			Order setInfo = (Order) session.getAttribute("setInfo");
			Member member = (Member) session.getAttribute("userInfo");
			// setInfo.setId_member(member.getId_member());

			Date today = new Date(System.currentTimeMillis());
			SimpleDateFormat timeFormat = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss");
			String time = timeFormat.format(today.getTime());
			setInfo.setDate_create(time);
			orderDao.addItem(setInfo);
			int id_order = orderDao.getItemDATE(time).getId_order();
			int tongtien = 0;
			for (Product obj : listCart) {
				tongtien = (tongtien + obj.getPrice() * obj.getQuatity() * 22000);
				detailOrderDao.addItem(obj, id_order);
			}

			if (setInfo.getId_pay() == 1) {
				// ngân lượng
				modelMap.addAttribute("tongtien", tongtien);
				modelMap.addAttribute("id_order", setInfo.getId_order());
				modelMap.addAttribute("note", setInfo.getNote());
				sendMail.sendMail(setInfo.getEmail(), "ORDER SUCCESS", "\nYOUR ORDER" + "\nPAY: " + setInfo.getPay()
						+ "\r\n" + "\nTOTAL MONEY :" + tongtien + "\n THANK YOU");
				listCart.clear();
				session.removeAttribute("setInfo");
				session.removeAttribute("listCart");
				return "public.shop.paysuccess1";
			} else if (setInfo.getId_pay() == 3) {
				// thanh toán paypal
				modelMap.addAttribute("tongtien", tongtien);
				modelMap.addAttribute("id_donhang", setInfo.getId_order());
				sendMail.sendMail(setInfo.getEmail(), "ORDER SUCCESS", "\nYOUR ORDER\n" + "\nPAY: " + setInfo.getPay()
						+ "\r\n" + "\nTOTAL MONEY" + tongtien + "\n THANK YOU");
				listCart.clear();
				session.removeAttribute("setInfo");
				session.removeAttribute("listCart");
				return "public.shop.paysuccess3";
			} else {
				sendMail.sendMail(setInfo.getEmail(), "ORDER SUCCESS", "\nYOUR ORDER" + "\nPAY: " + setInfo.getPay()
						+ "\r\n" + "\nTOTAL MONEY" + tongtien + "\n THANK YOU");
				listCart.clear();
				session.removeAttribute("setInfo");
				session.removeAttribute("listCart");
				return "public.shop.paysuccess";
			}
		} else {
			return "public.shop.confirm";
		}
	}

	@RequestMapping(value = "/hoan-tat-thanh-toan", method = RequestMethod.POST)
	public String payUser(HttpSession session, ModelMap modelMap, HttpServletRequest request) {
		if (session.getAttribute("listCart") != null) {

			Order setInfo = (Order) session.getAttribute("setInfo");
			Member member = (Member) session.getAttribute("userInfo");
			setInfo.setId_member(member.getId_member());

			Date today = new Date(System.currentTimeMillis());
			SimpleDateFormat timeFormat = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss");
			String time = timeFormat.format(today.getTime());
			setInfo.setDate_create(time);
			orderDao.addItem(setInfo);
			int id_order = orderDao.getItemDATE(time).getId_order();
			int tongtien = 0;
			for (Product obj : listCart) {
				tongtien = (tongtien + obj.getPrice() * obj.getQuatity() * 22000);
				detailOrderDao.addItem(obj, id_order);
			}

			if (setInfo.getId_pay() == 1) {
				// ngân lượng
				modelMap.addAttribute("tongtien", tongtien);
				modelMap.addAttribute("id_order", setInfo.getId_order());
				modelMap.addAttribute("note", setInfo.getNote());
				sendMail.sendMail(setInfo.getEmail(), "ORDER SUCCESS", "\nYOUR ORDER:" + "\nPAY: " + setInfo.getPay()
						+ "\r\n" + "\nTOTAL MONEY" + tongtien + "\n THANK YOU");
				listCart.clear();
				session.removeAttribute("setInfo");
				session.removeAttribute("listCart");
				return "public.shop.paysuccess1";
			} else if (setInfo.getId_pay() == 3) {
				// thanh toán paypal
				modelMap.addAttribute("tongtien", tongtien);
				modelMap.addAttribute("id_donhang", setInfo.getId_order());
				sendMail.sendMail(setInfo.getEmail(), "ORDER SUCCESS", "\nYOUR ORDER\n" + "\nPAY: " + setInfo.getPay()
						+ "\r\n" + "\nTOTAL MONEY" + tongtien + "\n THANK YOU");
				listCart.clear();
				session.removeAttribute("setInfo");
				session.removeAttribute("listCart");
				return "public.shop.paysuccess3";
			} else {
				sendMail.sendMail(setInfo.getEmail(), "ORDER SUCCESS", "\nYOUR ORDER" + "\nPAY: " + setInfo.getPay()
						+ "\r\n" + "/nTOTAL MONEY" + tongtien + "\n THANK YOU");
				listCart.clear();
				session.removeAttribute("setInfo");
				session.removeAttribute("listCart");
				return "public.shop.paysuccess";
			}
		} else {
			return "public.shop.confirm";
		}
	}

	// comment

	@RequestMapping(value = "/addComment", method = RequestMethod.POST)
	public void comment(ModelMap modelMap, HttpSession session, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		int idNews = Integer.parseInt(request.getParameter("adid"));
		String name = request.getParameter("aname"); // lấy từ tên key a
		String email = request.getParameter("aemail");
		String content = request.getParameter("acontent");
		int rating = Integer.parseInt(request.getParameter("arating"));
		if (rating == 0) {
			rating = 5;
		}
		System.out.println("rating : " + rating);
		Timestamp dateCreate = new Timestamp(new Date().getTime());
		int itemrating = productDao.getItemsRating(idNews);
		int sumrating = productDao.sumRating(idNews);
		float tu = (itemrating * sumrating) + rating;
		float mau = sumrating + 1;
		System.out.println("sumrating : " + sumrating);
		System.out.println("ahahas : " + Math.round(4.2));
		System.out.println("tu : " + tu);
		System.out.println("mau : " + mau);
		System.out.println("ahahas1 : " + (float) (tu / mau));
		int newrating = Math.round((float) (tu / mau));

		System.out.println("newrating : " + newrating);
		productDao.editRating(idNews, newrating);
		Comment item = new Comment(0, "", name, email, content, rating, dateCreate, idNews);
		commentDao.addItem(item);
		ArrayList<Comment> listComment = (ArrayList<Comment>) commentDao.getListCommenPublic(idNews);
		String s = "";
		for (Comment objItem : listComment) {
			s += "<div><div class=\"flex-w flex-sb-t bo-b-1 bocl15 p-b-37\">" + "<div class=\"wrap-pic-w size-w-56\">"
					+ "<img src='" + request.getContextPath()
					+ "/templates/public/images/avatar-00.gif' width='100px' height='100px' alt='AVATAR' />" + "</div>"
					+ "<div class=\"size-w-57 p-t-2\">" + "	<div class=\"flex-w flex-sb-m p-b-8\">"
					+ "<div class=\"flex-w flex-b m-r-20 p-tb-5\">" + "<span class=\"txt-m-103 cl6 m-r-20\">"
					+ objItem.getName() + "</span>" + "<span class=\"txt-s-120 cl9\">" + objItem.getDate_create()
					+ " </span>" + "</div>" + "<span class=\"fs-16 cl11 lh-15 txt-center m-r-15 p-tb-5\">";
			for (int i = 1; i <= objItem.getRating(); i++) {
				s += "	<i class=\"fa fa-star m-rl-1\"} ></i> ";
			}
			for (int i = 1; i <= 5 - objItem.getRating(); i++) {
				s += "<i class=\"fa fa-star-o m-rl-1\"} ></i>";
			}
			s += "</span>" + "</div>" + "<p class=\"txt-s-101 cl6\">" + objItem.getContent() + "</p>" + "</div></div>";

		}
		out.print(s);

	}

	// QUAN
	@RequestMapping("danh-muc/{id}")
	public String product(@PathVariable("id") String ids, HttpServletRequest request) {
		int id = 0;
		try {
			id = Integer.parseInt(ids);
		} catch (NumberFormatException e) {
			return "redirect:/404";
		}
		allProduct = (ArrayList<Product>) productDao.getItemsPublics();
		for (Product product : allProduct) {
			// System.out.println(product.getName()+"-"+product.getId_cat());
		}
		request.setAttribute("tempCat", id);
		return "public.shop.product";
	}

	@RequestMapping("san-pham-yeu-thich")
	public String wishlist(HttpServletRequest request, HttpSession session) {
		if (session.getAttribute("userInfo") == null) {
			return "redirect:/";
		} else {
			return "public.shop.wishlist";
		}
	}

	// QUAN
	// QUAN
	@RequestMapping(value = "/delwish", method = RequestMethod.POST)
	public void dell(ModelMap modelMap, HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		PrintWriter out = response.getWriter();
		int id = Integer.parseInt(request.getParameter("aid_sp"));
		for (Product product : wishList) {
			if (product.getId_product() == id) {
				wishList.remove(product);
				break;
			}
		}
		session.setAttribute("wishList", wishList);
		String s = "				<tr class=\"table_head bg12\">\r\n"
				+ "					<th class=\"column-1 p-l-30\">Tên sản phẩm</th>\r\n"
				+ "					<th class=\"column-2\">Giá</th>\r\n"
				+ "					<th class=\"column-3\">Tình trạng</th>\r\n"
				+ "					<th class=\"column-4\">Thêm vào giỏ</th>\r\n" + "				</tr>";
		for (Product obj : wishList) {
			s += "					<tr class=\"table_row\">\r\n" + "						<td class=\"column-1\">\r\n"
					+ "							<div class=\"flex-w flex-m\">\r\n"
					+ "								<div class=\"wrap-pic-w size-w-50 bo-all-1 bocl12 m-r-30\">\r\n"
					+ "									<img\r\n"
					+ "												src='" + request.getContextPath() + "/files/"
					+ obj.getPicture() + "'" + "										alt=\"IMG\">\r\n"
					+ "								</div>\r\n" + "\r\n" + "							"
					+ obj.getName() + " </a> <span\r\n" + "							</div>\r\n"
					+ "						</td>\r\n" + "						<td class=\"column-2\">"
					+ obj.getPrice() + "</td>\r\n" + "						<td class=\"column-3\">\r\n"
					+ "							<div class=\"flex-t\">\r\n"
					+ "								<img class=\"m-t-4 m-r-8\"\r\n"
					+ "									src='" + request.getContextPath()
					+ "/templates/public/images/icons/icon-list3.png'"
					+ "									alt=\"IMG\"> <span class=\"size-w-53 txt-m-104 cl6\">\r\n"
					+ "									Còn hàng </span>\r\n" + "							</div>\r\n"
					+ "						</td>\r\n" + "						<td class=\"column-4\">\r\n"
					+ "							<div class=\"flex-w flex-sb-m\">\r\n"
					+ "								<a href=\"javascript:void(0)\"\r\n"
					+ "									onclick='addCart(" + obj.getId_product() + ")'"
					+ "									class=\"flex-c-m txt-s-103 cl6 size-a-2 how-btn1 bo-all-1 bocl11 hov-btn1 trans-04\">\r\n"
					+ "									Thêm vào giỏ <span class=\"lnr lnr-chevron-right m-l-7\"></span>\r\n"
					+ "									<span class=\"lnr lnr-chevron-right\"></span>\r\n"
					+ "								</a>\r\n" + "\r\n"
					+ "								<div class=\"fs-15 hov-cl10 pointer\">\r\n"
					+ "									<a href=\"javascript:void(0)\"\r\n"
					+ "										onclick='del(" + obj.getId_product() + ")'><span\r\n"
					+ "										class=\"lnr lnr-cross\"></span></a>\r\n"
					+ "								</div>\r\n" + "							</div>\r\n"
					+ "						</td>\r\n" + "					</tr>";
		}
		out.print(s);
	}

	@RequestMapping(value = "/dellAll", method = RequestMethod.POST)
	public void dellAll(ModelMap modelMap, HttpSession session, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		wishList.clear();
		session.setAttribute("wishList", wishList);
	}

	@RequestMapping(value = "/addWish", method = RequestMethod.POST)
	public void addWish(ModelMap modelMap, HttpSession session, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		// System.out.println(id);
		Product itemProduct = productDao.getItem(id);
		session.setAttribute("wishList", wishList);
		wishList.add(itemProduct);
	}

	public ArrayList<Product> singlefilter(ArrayList<Product> list, String condition) { /// chỉnh sửa (thêm if else)
		if (condition.length() > 2) {
			ArrayList<Product> temp = new ArrayList<>();
			String[] con = condition.split("-");
			switch (con[0]) {
			case "s":
				for (Product item : list) {
					if (item.getName().contains(con[1]))
						temp.add(item);
				}
				break;
			case "c":
				for (Product item : list) {
					if (item.getId_cat() == Integer.parseInt(con[1])) {
						temp.add(item);
					}
				}
				break;
			case "p":
				char[] pc = condition.toCharArray();
				for (Product item : list) {
					boolean ok = false;
					for (char c : pc) {
						switch (c) {
						case '1':
							if (item.getPrice() < 5)
								ok = true;
							break;
						case '2':
							if (item.getPrice() >= 5 && item.getPrice() < 10)
								ok = true;
							break;
						case '3':
							if (item.getPrice() >= 10 && item.getPrice() < 20)
								ok = true;
							break;
						case '4':
							if (item.getPrice() > 20)
								ok = true;
							break;
						}
					}
					if (ok)
						temp.add(item);
				}
				break;
			case "r":
				for (Product item : list) {
					if (item.getRating() >= Integer.parseInt(con[1]))
						temp.add(item);
				}
				break;
			default:
				if (temp.isEmpty())
					temp.addAll(list);
				switch (con[1]) {
				case "2":
					Comparator<Product> compareDown = new Comparator<Product>() {

						@Override
						public int compare(Product p1, Product p2) {
							return p1.getPrice() - p2.getPrice();
						}
					};
					Collections.sort(temp, compareDown);
					break;
				case "3":
					Comparator<Product> compareUp = new Comparator<Product>() {

						@Override
						public int compare(Product p1, Product p2) {
							return p2.getPrice() - p1.getPrice();
						}
					};
					Collections.sort(temp, compareUp);
					break;
				default:
					break;
				}
				break;
			}
			return temp;
		} else
			return list;
	}

	@RequestMapping(value = "/checkemail", method = RequestMethod.POST)
	public void checkemail(@ModelAttribute("objUser") Member objUser, PrintWriter out, ModelMap modelMap) {
		int data = 1;
		if (memberDao.checkItem(objUser)) {
			out.print(data);
		}
	}

	@RequestMapping(value = "/filter", method = RequestMethod.POST)
	public void filter(ModelMap modelMap, HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		PrintWriter out = response.getWriter();
		ArrayList<Product> FilterProduct = new ArrayList<>();
		FilterProduct.addAll(allProduct);
		String filter = request.getParameter("filter");
		filter = filter.substring(0, filter.length() - 1); // cắt dấu @ ở cuối chuỗi đi
		if (filter.contains("@")) {
			String[] condition = filter.split("@");
			for (String string : condition) {

				FilterProduct = singlefilter(FilterProduct, string);
			}
		} else {
			FilterProduct = singlefilter(allProduct, filter);
		}
		String s = "<div class=\"row\">";
		for (Product obj : FilterProduct) {
			s += "								<div class=\"col-sm-6 col-lg-4 p-b-30\" >\r\n"
					+ "									<!-- Block1 -->\r\n"
					+ "									<div class=\"block1\">\r\n"
					+ "										<div\r\n"
					+ "											class=\"block1-bg wrap-pic-w bo-all-1 bocl12 hov3 trans-04\">\r\n"
					+ "											<img\r\n"
					+ "												src='" + request.getContextPath() + "/files/"
					+ obj.getPicture() + "'" + "												alt=\"IMG\">\r\n"
					+ "\r\n"
					+ "											<div class=\"block1-content flex-col-c-m p-b-46\">\r\n"
					+ "												<a href=\"javascript:void(0)\"\r\n"
					+ "													class=\"txt-m-103 cl3 txt-center hov-cl10 trans-04 js-name-b1\">\r\n"
					+ "													" + obj.getName() + " </a> <span\r\n"
					+ "													class=\"block1-content-more txt-m-104 cl9 p-t-21 trans-04\">\r\n"
					+ "													" + obj.getPrice() + "$ </span>\r\n" + "\r\n"
					+ "												<div class=\"block1-wrap-icon flex-c-m flex-w trans-05\">\r\n"
					+ "													<a href='\"+ request.getContextPath() +\"/san-pham/\"+SlugUtil.createSlug(obj.getName())+\"-\"+obj.getId_product()+\".html'\r\n"
					+ "														class=\"block1-icon flex-c-m wrap-pic-max-w\"> <img\r\n"
					+ "														src='" + request.getContextPath()
					+ "/templates/public/images/icons/icon-view.png'"
					+ "														alt=\"ICON\">\r\n"
					+ "													</a> <a href=\"javascript:void(0)\" onclick=\"sanpham("
					+ obj.getId_product() + ")\"\r\n"
					+ "														class=\"block1-icon flex-c-m wrap-pic-max-w js-addcart-b1\">\r\n"
					+ "														<img\r\n"
					+ "														src='" + request.getContextPath()
					+ "/templates/public/images/icons/icon-cart.png'"
					+ "														alt=\"ICON\">\r\n"
					+ "													</a> <a href=\"javascript:void(0)\"\r\n"
					+ "														class=\"block1-icon flex-c-m wrap-pic-max-w js-addwish-b1\">\r\n"
					+ "														<img class=\"icon-addwish-b1\"\r\n"
					+ "onclick=\"addWish(" + obj.getId_product() + ")\""
					+ "														src='" + request.getContextPath()
					+ "/templates/public/images/icons/icon-heart.png'"
					+ "														alt=\"ICON\"> <img class=\"icon-addedwish-b1\"\r\n"
					+ "														src='" + request.getContextPath()
					+ "/templates/public/images/icons/icon-heart2.png'"
					+ "														alt=\"ICON\">\r\n"
					+ "													</a>\r\n"
					+ "												</div>\r\n"
					+ "											</div>\r\n"
					+ "										</div>\r\n" + "</div>\r\n"
					+ "								</div>";
		}
		s += "</div>";
		out.print(s);
	}
	// QUAN
}
