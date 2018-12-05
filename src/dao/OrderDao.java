package dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import constant.Defines;
import entity.Order;
import entity.Product;

@Repository
public class OrderDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public List<Order> getItems() {
		String sql = "SELECT * FROM orders";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Order>(Order.class));
	}

	public int addItem(Order objItem) {
		String query = "INSERT INTO orders(name_customer,place, phone, pay, note, email, date_create, id_member) VALUES (?,?,?,?,?,?,?,?)";
		return jdbcTemplate.update(query, new Object[] { objItem.getName_customer(), objItem.getPlace(),objItem.getPhone(), objItem.getPay() ,objItem.getNote(),objItem.getEmail(), objItem.getDate_create(), objItem.getId_member() });
	}

	public Order getItem(int id) {
		String query = "SELECT * FROM  orders WHERE id_order =? ";
		return (Order) jdbcTemplate.queryForObject(query, new Object[] { id },
				new BeanPropertyRowMapper<Order>(Order.class));
	}

	public Order getItemDATE(String date) {
		String query = "SELECT * FROM  orders WHERE date_create = ? ";
		return (Order) jdbcTemplate.queryForObject(query, new Object[] { date },
				new BeanPropertyRowMapper<Order>(Order.class));
	}

	public int delItem(int id) {
		String query = "DELETE FROM orders WHERE id_order=? ";
		return jdbcTemplate.update(query, new Object[] { id });
	}

	public int editActiveStatus(Order objOrder) {
		String sql = "UPDATE orders SET status = ? WHERE id_order = ? ";
		return jdbcTemplate.update(sql, new Object[] { objOrder.getStatus(), objOrder.getId_order() });
	}
	
	public int countItem() {
		String sql = "SELECT COUNT(*) FROM orders ORDER BY id_order DESC";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}

	public List<Order> getItemsAdmin(int offset) {
		String sql = "SELECT * FROM orders ORDER BY id_order DESC LIMIT ?,? ";
		return jdbcTemplate.query(sql, new Object[] { offset, Defines.ROW_COUNT },
				new BeanPropertyRowMapper<Order>(Order.class));
	}
	

	
}
