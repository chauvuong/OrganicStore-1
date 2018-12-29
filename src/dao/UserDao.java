package dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import entity.User;

import util.StringUtil;

@Repository
public class UserDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired
	private StringUtil stringUtil;

	public List<User> getItems() {
		String sql = "SELECT id_user,username,address,phone,password,fullname,a.role_id AS role_id ,enable,r.name AS rname FROM admin AS a INNER JOIN roles AS r ON a.role_id = r.role_id ";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<User>(User.class));
	}

	public int editActive(User objUser) {
		String sql = "UPDATE admin set enable = ? WHERE id_user = ? ";
		return jdbcTemplate.update(sql, new Object[] { objUser.getEnable(), objUser.getId_user() });
	}

	public User getItem(int id) {
		String sql = "SELECT * FROM admin WHERE id_user = ?";
		try {
			return jdbcTemplate.queryForObject(sql, new Object[] { id }, new BeanPropertyRowMapper<User>(User.class));
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public boolean checkItemUs(User objCheck) {
		String query = "SELECT * FROM admin WHERE username=? ";
		try {
			User obj = (User) jdbcTemplate.queryForObject(query, new Object[] { objCheck.getUsername() },
					new BeanPropertyRowMapper(User.class));
			if (objCheck.getId_user() == obj.getId_user() && objCheck.getId_user() != 0)
				return true;
		} catch (EmptyResultDataAccessException e) {
			return true;
		}
		return false;

	}
	


	public int addItem(User user) {
		String sql = "INSERT INTO admin(username, fullname, password, phone, address , role_id) VALUE(?,?,?,?,?,?)";
		return jdbcTemplate.update(sql, new Object[] { user.getUsername(), user.getFullname(), user.getPassword(),
				user.getPhone(), user.getAddress(), user.getRole_id() });
	}

	public int addItemMember(User user) {
		String sql = "INSERT INTO admin(username, fullname, password, phone, address , role_id) VALUE(?,?,?,?,?,3)";
		return jdbcTemplate.update(sql, new Object[] { user.getUsername(), user.getFullname(),
				stringUtil.md5(user.getPassword()), user.getPhone(), user.getAddress() });
	}

	public User checkLogin(String username, String password) {
		String sql = "SELECT * FROM admin WHERE username = ? AND password = ?";
		try {
			return jdbcTemplate.queryForObject(sql, new Object[] { username, stringUtil.md5(password) },
					new BeanPropertyRowMapper<User>(User.class));
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}

	public int delItem(int id) {
		String sql = "DELETE FROM admin WHERE id_user = ?";
		return jdbcTemplate.update(sql, new Object[] { id });
	}

	public int editItem(User user) {
		String sql = "UPDATE admin SET fullname = ? , password = ?,phone = ?, address = ? , role_id = ? WHERE id_user = ? ";
		return jdbcTemplate.update(sql, new Object[] { user.getFullname(), user.getPassword(), user.getPhone(),
				user.getAddress(), user.getRole_id(), user.getId_user() });
	}
	
	
	public User getUser(String user) {
		String sql = "SELECT * FROM  admin WHERE username=? ";
		return (User) jdbcTemplate.queryForObject(sql, new Object[] { user },
				new BeanPropertyRowMapper<User>(User.class));
	}

	public List<User> check(String username) {
		String sql = "SELECT * FROM admin WHERE username= ?";
		return jdbcTemplate.query(sql, new Object[] { username }, new BeanPropertyRowMapper<User>(User.class));
	}
	
	public User checkUsername(String username) {
		String sql = "SELECT * FROM admin WHERE username = ?";
		try {
			return jdbcTemplate.queryForObject(sql, new Object[] { username},
					new BeanPropertyRowMapper<User>(User.class));
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}
	
	public int countItem() {
		String sql = "SELECT COUNT(*) FROM admin ORDER BY id_user DESC";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}

}
