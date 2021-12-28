package wine_project;

import java.sql.ResultSet;
import java.util.List;

public class Vineyard extends Registration {
	private static String searchQuery
		= "SELECT * "
		+ "FROM registration "
		+ "JOIN vineyard ON registration.registration_id = vineyard.registration_id";
	
	public void setData(ResultSet result) {
		super.setData(result);
	}
	
	public void setData(int registration_id, String registration_name, String owner_name, String owner_number, int fund) {
		super.setData(registration_id, registration_name, owner_name, owner_number, fund);
	}
	public void setData(String registration_name, String owner_name, String owner_number, int fund) {
		setData(QueryManager.getAutoIncrement("registration"), registration_name, owner_name, owner_number, fund);
	}
	
	public String getSearchQuery() {
		return searchQuery + ";";
	}
	
	public String getSearchQuery(String condition) {
		return searchQuery + " WHERE " + condition + ";";
	}
	
	public List<String> getInsertQuery() {
		List<String> insertQueryList = super.getInsertQuery();
		String insertQuery = "INSERT INTO vineyard (registration_id) VALUE (" + getRegistration_id() + ");";
		insertQueryList.add(insertQuery);
		return insertQueryList;
	}

	public List<String> getUpdateQuery() {
		List<String> updateQueryList = super.getUpdateQuery();
		return updateQueryList;
	}
}
