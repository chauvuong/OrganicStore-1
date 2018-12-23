package dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import entity.Cat;
import entity.User;

@Repository
public class CatDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public List<Cat> getItems() {
		String sql = "SELECT * FROM categories";

		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Cat>(Cat.class));
	}
	

	public int addItem(Cat cat) {
		String sql = "INSERT INTO categories(name) VALUE(?)";
		return jdbcTemplate.update(sql, new Object[] { cat.getName() });
	}

	public int delItem(int id) {
		String sql = "DELETE FROM categories WHERE id_cat = ?";
		return jdbcTemplate.update(sql, new Object[] { id });
	}

	public int editItem(Cat cat) {
		String sql = "UPDATE categories SET name = ? WHERE id_cat = ? ";
		return jdbcTemplate.update(sql, new Object[] { cat.getName(), cat.getId_cat() });
	}

	public Cat getItem(int id) {
		String sql = "SELECT * FROM categories WHERE id_cat = ?";
		try {
			return jdbcTemplate.queryForObject(sql, new Object[] { id }, new BeanPropertyRowMapper<Cat>(Cat.class));
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public boolean checkItem(Cat objCat) {
		String query = "SELECT * FROM categories WHERE name=? ";
		try {
			Cat obj = (Cat) jdbcTemplate.queryForObject(query, new Object[] { objCat.getName() },
					new BeanPropertyRowMapper(Cat.class));
			if (objCat.getId_cat() == obj.getId_cat() && objCat.getId_cat() != 0)
				return true;
		} catch (EmptyResultDataAccessException e) {
			return true;
		}
		return false;

	}
	public int countItem() {
		String sql = "SELECT COUNT(*) FROM categories ORDER BY id_cat DESC";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}
	
	
	
}
