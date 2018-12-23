package entity;

import java.sql.Timestamp;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;



public class Product {

	private int id_product;
	/*@NotEmpty(message = "-- Vui Lòng Nhập Tên Sản Phẩm")*/
	private String name;
	/*@NotEmpty(message = "-- Vui Lòng Nhập Mô Tả")
	@Size(min = 5, max = 30, message = "-- Vui Lòng Nhập Từ Khoảng 5 >> 20 ký Tự")*/
	private String preview;
	private String picture;
	private int rating;
/*	@NotEmpty(message = "-- Vui Lòng Nhập Chi Tiết")
	@Size(min = 5, max = 30, message = "-- Vui Lòng Nhập Từ Khoảng 10 >> 30 ký Tự")*/
	private String details;
	private int price;
	private int discount;
	private int id_cat;
	private Timestamp date_create;
	private int active;
	private int count_views;
	private String cname;
	private int quatity;
	
	public Product(int id_product, String name, String preview, String picture, int rating, String details, int price,
			int discount, int id_cat, Timestamp date_create, int active, int count_views, String cname, int quatity) {
		super();
		this.id_product = id_product;
		this.name = name;
		this.preview = preview;
		this.picture = picture;
		this.rating = rating;
		this.details = details;
		this.price = price;
		this.discount = discount;
		this.id_cat = id_cat;
		this.date_create = date_create;
		this.active = active;
		this.count_views = count_views;
		this.cname = cname;
		this.quatity = quatity;
	}

	public int getQuatity() {
		return quatity;
	}

	public void setQuatity(int quatity) {
		this.quatity = quatity;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	

	public int getId_product() {
		return id_product;
	}

	public void setId_product(int id_product) {
		this.id_product = id_product;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPreview() {
		return preview;
	}

	public void setPreview(String preview) {
		this.preview = preview;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}
	
	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}
	public String getDetails() {
		return details;
	}

	public void setDetails(String details) {
		this.details = details;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getDiscount() {
		return discount;
	}

	public void setDiscount(int discount) {
		this.discount = discount;
	}

	public int getId_cat() {
		return id_cat;
	}

	public void setId_cat(int id_cat) {
		this.id_cat = id_cat;
	}

	public Timestamp getDate_create() {
		return date_create;
	}

	public void setDate_create(Timestamp date_create) {
		this.date_create = date_create;
	}

	public int getActive() {
		return active;
	}

	public void setActive(int active) {
		this.active = active;
	}

	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getCount_views() {
		return count_views;
	}

	public void setCount_views(int count_views) {
		this.count_views = count_views;
	}

}
