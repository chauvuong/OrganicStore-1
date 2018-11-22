package controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import constant.Defines;
import dao.CatDao;

import dao.ProductDao;
import entity.Product;
import util.StringUtil;

@Controller
@RequestMapping("admin/product")
public class AdminProductController {
	@Autowired
	private ProductDao productDao;
	@Autowired
	private Defines defines;
	@Autowired
	private CatDao catDao;


	@ModelAttribute
	public void addCommon(ModelMap modelMap) {
		modelMap.addAttribute("alCat", catDao.getItems());

	}

	@RequestMapping("")
	public String index(ModelMap modelMap, @RequestParam(value = "page", defaultValue = "1") int page) {
		int current_page = 1;
		int sum = Defines.ROW_COUNT;
		int sumNews = productDao.countItem();
		int sumPage = (int) Math.ceil((float) sumNews / sum);
		modelMap.addAttribute("sumPage", sumPage);
		if (page != 0) {
			current_page = page;
		}
		modelMap.addAttribute("sum", sum);
		modelMap.addAttribute("current_page", current_page);
		int offset = (current_page - 1) * sum;
		modelMap.addAttribute("alProduct", productDao.getItemsAdmin(offset));
		return "admin.product.index";
	}

	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String add() {
		return "admin.product.add";
	}

	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String add( @ModelAttribute("obj") Product obj, ModelMap modelMap,
			@RequestParam("hinhanh") CommonsMultipartFile cmf, HttpServletRequest request, RedirectAttributes ra) {
		
		// xu ly upload file
		String filename = cmf.getOriginalFilename();
		// Ä‘á»•i tÃªn file
		if (!filename.isEmpty()) {
			
			// Tao duong dan den Web-content---Ä‘Æ°á»�ng dáº«n thá»±c cá»§a dá»± Ã¡n
			String appPath = request.getServletContext().getRealPath("");
			String dirPath = appPath + File.separator + Defines.DIR_UPLOAD;
			
			File saveDir = new File(dirPath);
			if (!saveDir.exists()) {
				// náº¿u file ko ton tai thi tao
				saveDir.mkdir();
			}
			// Ä�Æ°á»�ng dáº«n file
			String refilename = "";
			File file = null;
			if (!"".equals(filename)) {
				refilename = StringUtil.rename(filename);
				// ghi file Ä‘Ã£ Ä‘á»•i tÃªn database
				String filePath = dirPath + File.separator + refilename;
				file = new File(filePath);
				obj.setPicture(refilename);
			} else {
				String filePath = dirPath + File.separator + filename;
				file = new File(filePath);
				obj.setPicture(filename);
			}
			if (productDao.addItem(obj) > 0) {
				// upload file
				try {
					cmf.transferTo(file);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}

			ra.addFlashAttribute("msg", "Thêm Thành Công!");
			return "redirect:/admin/product";

		} else {
			ra.addFlashAttribute("msg", "Có Lỗi Khi Thêm!");
			return "redirect:/admin/product";
		}
	}

	@RequestMapping("edit/{id}")
	public String editItem(@PathVariable("id") int id, ModelMap modelMap, RedirectAttributes ra) {
		Product objNews = productDao.getItem(id);
		
		if (productDao.getItem(id) == null) {
			ra.addFlashAttribute("msg", "ID Không Tồn Tại");

			return "redirect:/admin/product";
		}
		modelMap.addAttribute("objProduct", productDao.getItem(id));
		return "admin.product.edit";

	}

	@RequestMapping(value = "edit/{id}", method = RequestMethod.POST)
	public String edit(@ModelAttribute("obj") Product obj, @PathVariable("id") int id,
			@RequestParam("hinhanh") CommonsMultipartFile cmf, HttpServletRequest request, RedirectAttributes ra,
			ModelMap modelMap) {
		obj.setId_product(id);
		
		// xu ly upload file
		String filename = cmf.getOriginalFilename();
		

		// Ä‘á»•i tÃªn file
		// String renamFile = StringUtil.rename(filename);

		// Tao duong dan den Web-content
		String appPath = request.getServletContext().getRealPath("");
		String dirPath = appPath + File.separator + Defines.DIR_UPLOAD;
		// String dirPath = appPath + File.separator + "files";
		System.out.println("dirPath: " + dirPath);
		File saveDir = new File(dirPath);
		if (!saveDir.exists()) {
			// náº¿u file ko ton tai thi tao
			saveDir.mkdir();
		}
		String filePath = dirPath + File.separator + filename;
		File file = new File(filePath);
		Timestamp date_create = new Timestamp(new Date().getTime());
		// obj.setPicture(renamFile);
		obj.setDate_create(date_create);

		// K.tra cÃ³ up file ko
		String refilename = "";
		if (!"".equals(filename)) {
			if (!"".equals(productDao.getItem(id).getPicture())) {
				String urlFileDel = dirPath + File.separator + productDao.getItem(id).getPicture();
				File delFile = new File(urlFileDel);
				delFile.delete();
			}
			refilename = StringUtil.rename(filename);
			// ghi file Ä‘Ã£ Ä‘á»•i tÃªn database
			filePath = dirPath + File.separator + refilename;
			// sá»­a thÃ nh cÃ´ng
			file = new File(filePath);
			obj.setPicture(refilename);

		} else {
			refilename = productDao.getItem(id).getPicture();
			obj.setPicture(refilename);
		}

		// LÆ°u tin Ä‘Ã£ sá»­a
		if (productDao.editItem(obj) > 0) {

			try {
				cmf.transferTo(file);
			} catch (IOException e) {
				e.printStackTrace();
			}
			ra.addFlashAttribute("msg", "Sửa Thành Công!");
			return "redirect:/admin/product";

		} else {
			ra.addFlashAttribute("msg", "Có Lỗi Khi Sửa!");
			return "redirect:/admin/product";
		}
	}

	@RequestMapping("del/{id}")
	public String delItem(@PathVariable("id") int id, RedirectAttributes ra) {
		
		
		if (productDao.getItem(id) == null) {
			ra.addFlashAttribute("msg", "ID Không Tồn Tại");
			return "redirect:/admin/product";
		}
		if (productDao.delItem(id) > 0) {
			ra.addFlashAttribute("msg", "Xóa Thành Công");
		} else {
			ra.addFlashAttribute("msg", "Xóa Thất Bại");
		}
		return "redirect:/admin/product";
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
		Product objProduct = productDao.getItem(id);
		if (imgTick.equals(img)) {
			objProduct.setActive(0);
			productDao.editActive(objProduct);
			out.print(htmlLock);
		
		} else {
			objProduct.setActive(1);
			;
			productDao.editActive(objProduct);
			out.print(htmlTick);

		}
	}

	@RequestMapping(value = "dels", method = RequestMethod.POST)
	public String delItems(HttpServletRequest request, RedirectAttributes ra) {
		String[] selected = request.getParameterValues("selected");
		if (selected == null) {
			return "redirect:/admin/product";
		} else {
			int dem = 0;
			for (String string : selected) {
				int id = Integer.parseInt(string);
				if (productDao.delItem(id) > 0) {
					dem++;
				}
			}

			if (dem == selected.length) {
				ra.addFlashAttribute("msg", "Xóa " + dem + " Sản Phẩm Thành Công");
				return "redirect:/admin/product";
			} else {
				ra.addFlashAttribute("msg", "Có Lỗi Khi Xóa");
				return "redirect:/admin/product";
			}
		}

	}

	@RequestMapping(value = "search", method = RequestMethod.GET)
	public String search() {
		return "admin.product.search";
	}

	@RequestMapping(value = "search", method = RequestMethod.POST)
	public String search(@RequestParam("name") String name, @ModelAttribute("objSearch") Product objSearch,
			ModelMap modelMap, @RequestParam(value = "page", defaultValue = "1") int page) {
		
		int current_page = 1;
		int sum = Defines.ROW_COUNT;

		int sumNews = productDao.countItem();
		int sumPage = (int) Math.ceil((float) sumNews / sum);
		modelMap.addAttribute("sumPage", sumPage);
		if (page != 0) {
			current_page = page;
		}
		modelMap.addAttribute("sum", sum);
		modelMap.addAttribute("current_page", current_page);
		int offset = (current_page - 1) * sum;

		modelMap.addAttribute("listProduct", productDao.getItemsSearchs(objSearch));
		modelMap.addAttribute("objSearch", objSearch);
		return "admin.product.search";
	}

}
