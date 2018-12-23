package dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import constant.Defines;
import entity.Cat;
import entity.Member;
import entity.Product;
import entity.User;
import util.StringUtil;

@Repository
public class MemberDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired
	private StringUtil stringUtil;

	public List<Member> getItems() {
		String sql = "SELECT id_member, fullname, email,address,phone,password,a.role_id AS role_id ,enable,r.name AS rname FROM user AS a INNER JOIN roles AS r ON a.role_id = r.role_id ";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Member>(Member.class));
	}
	
	public Member getItem(int id) {
		String sql = "SELECT * FROM user WHERE id_member = ?";
		try {
			return jdbcTemplate.queryForObject(sql, new Object[] { id }, new BeanPropertyRowMapper<Member>(Member.class));
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}
	
	public int editActive(Member objMember) {
		String sql = "UPDATE user set enable = ? WHERE id_member = ? ";
		return jdbcTemplate.update(sql, new Object[] { objMember.getEnable(), objMember.getId_member() });
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public boolean checkItemUs(Member objCheck) {
		String query = "SELECT * FROM user WHERE fullname=? ";
		try {
			Member obj = (Member) jdbcTemplate.queryForObject(query, new Object[] { objCheck.getFullname() },
					new BeanPropertyRowMapper(Member.class));
			if (objCheck.getId_member() == obj.getId_member() && objCheck.getId_member() != 0)
				return true;
		} catch (EmptyResultDataAccessException e) {
			return true;
		}
		return false;

	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public boolean checkEmail(Member objCheck) {
		String query = "SELECT * FROM user WHERE email=? ";
		try {
			Member obj = (Member) jdbcTemplate.queryForObject(query, new Object[] { objCheck.getEmail() },
					new BeanPropertyRowMapper(Member.class));
			if (objCheck.getId_member() == obj.getId_member() && objCheck.getId_member() != 0)
				return true;
		} catch (EmptyResultDataAccessException e) {
			return true;
		}
		return false;

	}

	public int addItem(Member member) {
		String sql = "INSERT INTO user(fullname, email, password, phone, address , role_id) VALUE(?,?,?,?,?,?)";
		return jdbcTemplate.update(sql, new Object[] { member.getFullname(), member.getPassword(),
				member.getPhone(), member.getAddress(), member.getRole_id() });
	}

	public int addItemMember(Member member) {
		String sql = "INSERT INTO user(fullname, email, password, phone, address , role_id) VALUE(?,?,?,?,?,?)";
		return jdbcTemplate.update(sql, new Object[] { member.getFullname(), member.getEmail(),
				stringUtil.md5(member.getPassword()), member.getPhone(), member.getAddress() , member.getRole_id()});
	}

	public Member checkLogin(String email, String password) {
		String sql = "SELECT * FROM user WHERE email = ? AND password = ?  AND enable=1";
		try {
			return jdbcTemplate.queryForObject(sql, new Object[] { email, stringUtil.md5(password) },
					new BeanPropertyRowMapper<Member>(Member.class)); 
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public boolean checkItem(Member objMember) {
		String query = "SELECT * FROM user WHERE email=? ";
		try {
			Member obj = (Member) jdbcTemplate.queryForObject(query, new Object[] { objMember.getEmail() },
					new BeanPropertyRowMapper(Member.class));
			if (objMember.getId_member() == obj.getId_member() && objMember.getId_member() != 0)
				return true;
		} catch (EmptyResultDataAccessException e) {
			return true;
		}
		return false;

	}

	public int delItem(int id) {
		String sql = "DELETE FROM user WHERE id_member = ?";
		return jdbcTemplate.update(sql, new Object[] { id });
	}

	public int editItem(Member user) {
		String sql = "UPDATE user SET fullname = ? , email = ? , password = ?,phone = ?, address = ? , role_id = ? WHERE id_member = ? ";
		return jdbcTemplate.update(sql, new Object[] { user.getFullname(), user.getEmail(),user.getPassword(), user.getPhone(),
				user.getAddress(), user.getRole_id(), user.getId_member() });
	}

	public Member getUser(String user) {
		String sql = "SELECT * FROM  user WHERE email=? ";
		return (Member) jdbcTemplate.queryForObject(sql, new Object[] { user },
				new BeanPropertyRowMapper<Member>(Member.class));
	}

	public List<Member> check(String email) {
		String sql = "SELECT * FROM user WHERE email= ?";
		return jdbcTemplate.query(sql, new Object[] { email }, new BeanPropertyRowMapper<Member>(Member.class));
	}
	
	public User checkEmail(String email) {
		String sql = "SELECT * FROM user WHERE email = ?";
		try {
			return jdbcTemplate.queryForObject(sql, new Object[] { email,},
					new BeanPropertyRowMapper<User>(User.class));
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}
	
	public int countItem() {
		String sql = "SELECT COUNT(*) FROM user ORDER BY id_member DESC";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}
	
	
	public List<Member> getItemsAdmin(int offset) {
		String sql = "SELECT id_member, fullname, email,address,phone,password, role_id ,enable FROM user ORDER BY id_member DESC LIMIT ?, ? ";
		return jdbcTemplate.query(sql, new Object[] { offset, Defines.ROW_COUNT },
				new BeanPropertyRowMapper<Member>(Member.class));
	}

}
