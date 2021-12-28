package wine_project;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ProductionIDtoName extends Production {
	private String registration_name;
	public static String searchQuery
			= "SELECT * FROM production "
			+ "LEFT OUTER JOIN registration "
			+ "ON production.registration_id_of_production=registration.registration_id";
	
	public void setData(ResultSet result) {
		super.setData(result);
		try {
			registration_name = result.getNString("registration.registration_name");
			if(registration_name == null)
				registration_name = "None";
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
}
