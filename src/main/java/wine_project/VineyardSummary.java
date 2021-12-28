package wine_project;

import java.sql.ResultSet;
import java.sql.SQLException;

public class VineyardSummary extends Vineyard {
	private int sum_area = 0;
	private String product_name = "";
	private int sum_harvest = 0;
	private int sum_harvest_thisyear = 0;
	private int sum_trade = 0;
	private int sum_trade_thisyear = 0;
	private static String searchQuery
		= "SELECT * "
		+ "FROM registration "
		+ "JOIN vineyard "
		+ "ON registration.registration_id = vineyard.registration_id "
		+ "JOIN (SELECT product_id, product_name FROM product WHERE product_from_land=1) AS product "
		+ "LEFT OUTER JOIN (SELECT registration_id_of_proprietor, SUM(land.area) AS sum_area FROM land GROUP BY registration_id_of_proprietor) AS land "
		+ "ON registration.registration_id = land.registration_id_of_proprietor "
		+ "LEFT OUTER JOIN (SELECT registration_id, product_id, SUM(quantity) AS sum_harvest FROM harvest GROUP BY registration_id, product_id) AS harvest "
		+ "ON registration.registration_id = harvest.registration_id AND product.product_id = harvest.product_id "
		+ "LEFT OUTER JOIN (SELECT registration_id, product_id, SUM(quantity) AS sum_harvest_thisyear FROM harvest WHERE DATE(harvest_date)>=DATE_FORMAT(NOW(), '%Y-01-01') GROUP BY registration_id, product_id) AS harvestThisYear "
		+ "ON registration.registration_id = harvestThisYear.registration_id AND product.product_id = harvestThisYear.product_id "
		+ "LEFT OUTER JOIN (SELECT sell_registration_id, product_id, SUM(quantity) AS sum_trade FROM trade GROUP BY sell_registration_id, product_id) AS trade "
		+ "ON registration.registration_id = trade.sell_registration_id AND product.product_id = trade.product_id "
		+ "LEFT OUTER JOIN (SELECT sell_registration_id, product_id, SUM(quantity) AS sum_trade_thisyear FROM trade WHERE DATE(trade_date)>=DATE_FORMAT(NOW(), '%Y-01-01') GROUP BY sell_registration_id, product_id) AS tradeThisYear "
		+ "ON registration.registration_id = tradeThisYear.sell_registration_id AND product.product_id = tradeThisYear.product_id";
	
	public void setData(ResultSet result) {
		super.setData(result);
		try {
			sum_area = result.getInt("sum_area");
			product_name = result.getNString("product.product_name");
			sum_harvest = result.getInt("sum_harvest");
			sum_harvest_thisyear = result.getInt("sum_harvest_thisyear");
			sum_trade = result.getInt("sum_trade");
			sum_trade_thisyear = result.getInt("sum_trade_thisyear");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public String getSearchQuery() {
		return searchQuery + " ORDER BY registration.registration_id, product.product_id;";
	}
	
	public String getSearchQuery(String condition) {
		return searchQuery + " WHERE " + condition + " ORDER BY registration.registration_id, product.product_id;";
	}
	
	public int getSum_area() {
		return sum_area;
	}

	public int getSum_harvest() {
		return sum_harvest;
	}

	public int getSum_harvest_thisyear() {
		return sum_harvest_thisyear;
	}

	public int getSum_trade() {
		return sum_trade;
	}

	public int getSum_trade_thisyear() {
		return sum_trade_thisyear;
	}

	public String getProduct_name() {
		return product_name;
	}
}
