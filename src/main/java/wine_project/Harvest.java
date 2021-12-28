package wine_project;

import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class Harvest extends Data {
	private int harvest_id;
	private int quantity;
	private Timestamp harvest_date;
	private int product_id;
	private int land_id;
	private int registration_id;
	private static String searchQuery
		= "SELECT * "
		+ "FROM product";
	
	public void setData(ResultSet result) {
		try {
			harvest_id = result.getInt("harvest_id");
			quantity = result.getInt("quantity");
			harvest_date = result.getTimestamp("harvest_date");
			product_id = result.getInt("product_id");
			land_id = result.getInt("land_id");
			registration_id = result.getInt("registration_id");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void setData(int quantity, int product_id, int land_id, int registration_id) {
		setData(0, quantity, null, product_id, land_id, registration_id);
	}
	
	public void setData(int harvest_id, int quantity, Timestamp harvest_date, int product_id, int land_id, int registration_id) {
		this.quantity = quantity;
		this.product_id = product_id;
		this.land_id = land_id;
		this.registration_id = registration_id;
		this.harvest_id = harvest_id;
		this.harvest_date = harvest_date;
	}
	
	public String getSearchQuery() {
		return searchQuery + ";";
	}
	
	public String getSearchQuery(String condition) {
		return searchQuery + " WHERE " + condition + ";";
	}
	
	public List<String> getInsertQuery() {
		List<String> insertQueryList = new ArrayList<String>();
		String insertQuery = "INSERT INTO harvest (quantity, product_id, land_id, registration_id) "
							+ "VALUE (" + quantity + ", " + product_id + ", " + land_id  + ", " + registration_id + ");";
		insertQueryList.add(insertQuery);
		insertQuery = "INSERT INTO stock (quantity, registration_id, product_id) "
					+ "VALUE (" + quantity + ", " + registration_id + ", " + product_id + ") "
					+ "ON DUPLICATE KEY UPDATE quantity=quantity+" + quantity + ";";
		insertQueryList.add(insertQuery);
		return insertQueryList;
	}
	
	public List<String> getUpdateQuery() {
		List<String> updateQueryList = new ArrayList<String>();
		String updateQuery = "UPDATE harvest SET "
							+ "quantity=" + quantity + ", "
							+ "product_id=" + product_id + ", "
							+ "land_id=" + land_id + ", "
							+ "registration_id=" + registration_id + ", "
							+ "harvest_date='" + harvest_date + "' "
							+ "WHERE harvest_id=" + harvest_id + ";";
		updateQueryList.add(updateQuery);
		return updateQueryList;
	}

	public int getHarvest_id() {
		return harvest_id;
	}

	public int getQuantity() {
		return quantity;
	}

	public Timestamp getHarvest_date() {
		return harvest_date;
	}

	public int getProduct_id() {
		return product_id;
	}

	public int getRegistration_id() {
		return registration_id;
	}

	public int getLand_id() {
		return land_id;
	}
}
