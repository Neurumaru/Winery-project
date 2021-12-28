package wine_project;

import java.sql.ResultSet;
import java.sql.SQLException;

public class WineryIDtoName extends Winery {
	private String client_name;
	public static String searchQuery
			= "SELECT * FROM winery "
			+ "LEFT OUTER JOIN registration "
			+ "ON winery.registration_id = registration.registration_id "
			+ "LEFT OUTER JOIN registration AS CLI "
			+ "ON winery.client_id = CLI.registration_id";
	
	public void setData(ResultSet result) {
		super.setData(result);
		try {
			client_name = result.getNString("cli.registration_name");
			if(client_name == null)
				client_name = "None";
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
	
	public String getClient_name() {
		return client_name;
	}
}

