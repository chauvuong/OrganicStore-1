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
import dao.MemberDao;
import dao.RoleDao;
import dao.UserDao;
import entity.Member;
import entity.User;
import util.BCrypt;

@Controller
@RequestMapping("admin/member")
public class AdminMemberController {
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private RoleDao roleDao;
	@Autowired
	private Defines defines;

	@RequestMapping("")
	public String index(ModelMap modelMap, @RequestParam(value = "page", defaultValue = "1") int page) {
		//modelMap.addAttribute("alMember", memberDao.getItems());
		int current_page = 1;
		int sum = Defines.ROW_COUNT;
		int sumMember = memberDao.countItem();
		int sumPage = (int) Math.ceil((float) sumMember / sum);
		modelMap.addAttribute("sumPage", sumPage);
		if (page != 0) {
			current_page = page;
		}
		modelMap.addAttribute("sum", sum);
		modelMap.addAttribute("current_page", current_page);
		int offset = (current_page - 1) * sum;
		modelMap.addAttribute("alMember", memberDao.getItemsAdmin(offset));
		
		return "admin.member.index";
	}



	

	@RequestMapping(value = "del/{id}")
	public String delItem(@PathVariable("id") int id, RedirectAttributes ra) {

		if (memberDao.getItem(id) == null) {
			ra.addFlashAttribute("msg", "ID Không Tồn Tại");
			return "redirect:/admin/member";
		}
		if (memberDao.delItem(id) > 0) {
			ra.addFlashAttribute("msg", "Xóa Thành Công!");
		} else {
			ra.addFlashAttribute("msg", "Xóa Thất Bại!");
		}

		return "redirect:/admin/member";
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
		Member objMember = memberDao.getItem(id);
	
		if (imgTick.equals(img)) {
			objMember.setEnable(0);
			memberDao.editActive(objMember);
			out.print(htmlLock);
		} else {
			objMember.setEnable(1);
			memberDao.editActive(objMember);
			out.print(htmlTick);

		}
	}

}
