package entity;

import java.sql.Timestamp;

public class Comment {
	private int id_comment;
	private String nname;
	private String name;
	private String email;
	private String content;
	private int rating;
	private Timestamp date_create;
	private int product_id;
	public Comment() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Comment(int id_comment, String nname, String name, String email, String content, int rating,
			Timestamp date_create, int product_id) {
		super();
		this.id_comment = id_comment;
		this.nname = nname;
		this.name = name;
		this.email = email;
		this.content = content;
		this.rating = rating;
		this.date_create = date_create;
		this.product_id = product_id;
	}
	
	public String getNname() {
		return nname;
	}

	public void setNname(String nname) {
		this.nname = nname;
	}

	public int getId_comment() {
		return id_comment;
	}
	public void setId_comment(int id_comment) {
		this.id_comment = id_comment;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}

	public Timestamp getDate_create() {
		return date_create;
	}
	public void setDate_create(Timestamp date_create) {
		this.date_create = date_create;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	
	
}