package wine_project;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class WineryRank extends Data {
	private int rank;
	private double price_multiplier;
	private static String searchQuery
		= "SELECT * FROM winery_rank";
	
	public void setData(ResultSet result) {
		try {
			rank = result.getInt("rank");
			price_multiplier = result.getDouble("price_multiplier");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void setData(int rank, double price_multiplier) {
		this.rank = rank;
		this.price_multiplier = price_multiplier;
	}
	
	public String getSearchQuery() {
		return searchQuery + ";";
	}
	
	public String getSearchQuery(String condition) {
		return searchQuery + " WHERE " + condition + ";";
	}
	
	public List<String> getInsertQuery() {
		List<String> insertQueryList = new ArrayList<String>();
		String insertQuery = "INSERT INTO winery_rank (rank, price_multiplier) "
								+ "VALUE (" + rank + ", " + price_multiplier + ");";
		insertQueryList.add(insertQuery);
		return insertQueryList;
	}
	
	public List<String> getUpdateQuery() {
		List<String> updateQueryList = new ArrayList<String>();
		String updateQuery = "UPDATE winery_rank SET price_multiplier=" + price_multiplier;

		updateQuery += " WHERE rank=" + rank + ";";
		updateQueryList.add(updateQuery);
		return updateQueryList;
	}

	public int getRank() {
		return rank;
	}

	public double getPrice_multiplier() {
		return price_multiplier;
	}
}
