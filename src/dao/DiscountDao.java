package dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import entity.Discount;

@Repository
public class DiscountDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public List<Discount> getItems() {
		String sql = "SELECT * FROM discount";

		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Discount>(Discount.class));
	}

	public int addItem(Discount discount) {
		String sql = "INSERT INTO discount(name,sale) VALUE(?,?)";
		return jdbcTemplate.update(sql, new Object[] { discount.getName() , discount.getSale()});
	}

	public int delItem(int id) {
		String sql = "DELETE FROM discount WHERE id_discount = ?";
		return jdbcTemplate.update(sql, new Object[] { id });
	}

	public int editItem(Discount discount) {
		String sql = "UPDATE discount SET name = ?, sale = ? WHERE id_discount = ? ";
		return jdbcTemplate.update(sql, new Object[] { discount.getName(), discount.getSale() ,discount.getId_discount() });
	}

	public Discount getItem(int id) {
		String sql = "SELECT * FROM discount WHERE id_discount = ?";
		try {
			return jdbcTemplate.queryForObject(sql, new Object[] { id },
					new BeanPropertyRowMapper<Discount>(Discount.class));
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public boolean checkItem(Discount objDiscount) {
		String query = "SELECT * FROM discount WHERE name=? ";
		try {
			Discount obj = (Discount) jdbcTemplate.queryForObject(query, new Object[] { objDiscount.getName() },
					new BeanPropertyRowMapper(Discount.class));
			if (objDiscount.getId_discount() == obj.getId_discount() && objDiscount.getId_discount() != 0)
				return true;
		} catch (EmptyResultDataAccessException e) {
			return true;
		}
		return false;

	}

	public int countItem() {
		String sql = "SELECT COUNT(*) FROM discount ORDER BY id_discount DESC";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}

}
