package dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import entity.Contact;

@Repository
public class ContactDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Contact> getItems() {
		String query = "SELECT * FROM contact";
		return jdbcTemplate.query(query, new BeanPropertyRowMapper(Contact.class));
	}

	public int addItem(Contact objItem) {
		String query = "INSERT INTO contact(name, email, address, phone, message) VALUES (?,?,?,?,?)";
		return jdbcTemplate.update(query,
				new Object[] { objItem.getName(), objItem.getEmail(), objItem.getAddress(),objItem.getPhone(), objItem.getMessage() });
	}

	public int delItem(int id) {
		String query = "DELETE FROM contact WHERE id_contact=? ";
		return jdbcTemplate.update(query, new Object[] { id });
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public Contact getItem(int id) {
		String query = "SELECT * FROM  contact WHERE id_contact=? ";
		return (Contact) jdbcTemplate.queryForObject(query, new Object[] { id },
				new BeanPropertyRowMapper(Contact.class));
	}
	
	public int countItem() {
		String sql = "SELECT COUNT(*) FROM contact ORDER BY id_contact DESC";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}

	
	
}
