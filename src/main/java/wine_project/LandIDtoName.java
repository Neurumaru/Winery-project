package wine_project;

import java.sql.ResultSet;
import java.sql.SQLException;

public class LandIDtoName extends Land {
	private String registration_name;
	private int fund;
	private String product_name;
	public static String searchQuery
			= "SELECT * FROM land "
			+ "LEFT OUTER JOIN land_product "
			+ "ON land.land_id = land_product.land_id "
			+ "LEFT OUTER JOIN registration "
			+ "ON land.registration_id_of_proprietor = registration.registration_id "
			+ "LEFT OUTER JOIN product "
			+ "ON land_product.product_id = product.product_id";
	
	public void setData(ResultSet result) {
		super.setData(result);
		try {
			registration_name = result.getNString("registration_name");
			if(registration_name == null)
				registration_name = "None";
			product_name = result.getNString("product_name");
			if(product_name == null)
				product_name = "None";
			fund = result.getInt("fund");
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

	public int getFund() {
		return fund;
	}
}

