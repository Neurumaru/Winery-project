package wine_project;

import java.sql.ResultSet;

public class LandNoOwner extends Land {
	public static String searchQuery
			= "SELECT * FROM land "
			+ "LEFT OUTER JOIN land_product "
			+ "ON land.land_id=land_product.land_id "
			+ "WHERE land.registration_id_of_proprietor IS NULL";
	
	public void setData(ResultSet result) {
		super.setData(result);
	}
	
	public String getSearchQuery() {
		return searchQuery + ";";
	}
	
	public String getSearchQuery(String condition) {
		return searchQuery + " AND " + condition + ";";
	}
}
