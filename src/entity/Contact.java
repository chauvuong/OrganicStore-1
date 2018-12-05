package entity;

import org.hibernate.validator.constraints.NotEmpty;

public class Contact {
	private int id_contact;
	@NotEmpty(message = "-- Vui Lòng Nhập Họ Tên")
	private String name;
	@NotEmpty(message = "-- Vui Lòng Nhập Email")
	private String email;
	private String address;
	private String phone;
	private String message;
	public Contact() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getId_contact() {
		return id_contact;
	}
	public void setId_contact(int id_contact) {
		this.id_contact = id_contact;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
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
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Contact(int id_contact, String name, String email, String address, String phone, String message) {
		super();
		this.id_contact = id_contact;
		this.name = name;
		this.email = email;
		this.address = address;
		this.phone = phone;
		this.message = message;
	}


}
