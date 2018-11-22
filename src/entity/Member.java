package entity;

import java.sql.Timestamp;

public class Member {
	private int id_member;
	private String fullname;
	private String email;
	private int role_id;
	private int enable;
	private String password;
	private String address;
	private String phone;
	private String rname;
	private Timestamp created;
	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getId_member() {
		return id_member;
	}
	public void setId_member(int id_member) {
		this.id_member = id_member;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getRole_id() {
		return role_id;
	}
	public void setRole_id(int role_id) {
		this.role_id = role_id;
	}
	public int getEnable() {
		return enable;
	}
	public void setEnable(int enable) {
		this.enable = enable;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
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
	public String getRname() {
		return rname;
	}
	public void setRname(String rname) {
		this.rname = rname;
	}
	public Timestamp getCreated() {
		return created;
	}
	public void setCreated(Timestamp created) {
		this.created = created;
	}
	public Member(int id_member, String fullname, String email, int role_id, int enable, String password,
			String address, String phone, String rname, Timestamp created) {
		super();
		this.id_member = id_member;
		this.fullname = fullname;
		this.email = email;
		this.role_id = role_id;
		this.enable = enable;
		this.password = password;
		this.address = address;
		this.phone = phone;
		this.rname = rname;
		this.created = created;
	}
	
	
}