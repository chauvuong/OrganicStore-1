package entity;

import org.hibernate.validator.constraints.NotEmpty;

public class Discount {
	private int id_discount;
	@NotEmpty(message = "-Vui Lòng Nhập Mã")
	private String name;
	private int sale;

	public Discount() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getSale() {
		return sale;
	}

	public void setSale(int sale) {
		this.sale = sale;
	}

	public int getId_discount() {
		return id_discount;
	}

	public void setId_discount(int id_discount) {
		this.id_discount = id_discount;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Discount(int id_discount, String name, int sale) {
		super();
		this.id_discount = id_discount;
		this.name = name;
		this.sale = sale;
	}

}
