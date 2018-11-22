package entity;

public class DetailOrder {
	private int id_detail;
	private int id_order;
	private int id_product;
	private int quatity;
	private String name;
	private int price;

	public int getId_detail() {
		return id_detail;
	}

	public void setId_detail(int id_detail) {
		this.id_detail = id_detail;
	}

	public int getId_order() {
		return id_order;
	}

	public void setId_order(int id_order) {
		this.id_order = id_order;
	}

	public int getId_product() {
		return id_product;
	}

	public void setId_product(int id_product) {
		this.id_product = id_product;
	}

	public int getQuatity() {
		return quatity;
	}

	public void setQuatity(int quatity) {
		this.quatity = quatity;
	}

	public String getname() {
		return name;
	}

	public void setname(String name) {
		this.name = name;
	}

	public int getprice() {
		return price;
	}

	public void setprice(int price) {
		this.price = price;
	}

	public DetailOrder() {
		super();
		// TODO Auto-generated constructor stub
	}

	public DetailOrder(int id_detail, int id_order, int id_product, int quatity, String name, int price) {
		super();
		this.id_detail = id_detail;
		this.id_order = id_order;
		this.id_product = id_product;
		this.quatity = quatity;
		this.name = name;
		this.price = price;
	}

}
