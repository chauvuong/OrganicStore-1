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

import constant.Defines;
import dao.CommentDao;
import dao.ContactDAO;
import dao.MemberDao;
import dao.RoleDao;
import dao.UserDao;
import entity.Comment;
import entity.Contact;
import entity.Member;
import entity.Product;
import entity.User;
import util.BCrypt;

@Controller
@RequestMapping("admin/comment")
public class AdminCommentController {
	@Autowired
	private CommentDao commentDao;
	@Autowired
	private Defines defines;

	@RequestMapping("")
	public String index(ModelMap modelMap) {
		modelMap.addAttribute("listComment", commentDao.getItemsAdmin());
		return "admin.comment.index";
	}

	@RequestMapping(value = "del/{id}")
	public String delItem(@PathVariable("id") int id, RedirectAttributes ra) {

		if (commentDao.getItem(id) == null) {
			ra.addFlashAttribute("msg", "ID Không Tồn Tại");
			return "redirect:/admin/contact";
		}
		if (commentDao.delItem(id) > 0) {
			ra.addFlashAttribute("msg", "Xóa Thành Công!");
		} else {
			ra.addFlashAttribute("msg", "Xóa Thất Bại!");
		}

		return "redirect:/admin/comment";
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public void comment(ModelMap modelMap, HttpSession session, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		int idNews = Integer.parseInt(request.getParameter("adid"));
		String name = request.getParameter("aname"); // lấy từ tên key a
		String email = request.getParameter("aemail");
		String content = request.getParameter("acontent");
		int rating = Integer.parseInt(request.getParameter("arating"));
		if(rating==0) {
			rating = 5;
		}
		Timestamp dateCreate = new Timestamp(new Date().getTime());
		Comment item = new Comment(0, "", name, email, content, rating, dateCreate, idNews);
		commentDao.addItem(item);
		ArrayList<Comment> listComment = (ArrayList<Comment>) commentDao.getListCommenPublic(idNews);
		String s ="";
		for (Comment objItem : listComment) {
				s +="<div><div class=\"flex-w flex-sb-t bo-b-1 bocl15 p-b-37\">"
					+ "<div class=\"wrap-pic-w size-w-56\">"
					+ "<img src='"+request.getContextPath()+"/templates/public/images/avatar-00.gif' width='100px' height='100px' alt='AVATAR' />"
					+ "</div>"
					+ "<div class=\"size-w-57 p-t-2\">"
					+ "	<div class=\"flex-w flex-sb-m p-b-8\">"
					+ "<div class=\"flex-w flex-b m-r-20 p-tb-5\">"
					+ "<span class=\"txt-m-103 cl6 m-r-20\">"+ objItem.getName() + "</span>"
					+ "<span class=\"txt-s-120 cl9\">" + objItem.getDate_create()+ " </span>"
					+ "</div>"
					+ "<span class=\"fs-16 cl11 lh-15 txt-center m-r-15 p-tb-5\">";
					for(int i =1; i <=objItem.getRating();i++) {
					s+="	<i class=\"fa fa-star m-rl-1\"} ></i> ";
					}
					for(int i =1; i <=5-objItem.getRating();i++) {
						s+="<i class=\"fa fa-star-o m-rl-1\"} ></i>";
					}
					s+="</span>"
					+ "</div>"
					+"<p class=\"txt-s-101 cl6\">"+ objItem.getContent() + "</p>" 
					+ "</div></div>";
					
		}
		out.print(s);

	}

}
