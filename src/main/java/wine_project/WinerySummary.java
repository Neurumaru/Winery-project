package wine_project;

import java.sql.ResultSet;
import java.sql.SQLException;

public class WinerySummary extends WineryIDtoName {
	private boolean product_from_land = false;
	private String product_name = "";
	private int sum_production_quantity = 0;
	private int sum_production_quantity_thisyear = 0;
	private int sum_sell_quantity = 0;
	private int sum_sell_price = 0;
	private int sum_sell_quantity_thisyear = 0;
	private int sum_sell_price_thisyear = 0;
	private int sum_buy_quantity = 0;
	private int sum_buy_price = 0;
	private int sum_buy_quantity_thisyear = 0;
	private int sum_buy_price_thisyear = 0;
	private String searchQuery
		= "SELECT * "
		+ "FROM registration "
		+ "JOIN winery ON registration.registration_id = winery.registration_id "
		+ "LEFT OUTER JOIN registration AS CLI "
		+ "ON winery.client_id = CLI.registration_id "
		+ "JOIN (SELECT product_id, product_name, product_from_land FROM product) AS product "
		+ "LEFT OUTER JOIN (SELECT registration_id_of_production, product.product_id, SUM(quantity) AS sum_production_quantity FROM production JOIN recipe ON production.recipe_id=recipe.recipe_id JOIN product ON recipe.result_id=product.product_id GROUP BY registration_id_of_production, recipe.recipe_id) AS production "
		+ "ON registration.registration_id=production.registration_id_of_production AND product.product_id = production.product_id "
		+ "LEFT OUTER JOIN (SELECT registration_id_of_production, product.product_id, SUM(quantity) AS sum_production_quantity_thisyear FROM production JOIN recipe ON production.recipe_id=recipe.recipe_id JOIN product ON recipe.result_id=product.product_id WHERE DATE(production_date)>=DATE_FORMAT(NOW(), '%Y-01-01') GROUP BY registration_id_of_production, recipe.recipe_id) AS production_thisyear "
		+ "ON registration.registration_id=production_thisyear.registration_id_of_production AND product.product_id = production_thisyear.product_id "
		+ "LEFT OUTER JOIN (SELECT sell_registration_id, product_id, SUM(quantity) AS sum_sell_quantity, SUM(price) AS sum_sell_price FROM trade GROUP BY sell_registration_id, product_id) AS sell_trade "
		+ "ON registration.registration_id=sell_trade.sell_registration_id AND product.product_id=sell_trade.product_id "
		+ "LEFT OUTER JOIN (SELECT sell_registration_id, product_id, SUM(quantity) AS sum_sell_quantity_thisyear, SUM(price) AS sum_sell_price_thisyear FROM trade WHERE DATE(trade_date)>=DATE_FORMAT(NOW(), '%Y-01-01') GROUP BY sell_registration_id, product_id) AS sell_trade_thisyear "
		+ "ON registration.registration_id=sell_trade_thisyear.sell_registration_id AND product.product_id=sell_trade_thisyear.product_id "
		+ "LEFT OUTER JOIN (SELECT buy_registration_id, product_id, SUM(quantity) AS sum_buy_quantity, SUM(price) AS sum_buy_price FROM trade GROUP BY buy_registration_id, product_id) AS buy_trade "
		+ "ON registration.registration_id=buy_trade.buy_registration_id AND product.product_id=buy_trade.product_id "
		+ "LEFT OUTER JOIN (SELECT buy_registration_id, product_id, SUM(quantity) AS sum_buy_quantity_thisyear, SUM(price) AS sum_buy_price_thisyear FROM trade WHERE DATE(trade_date)>=DATE_FORMAT(NOW(), '%Y-01-01') GROUP BY buy_registration_id, product_id) AS buy_trade_thisyear "
		+ "ON registration.registration_id=buy_trade_thisyear.buy_registration_id AND product.product_id=buy_trade_thisyear.product_id ";

	public void setData(ResultSet result) {
		super.setData(result);
		try {
			product_from_land = result.getBoolean("product.product_from_land");
			product_name = result.getNString("product.product_name");
			sum_production_quantity = result.getInt("sum_production_quantity");
			sum_production_quantity_thisyear = result.getInt("sum_production_quantity_thisyear");
			sum_sell_quantity = result.getInt("sum_sell_quantity");
			sum_sell_price = result.getInt("sum_sell_price");
			sum_sell_quantity_thisyear = result.getInt("sum_sell_quantity_thisyear");
			sum_sell_price_thisyear = result.getInt("sum_sell_price_thisyear");
			sum_buy_quantity = result.getInt("sum_buy_quantity");
			sum_buy_price = result.getInt("sum_buy_price");
			sum_buy_quantity = result.getInt("sum_buy_quantity");
			sum_buy_quantity_thisyear = result.getInt("sum_buy_quantity_thisyear");
			sum_buy_price_thisyear = result.getInt("sum_buy_price_thisyear");
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
	public String getProduct_name() {
		return product_name;
	}

	public int getSum_production_quantity() {
		return sum_production_quantity;
	}

	public int getSum_sell_quantity() {
		return sum_sell_quantity;
	}

	public int getSum_sell_price() {
		return sum_sell_price;
	}

	public int getSum_sell_quantity_thisyear() {
		return sum_sell_quantity_thisyear;
	}

	public int getSum_sell_price_thisyear() {
		return sum_sell_price_thisyear;
	}

	public int getSum_buy_quantity() {
		return sum_buy_quantity;
	}

	public int getSum_buy_price() {
		return sum_buy_price;
	}

	public int getSum_buy_quantity_thisyear() {
		return sum_buy_quantity_thisyear;
	}

	public int getSum_buy_price_thisyear() {
		return sum_buy_price_thisyear;
	}

	public int getSum_production_quantity_thisyear() {
		return sum_production_quantity_thisyear;
	}

	public boolean isProduct_from_land() {
		return product_from_land;
	}
}
