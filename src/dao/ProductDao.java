package dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import constant.Defines;
import entity.Product;

@Repository
public class ProductDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public List<Product> getItems() {
		String sql = "SELECT * FROM product";

		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Product>(Product.class));
	}

	public int editActive(Product objProduct) {
		String sql = "UPDATE product SET active = ? WHERE id_product = ? ";
		return jdbcTemplate.update(sql, new Object[] { objProduct.getActive(), objProduct.getId_product() });
	}

	public int addItem(Product product) {
		String sql = "INSERT INTO product(name, preview, picture, details,  price, discount,id_cat, active, count_views, rating ) VALUE(?,?,?,?,?,?,?,1,0,0)";
		return jdbcTemplate.update(sql,
				new Object[] { product.getName(), product.getPreview(), product.getPicture(),
						 product.getDetails(), 
						product.getPrice(), product.getDiscount(), product.getId_cat() });
	}

	public int delItem(int id) {
		String sql = "DELETE FROM product WHERE id_product = ?";
		return jdbcTemplate.update(sql, new Object[] { id });
	}

	public int editItem(Product product) {
		String sql = "UPDATE product SET name = ?, preview = ?, picture = ?,details=?, price=?, discount= ? , id_cat =? WHERE id_product = ? ";
		return jdbcTemplate.update(sql,
				new Object[] { product.getName(), product.getPreview(), product.getPicture(),
						 product.getDetails(),
						product.getPrice(), product.getDiscount(), product.getId_cat(), product.getId_product() });
	}
	public int editRating(int product, int rating) {
		String sql = "UPDATE product SET rating = ? WHERE id_product = ? ";
		return jdbcTemplate.update(sql, new Object[] { rating,product});
	}

	public List<Product> getItemsSearchCat(Product objProduct) {
		String sql = "SELECT id_product, p.name AS name , picture, preview,details,price,discount, p.id_cat,active,date_create FROM product AS p INNER JOIN categories AS c ON c.id_cat = p.id_cat INNER JOIN guarantee AS g ON g.id_guarantee=p.id_guarantee WHERE p.id_cat = ?  ORDER BY id_product DESC";
		return jdbcTemplate.query(sql, new Object[] { objProduct.getId_cat() },
				new BeanPropertyRowMapper<Product>(Product.class));
	}

	

	

	public List<Product> getItemsSearchs(Product objProduct) {
		String sql = "SELECT id_product, p.name AS name , picture, preview,price,discount, p.id_cat,active,date_create FROM product AS p INNER JOIN categories AS c ON c.id_cat = p.id_cat WHERE p.name LIKE ?  ORDER BY id_product DESC";
		return jdbcTemplate.query(sql, new Object[] { "%" + objProduct.getName() + "%"  }, new BeanPropertyRowMapper<Product>(Product.class));
	}
	
	public List<Product> getItemsSearchPublic(Product objProduct) {
		String sql = "SELECT id_product, p.name AS name , picture, preview,price,discount, p.id_cat,active,date_create FROM product AS p INNER JOIN categories AS c ON c.id_cat = p.id_cat WHERE active = 1 AND p.name LIKE ?  ORDER BY id_product DESC";
		return jdbcTemplate.query(sql, new Object[] { "%" + objProduct.getName() + "%"  }, new BeanPropertyRowMapper<Product>(Product.class));
	}
	
	public int countItemSearch() {
		String sql = "SELECT COUNT(*) FROM product INNER JOIN categories ON categories.id_cat=product.id_cat ORDER BY id_product DESC";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}
	

	public int countItem() {
		String sql = "SELECT COUNT(*) FROM product INNER JOIN categories ON categories.id_cat=product.id_cat ORDER BY id_product DESC";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}

	public List<Product> getItemsAdmin(int offset) {
		String sql = "SELECT id_product, p.name AS name , picture, preview,details,price,discount, p.id_cat,active,date_create FROM product AS p INNER JOIN categories AS c ON c.id_cat = p.id_cat ORDER BY id_product DESC LIMIT ?,? ";
		return jdbcTemplate.query(sql, new Object[] { offset, Defines.ROW_COUNT },
				new BeanPropertyRowMapper<Product>(Product.class));
	}

	public List<Product> getItemsPublicNews() {
		String sql = "SELECT id_product, p.name AS name , picture, preview,details,price,discount, p.id_cat,active,date_create FROM product AS p INNER JOIN categories AS c ON c.id_cat = p.id_cat WHERE active = 1 ORDER BY id_product DESC LIMIT 10 ";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Product>(Product.class));
	}

	public List<Product> getItemsPublics() {
		String sql = "SELECT id_product, p.name AS name , picture,rating, preview,details,price,discount, p.id_cat,active,date_create FROM product AS p INNER JOIN categories AS c ON c.id_cat = p.id_cat WHERE active = 1 ORDER BY id_product DESC ";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Product>(Product.class));
	}
	

	public int upViews(int id) {
		String sql = "UPDATE product SET count_views = count_views + 1 WHERE id_product = ? ORDER BY count_views DESC";
		return jdbcTemplate.update(sql, new Object[] { id });
	}

	public List<Product> getItemsCat(int cid) {
		String sql = "SELECT id_product, p.name AS name , picture, preview,details,price,discount, p.id_cat,active,date_create FROM product AS p INNER JOIN categories AS c ON c.id_cat = p.id_cat WHERE active = 1 AND p.id_cat = ? ORDER BY id_product DESC  ";
		return jdbcTemplate.query(sql, new Object[] { cid }, new BeanPropertyRowMapper<Product>(Product.class));
	}

	public int countNewPublicCat(int cid) {
		String sql = "SELECT COUNT(*) as sum FROM product WHERE active = 1 AND id_cat = ?";
		int sum = this.jdbcTemplate.queryForObject(sql, new Object[] { cid }, Integer.class);
		return sum;

	}
	
	public int countNewPublicRating(int cid) {
		String sql = "SELECT COUNT(*) as sum FROM product WHERE active = 1 AND id_product = ?";
		int sum = this.jdbcTemplate.queryForObject(sql, new Object[] { cid }, Integer.class);
		return sum;

	}
	
	public int sumRating(int id) {
		String sql = "SELECT COUNT(*) AS tong FROM comment WHERE product_id = ?";
		int tong = this.jdbcTemplate.queryForObject(sql, new Object[] { id }, Integer.class);
		return tong;

	}
	


	public List<Product> getItemsCat(int cid, int offset) {
		String sql = "SELECT id_product, p.name AS name , picture, preview,production_code,details,price,discount, p.id_cat,active,date_create FROM product AS p INNER JOIN categories AS c ON c.id_cat = p.id_cat WHERE p.id_cat = ? ORDER BY id_product DESC LIMIT ? ,8";
		return jdbcTemplate.query(sql, new Object[] { cid, offset }, new BeanPropertyRowMapper<Product>(Product.class));
	}

	public Product getItem(int id) {
		String sql = "SELECT id_product, p.name AS name , c.name AS cname, picture,rating, preview,details,price,discount,count_views, p.id_cat,active,date_create FROM product AS p INNER JOIN categories AS c ON c.id_cat = p.id_cat  WHERE id_product = ?";

		try {
			return jdbcTemplate.queryForObject(sql, new Object[] { id },
					new BeanPropertyRowMapper<Product>(Product.class));
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}

	public List<Product> getItemsPublicNew() {
		String sql = "SELECT id_product, p.name AS name , picture, preview,details,price,discount, p.id_cat,active,date_create FROM product AS p INNER JOIN categories AS c ON c.id_cat = p.id_cat WHERE active = 1 ORDER BY id_product DESC LIMIT 12";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Product>(Product.class));
	}

	public List<Product> getTinLienQuan(int did, int cid) {
		String sql = "SELECT id_product, p.name AS name , picture, preview,details,price,discount, p.id_cat,active,date_create FROM product AS p INNER JOIN categories AS c ON c.id_cat = p.id_cat WHERE id_product != ? AND p.id_cat = ? ORDER BY id_product DESC";
		return jdbcTemplate.query(sql, new Object[] { did, cid }, new BeanPropertyRowMapper<Product>(Product.class));
	}

	public List<Product> getItemsViews() {
		String sql = "SELECT id_product, p.name AS name , picture, preview,details,price,discount, p.id_cat,active,date_create FROM product AS p INNER JOIN categories AS c ON c.id_cat = p.id_cat ORDER BY count_views DESC";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Product>(Product.class));
	}
	
	public int getItemsRating(int id) {
		String sql = "SELECT rating FROM product WHERE id_product = ?";
		return jdbcTemplate.queryForObject(sql,new Object[] { id }, Integer.class);
	}
	
	
	
	
}
