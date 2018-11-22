package dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import entity.DetailOrder;
import entity.Product;

@Repository
public class DetailOrderDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<DetailOrder> getItems(int id_order) {
		String query = "SELECT * FROM detailorder INNER JOIN product ON detailorder.id_product = product.id_product WHERE id_order=?";
		return jdbcTemplate.query(query, new Object[] { id_order },
				new BeanPropertyRowMapper<DetailOrder>(DetailOrder.class));
	}

	public int addItem(Product objItem, int id_order) {
		String query = "INSERT INTO detailorder(id_order,id_product, quatity) VALUES (?,?,?)";
		return jdbcTemplate.update(query,
				new Object[] { id_order, objItem.getId_product(), objItem.getQuatity()});
	}

	public int delItem(int id) {
		String query = "DELETE FROM detailorder WHERE id_order = ? ";
		return jdbcTemplate.update(query, new Object[] { id });
	}
}
