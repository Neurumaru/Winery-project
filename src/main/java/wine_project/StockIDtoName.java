package wine_project;

import java.sql.ResultSet;
import java.sql.SQLException;

public class StockIDtoName extends Stock {
	private String registration_name;
	private String product_name;
	private String searchQuery
			= "SELECT * FROM stock "
			+ "LEFT OUTER JOIN registration "
			+ "ON stock.registration_id = registration.registration_id "
			+ "LEFT OUTER JOIN product "
			+ "ON stock.product_id = product.product_id";
	
	public void setData(ResultSet result) {
		super.setData(result);
		try {
			registration_name = result.getNString("registration_name");
			if(registration_name == null)
				registration_name = "None";
			product_name = result.getNString("product_name");
			if(product_name == null)
				product_name = "None";
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public String getSearchQuery() {
		return searchQuery + ";";
	}
	
	public String getSearchQuery(String condition) {
		return searchQuery + " WHERE " + condition + ";";
	}
	
	public String getRegistration_name() {
		return registration_name;
	}

	public String getProduct_name() {
		return product_name;
	}
}
