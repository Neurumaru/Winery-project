package wine_project;

import java.sql.ResultSet;
import java.sql.SQLException;

public class TradeIDtoName extends Trade {
	private String sell_registration_name;
	private String buy_registration_name;
	private String product_name;
	public static String searchQuery
			= "SELECT * FROM trade "
			+ "LEFT OUTER JOIN registration as buy "
			+ "ON trade.buy_registration_id = buy.registration_id "
			+ "LEFT OUTER JOIN registration as sell "
			+ "ON trade.sell_registration_id = sell.registration_id "
			+ "LEFT OUTER JOIN product "
			+ "ON trade.product_id = product.product_id";
	
	public void setData(ResultSet result) {
		super.setData(result);
		try {
			sell_registration_name = result.getNString("sell.registration_name");
			if(sell_registration_name == null)
				sell_registration_name = "None";
			buy_registration_name = result.getNString("buy.registration_name");
			if(buy_registration_name == null)
				buy_registration_name = "None";
			product_name = result.getNString("product_name");
			if(product_name == null)
				product_name = "None";
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

	public String getSell_registration_name() {
		return sell_registration_name;
	}

	public String getBuy_registration_name() {
		return buy_registration_name;
	}

	public String getProduct_name() {
		return product_name;
	}
}

