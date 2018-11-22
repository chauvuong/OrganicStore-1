package entity;

import org.hibernate.validator.constraints.NotEmpty;

public class Payment {
	private int id_pay;
	@NotEmpty(message="-Vui Lòng Nhập Hình Thức Thanh Toán")
	private String name;
	public int getId_pay() {
		return id_pay;
	}
	public void setId_pay(int id_pay) {
		this.id_pay = id_pay;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Payment() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Payment(int id_pay, String name) {
		super();
		this.id_pay = id_pay;
		this.name = name;
	}
	
}
