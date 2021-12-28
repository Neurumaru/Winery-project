package wine_project;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class Product extends Data {
	private int product_id;
	private String product_name;
	private int product_price;
	private boolean product_from_land;
	private static String searchQuery
		= "SELECT * "
		+ "FROM product";
	
	public void setData(ResultSet result) {
		try {
			product_id = result.getInt("product_id");
			product_name = result.getNString("product_name");
			product_price = result.getInt("product_price");
			product_from_land = result.getBoolean("product_from_land");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void setData(int product_id, String product_name, int product_price, boolean product_from_land) {
		this.product_id = product_id;
		this.product_name = product_name;
		this.product_price = product_price;
		this.product_from_land = product_from_land;
	}
	
	public void setData(String product_name, int product_price, boolean product_from_land) {
		setData(0, product_name, product_price, product_from_land);
	}
	
	public String getSearchQuery() {
		return searchQuery + ";";
	}
	
	public String getSearchQuery(String condition) {
		return searchQuery + " WHERE " + condition + ";";
	}
	
	public List<String> getInsertQuery() {
		List<String> insertQueryList = new ArrayList<String>();
		String insertQuery = "INSERT INTO product (product_name, product_price, product_from_land) "
							+ "VALUE ('" + product_name + "', " + product_price;
		if(product_from_land)
			insertQuery += ", 1";
		else
			insertQuery += ", 0";
		insertQuery += ");";
		insertQueryList.add(insertQuery);
		return insertQueryList;
	}
	
	public List<String> getUpdateQuery() {
		List<String> updateQueryList = new ArrayList<String>();
		String updateQuery = "UPDATE product SET product_name=" + product_name + ", product_price='" + product_price + "'";
		if(product_from_land)
			updateQuery += ", product_from_land=1";
		else
			updateQuery += ", product_from_land=0";

		updateQuery += " WHERE product_id=" + product_id + ";";
		updateQueryList.add(updateQuery);
		return updateQueryList;
	}
	
	public int getProduct_id() {
		return product_id;
	}

	public String getProduct_name() {
		return product_name;
	}

	public int getProduct_price() {
		return product_price;
	}

	public boolean isProduct_from_land() {
		return product_from_land;
	}
}
