package dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import entity.Payment;

@Repository
public class PayDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public List<Payment> getItems() {
		String sql = "SELECT * FROM pay";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Payment>(Payment.class));
	}

	public int addItem(Payment pay) {
		String sql = "INSERT INTO pay(name) VALUE(?)";
		return jdbcTemplate.update(sql, new Object[] { pay.getName() });
	}

	public int delItem(int id) {
		String sql = "DELETE FROM pay WHERE id_pay = ?";
		return jdbcTemplate.update(sql, new Object[] { id });
	}

	public int editItem(Payment pay) {
		String sql = "UPDATE pay SET name = ? WHERE id_pay = ? ";
		return jdbcTemplate.update(sql, new Object[] { pay.getName(), pay.getId_pay() });
	}

	public Payment getItem(int id) {
		String sql = "SELECT * FROM pay WHERE id_pay = ?";
		try {
			return jdbcTemplate.queryForObject(sql, new Object[] { id },
					new BeanPropertyRowMapper<Payment>(Payment.class));
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public boolean checkItem(Payment objPay) {
		String query = "SELECT * FROM pay WHERE name= ? ";
		try {
			Payment obj = (Payment) jdbcTemplate.queryForObject(query, new Object[] { objPay.getName() },
					new BeanPropertyRowMapper(Payment.class));
			if (objPay.getId_pay() == obj.getId_pay() && objPay.getId_pay() != 0)
				return true;
		} catch (EmptyResultDataAccessException e) {
			return true;
		}
		return false;

	}
}
