package util;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.Part;

import org.springframework.ui.ModelMap;

public class StringUtil {

	public String md5(String str) {
		MessageDigest md;
		String result = "";
		try {
			md = MessageDigest.getInstance("MD5");
			md.update(str.getBytes());
			BigInteger bi = new BigInteger(1, md.digest());

			result = bi.toString(16);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return result;
	}

	public static String getFileName(final Part part) {
		final String partHeader = part.getHeader("content-disposition");
		for (String content : partHeader.split(";")) {
			if (content.trim().startsWith("filename")) {
				return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
			}
		}
		return null;
	}

	public static String rename(String fileName) {
		String[] arrImg = fileName.split("\\.");
		String duoiFileImg = arrImg[arrImg.length - 1];
		String nameFile = "";
		for (int i = 0; i < (arrImg.length - 1); i++) {
			if (i == 0) {
				nameFile = arrImg[i];
			} else {
				nameFile += "-" + arrImg[i];
			}
		}
		if (nameFile.length() > 220) {
			nameFile = nameFile.substring(0, 200);
		}
		nameFile = nameFile + "-" + time("ddMMyyyyHHmms") + "." + duoiFileImg;
		return nameFile;
	}

	public static String time(String format) {
		DateFormat dateFormat = new SimpleDateFormat(format);
		Date date = new Date();
		return dateFormat.format(date);
	}

	public static void main(String[] args) {

		Date d1 = new Date();
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Date d2 = new Date();

		// Get msec from each, and subtract.
		long diff = d2.getTime() - d1.getTime();
		long diffSeconds = diff / 1000;
		long diffMinutes = diff / (60 * 1000);
		long diffHours = diff / (60 * 60 * 1000);
		System.out.println("Số giây : " + diffSeconds + " seconds.");
		System.out.println("Số phút: " + diffMinutes + " minutes.");
		System.out.println("Số giờ: " + diffHours + " hours.");

	}

	public static boolean checkUsername(String str) {
		boolean check = false;
		if (str.matches("[a-z0-9_-]{3,15}$")) {
			check = true;
		}
		return check;
	}

	public static boolean checkSpace(String str) {
		if (str.matches("^[ \\s]+|[ \\s]+$|^[ \\s],*|,*[ \\s]+$")) {

			return false;
		} else {

			return true;
		}
	}

	public static String editChuoiMota(String str) {
		int size = str.length();
		String moi = "";
		int end = 50;
		char charr = str.charAt(end);
		char kt = ' ';
		if (charr == kt) {
			moi = str.substring(0, end);
		} else {
			if (str.charAt(end + 1) == kt) {
				moi = str.substring(0, end + 1);
			} else if (charr != kt) {

				for (int i = end; i < size; i++) {
					if (str.charAt(i) == kt) {
						moi = str.substring(0, i);
						break;
					}
				}
			}
		}
		return moi;
	}

	public static String editChuoi(String str) {
		int size = str.length();
		String moi = "";
		int end = 15;
		char charr = str.charAt(end);
		char kt = ' ';
		if (charr == kt) {
			moi = str.substring(0, end);
		} else {
			if (str.charAt(end + 1) == kt) {
				moi = str.substring(0, end + 1);
			} else if (charr != kt) {

				for (int i = end; i < size; i++) {
					if (str.charAt(i) == kt) {
						moi = str.substring(0, i);
						break;
					}
				}
			}
		}
		return moi;
	}

	public static String pagination(int page, int sumNews, int sumPage, int luotNhay, ModelMap modelMap) {

		// Tính số lượt nhảy:
		int soLuotNhay = (int) Math.ceil((float) sumPage / 2);
		int oStart = (luotNhay - 1) * 2 + 1;
		int oEnd = (luotNhay - 1) * 2 + 2;

		System.out.println("Page hien tai: " + page);
		System.out.println("sumNews: " + sumNews);
		System.out.println("sumPage: " + sumPage);
		System.out.println("soLuotNhay: " + soLuotNhay);
		System.out.println("luotNhay: " + luotNhay);
		System.out.println("oStart: " + oStart);
		System.out.println("oEnd: " + oEnd + "\n");

		modelMap.addAttribute("soLuotNhay", soLuotNhay);
		modelMap.addAttribute("luotNhay", luotNhay);
		modelMap.addAttribute("oStart", oStart);
		modelMap.addAttribute("oEnd", oEnd);

		modelMap.addAttribute("sumPage", sumPage);
		modelMap.addAttribute("page", page);

		return null;
	}

}
