package wine_project;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class Registration extends Data {
	private int registration_id;
	private String registration_name;
	private String owner_name;
	private String owner_number;
	private int fund;
	private static String searchQuery
		= "SELECT * FROM registration";
	
	public void setData(ResultSet result) {
		try {
			registration_id = result.getInt("registration_id");
			registration_name = result.getNString("registration.registration_name");
			owner_name = result.getNString("registration.owner_name");
			owner_number = result.getNString("registration.owner_number");
			fund = result.getInt("registration.fund");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void setData(int registration_id, String registration_name, String owner_name, String owner_number, int fund) {
		this.registration_id = registration_id;
		this.registration_name = registration_name;
		this.owner_name = owner_name;
		this.owner_number = owner_number;
		this.fund = fund;
	}
	public void setData(String registration_name, String owner_name, String owner_number, int fund) {
		setData(0, registration_name, owner_name, owner_number, fund);
	}
	
	public String getSearchQuery() {
		return searchQuery + ";";
	}
	
	public String getSearchQuery(String condition) {
		return searchQuery + " WHERE " + condition + ";";
	}
	
	public List<String> getInsertQuery() {
		List<String> insertQueryList = new ArrayList<String>();
		String insertQuery = "INSERT INTO registration (registration_id, registration_name, owner_name, owner_number, fund)"
								+ " VALUE (" + registration_id;
		if(registration_name != "")
			insertQuery += ", '" + registration_name + "'";
		else
			insertQuery += ", null";
		if(owner_name != "")
			insertQuery += ", '" + owner_name + "'";
		else
			insertQuery += ", null";
		if(owner_number != "")
			insertQuery += ", '" + owner_number + "'";
		else
			insertQuery += ", null";
		insertQuery += ", " + fund + ");";
		insertQueryList.add(insertQuery);
		return insertQueryList;
	}
	
	public List<String> getUpdateQuery() {
		List<String> updateQueryList = new ArrayList<String>();
		String updateQuery = "UPDATE registration SET";
		
		if(registration_name != "")
			updateQuery += " registration_name='" + registration_name + "'";
		else
			updateQuery += ", null";
		if(owner_name != "")
			updateQuery += ", owner_name='" + owner_name + "'";
		else
			updateQuery += ", null";
		if(owner_number != "")
			updateQuery += ", owner_number='" + owner_number + "'";
		else
			updateQuery += ", null";
		updateQuery += ", fund=" + fund;
		updateQuery += " WHERE registration_id=" + registration_id + ";";
		updateQueryList.add(updateQuery);
		return updateQueryList;
	}

	public int getRegistration_id() {
		return registration_id;
	}

	public String getRegistration_name() {
		return registration_name;
	}

	public String getOwner_name() {
		return owner_name;
	}

	public String getOwner_number() {
		return owner_number;
	}

	public int getFund() {
		return fund;
	}
	
	public void setFund(int fund) {
		this.fund = fund;
	}
}
