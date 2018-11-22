package dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import entity.Cat;
import entity.Role;
import entity.User;

@Repository
public class RoleDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public List<Role> getItems() {
		String sql = "SELECT * FROM roles";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Role>(Role.class));
	}

	public int addItem(Role role) {
		String sql = "INSERT INTO roles(name) VALUE(?)";
		return jdbcTemplate.update(sql, new Object[] { role.getName() });
	}

	public int delItem(int id) {
		String sql = "DELETE FROM roles WHERE role_id = ?";
		return jdbcTemplate.update(sql, new Object[] { id });
	}

	public int editItem(Role role) {
		String sql = "UPDATE roles SET name = ? WHERE role_id = ? ";
		return jdbcTemplate.update(sql, new Object[] { role.getName(), role.getRole_id() });
	}

	public Role getItem(int id) {
		String sql = "SELECT * FROM roles WHERE role_id = ?";
		try {
			return jdbcTemplate.queryForObject(sql, new Object[] { id }, new BeanPropertyRowMapper<Role>(Role.class));
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public boolean checkItem(Role objRole) {
		String query = "SELECT * FROM roles WHERE name= ? ";
		try {
			Role obj = (Role) jdbcTemplate.queryForObject(query, new Object[] { objRole.getName() },
					new BeanPropertyRowMapper(Role.class));
			if (objRole.getRole_id() == obj.getRole_id() && objRole.getRole_id() != 0)
				return true;
		} catch (EmptyResultDataAccessException e) {
			return true;
		}
		return false;

	}
}
