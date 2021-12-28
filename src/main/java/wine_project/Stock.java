package wine_project;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class Stock extends Data {
	private int registration_id;
	private int product_id;
	private int quantity;
	private static String searchQuery
		= "SELECT * FROM stock";
	
	public void setData(ResultSet result) {
		try {
			quantity = result.getInt("quantity");
			product_id = result.getInt("product_id");
			registration_id = result.getInt("registration_id");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void setData(int quantity, int product_id, int registration_id) {
		this.quantity = quantity;
		this.product_id = product_id;
		this.registration_id = registration_id;
	}
	
	public String getSearchQuery() {
		return searchQuery + ";";
	}
	
	public String getSearchQuery(String condition) {
		return searchQuery + " WHERE " + condition + ";";
	}

	public List<String> getInsertQuery() {
		List<String> insertQueryList = new ArrayList<String>();
		String insertQuery = "INSERT INTO stock (quantity, registration_id, product_id) "
				+ "VALUES (" + quantity + ", " + registration_id + ", " + product_id + ") "
				+ " ON DUPLICATE KEY UPDATE quantity=quantity+" + quantity + ";";
		insertQueryList.add(insertQuery);
		return insertQueryList;
	}
	
	public List<String> getUpdateQuery() {
		List<String> updateQueryList = new ArrayList<String>();
		String updateQuery = "UPDATE stock SET "
							+ "quantity=" + quantity + " "
							+ "WHERE product_id=" + product_id + " AND registration_id=" + registration_id + ";";
		updateQueryList.add(updateQuery);
		return updateQueryList;
	}

	public int getQuantity() {
		return quantity;
	}

	public int getProduct_id() {
		return product_id;
	}

	public int getRegistration_id() {
		return registration_id;
	}
}
