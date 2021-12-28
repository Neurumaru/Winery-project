package wine_project;

import java.util.List;

public class VineyardInsertWithLand extends Vineyard {
	private int land_id;
	
	public void setData(String registration_name, String owner_name, String owner_number, int fund, int land_id) {
		setData(QueryManager.getAutoIncrement("registration"), registration_name, owner_name, owner_number, fund);
		this.land_id = land_id;
	}
	
	public List<String> getInsertQuery() {
		List<String> insertQueryList = super.getInsertQuery();
		String insertQuery = "UPDATE land SET registration_id_of_proprietor = " + getRegistration_id() + " WHERE land_id = " + land_id + ";";
		insertQueryList.add(insertQuery);
		return insertQueryList;
	}
}
