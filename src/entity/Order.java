package entity;

public class Order {
	private int id_order;
	private String name_customer;
	private String date_create;
	private String phone;
	private String place;
	private String pay;
	private int status;
	private int id_member;
	private int id_pay;
	public Order() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Order(int id_order, String name_customer, String date_create, String phone, String place, String pay,
			int status, int id_member, int id_pay) {
		super();
		this.id_order = id_order;
		this.name_customer = name_customer;
		this.date_create = date_create;
		this.phone = phone;
		this.place = place;
		this.pay = pay;
		this.status = status;
		this.id_member = id_member;
		this.id_pay = id_pay;
	}
	public int getId_order() {
		return id_order;
	}
	public void setId_order(int id_order) {
		this.id_order = id_order;
	}
	public String getName_customer() {
		return name_customer;
	}
	public void setName_customer(String name_customer) {
		this.name_customer = name_customer;
	}
	public String getDate_create() {
		return date_create;
	}
	public void setDate_create(String date_create) {
		this.date_create = date_create;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public String getPay() {
		return pay;
	}
	public void setPay(String pay) {
		this.pay = pay;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getId_member() {
		return id_member;
	}
	public void setId_member(int id_member) {
		this.id_member = id_member;
	}
	public int getId_pay() {
		return id_pay;
	}
	public void setId_pay(int id_pay) {
		this.id_pay = id_pay;
	}


}
