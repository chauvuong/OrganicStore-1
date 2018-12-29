package dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import constant.Defines;
import entity.Comment;
import entity.Contact;
import entity.Order;
import entity.Product;
import entity.Comment;

@Repository
public class CommentDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public List<Comment> getItemsAdmin() {
		String sql = "SELECT id_comment, p.name AS nname, cmt.name AS name , email, cmt.content AS content,cmt.rating,cmt.date_create AS date_create,cmt.product_id AS product_id FROM comment AS cmt INNER JOIN product AS p ON cmt.product_id = p.id_product ORDER BY cmt.id_comment DESC";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Comment>(Comment.class));
	}
	
	public List<Comment> getItemsCommentNews() {
		String sql = "SELECT id_comment, p.name AS nname, cmt.name AS name , email, cmt.content AS content,cmt.rating,cmt.date_create AS date_create,cmt.product_id AS product_id FROM comment AS cmt INNER JOIN product AS p ON cmt.product_id = p.id_product ORDER BY cmt.date_create DESC LIMIT 5";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Comment>(Comment.class));
	}

	

	public int addItem(Comment comment) {
		String sql = "INSERT INTO comment(name, email, content, rating, date_create, product_id) VALUES (?,?,?,?,?,?)";
		return jdbcTemplate.update(sql,
				new Object[] { comment.getName(), comment.getEmail(), comment.getContent(),
						 comment.getRating(), comment.getDate_create(), comment.getProduct_id() });
	}

	public int delItem(int id) {
		String sql = "DELETE FROM comment WHERE id_comment = ?";
		return jdbcTemplate.update(sql, new Object[] { id });
	}

	public List<Comment> getListCommenPublic(int did) {
		String sql = "SELECT id_comment, cmt.name AS name , email, cmt.content AS content,cmt.rating,cmt.date_create AS date_create,cmt.product_id AS product_id FROM comment AS cmt INNER JOIN product AS p ON cmt.product_id = p.id_product WHERE cmt.product_id = ? ORDER BY cmt.id_comment DESC";
		return jdbcTemplate.query(sql, new Object[] { did }, new BeanPropertyRowMapper<Comment>(Comment.class));
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public Comment getItem(int id) {
		String query = "SELECT * FROM  comment WHERE id_comment=? ";
		return (Comment) jdbcTemplate.queryForObject(query, new Object[] { id },
				new BeanPropertyRowMapper(Comment.class));
	}
	
	public int countNewPublicComment(int cid) {
		String sql = "SELECT COUNT(*) as sum FROM comment WHERE product_id = ?";
		int sum = this.jdbcTemplate.queryForObject(sql, new Object[] { cid }, Integer.class);
		return sum;

	}
	
	public int countItem() {
		String sql = "SELECT COUNT(*) FROM comment ORDER BY id_comment DESC";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}
	
	
	public int sumRating(int id) {
		String sql = "SELECT SUM(rating) AS tong FROM comment WHERE product_id = ?";
		int tong = this.jdbcTemplate.queryForObject(sql, new Object[] { id }, Integer.class);
		return tong;

	}
	
	
	
	
	

}
