package entity;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

public class User {
	private int id_user;
	@NotEmpty(message = "-- Vui Lòng Nhập Username")
	@Size(min = 4, max = 20, message = "-- Vui Lòng Nhập Từ Khoảng 4 >> 20 ký Tự")
	private String username;
	@NotEmpty(message = "-- Vui Lòng Nhập Họ Tên")
	@Size(min = 5, max = 30, message = "-- Vui Lòng Nhập Từ Khoảng 5 >> 30 ký Tự")
	private String fullname;
/*	@NotEmpty(message = "-- Vui Lòng Nhập Password")
	@Size(min = 4, max = 20, message = "-- Vui Lòng Nhập Từ Khoảng 6 >> 20 ký Tự")*/
	private String password;
	private int enable;
	private int role_id;
	@NotEmpty(message = "-- Vui Lòng Nhập Địa Chỉ")
	private String address;
	@NotEmpty(message = "-- Vui Lòng Nhập Số Điện Thoại")
	@Size(min = 10, message= "-- Nhập Đúng Định Dạng Số Điện Thoại")
	private String phone;
	private String rname;
	
	public String getRname() {
		return rname;
	}
	public void setRname(String rname) {
		this.rname = rname;
	}
	
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	
	
	public User(int id_user, String username, String fullname, String password, int enable, int role_id, String address,
			String phone, String rname) {
		super();
		this.id_user = id_user;
		this.username = username;
		this.fullname = fullname;
		this.password = password;
		this.enable = enable;
		this.role_id = role_id;
		this.address = address;
		this.phone = phone;
		this.rname = rname;
	}
	public int getId_user() {
		return id_user;
	}
	public void setId_user(int id_user) {
		this.id_user = id_user;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getEnable() {
		return enable;
	}
	public void setEnable(int enable) {
		this.enable = enable;
	}
	public int getRole_id() {
		return role_id;
	}
	public void setRole_id(int role_id) {
		this.role_id = role_id;
	}
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
