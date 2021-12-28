package wine_project;

import java.sql.ResultSet;
import java.util.List;

public class Winery extends Registration {
	private int client_id;
	private int rank;
	private static String searchQuery
		= "SELECT * "
		+ "FROM registration "
		+ "JOIN winery ON registration.registration_id = winery.registration_id";
	
	public void setData(ResultSet result) {
		super.setData(result);
		try {
			client_id = result.getInt("client_id");
			rank = result.getInt("rank");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void setData(int registration_id, String registration_name, String owner_name, String owner_number, int fund, int client_id, int rank) {
		super.setData(registration_id, registration_name, owner_name, owner_number, fund);
		this.client_id = client_id;
		this.rank = rank;
	}
	public void setData(String registration_name, String owner_name, String owner_number, int fund, int client_id, int rank) {
		setData(QueryManager.getAutoIncrement("registration"), registration_name, owner_name, owner_number, fund, client_id, rank);
	}
	
	public String getSearchQuery() {
		return searchQuery + ";";
	}
	
	public String getSearchQuery(String condition) {
		return searchQuery + " WHERE " + condition + ";";
	}
	
	public List<String> getInsertQuery() {
		List<String> insertQueryList = super.getInsertQuery();
		String insertQuery = "INSERT INTO winery (registration_id, client_id, rank) VALUE (" + getRegistration_id() + ", " + client_id + ", " + rank + ");";
		insertQueryList.add(insertQuery);
		return insertQueryList;
	}

	public List<String> getUpdateQuery() {
		List<String> updateQueryList = super.getUpdateQuery();
		String updateQuery = "UPDATE winery SET client_id=" + client_id + ", rank=" + rank + " WHERE registration_id=" + getRegistration_id() + ";";
		updateQueryList.add(updateQuery);
		return updateQueryList;
	}
	
	public int getClient_id() {
		return client_id;
	}
	
	public int getRank() {
		return rank;
	}
}
