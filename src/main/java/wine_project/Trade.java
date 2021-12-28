package wine_project;

import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class Trade extends Data {
	private int trade_id;
	private int product_id;
	private int quantity;
	private int price;
	private Timestamp trade_date;
	private int sell_registration_id;
	private int buy_registration_id;
	private String searchQuery
		= "SELECT * FROM trade";
	
	public void setData(ResultSet result) {
		try {
			trade_id = result.getInt("trade_id");
			product_id = result.getInt("product_id");
			quantity = result.getInt("quantity");
			price = result.getInt("price");
			trade_date = result.getTimestamp("trade_date");
			sell_registration_id = result.getInt("sell_registration_id");
			buy_registration_id = result.getInt("buy_registration_id");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void setData(int trade_id, int product_id, int quantity, int price, Timestamp trade_date, int sell_registration_id, int buy_registration_id) {
		this.trade_id = trade_id;
		this.product_id = product_id;
		this.quantity = quantity;
		this.price = price;
		this.trade_date = trade_date;
		this.sell_registration_id = sell_registration_id;
		this.buy_registration_id = buy_registration_id;
	}
	
	public void setData(int product_id, int quantity, int price, int sell_registration_id, int buy_registration_id) {
		this.setData(0, product_id, quantity, price, null, sell_registration_id, buy_registration_id);
	}

	public String getSearchQuery() {
		return searchQuery + ";";
	}
	
	public String getSearchQuery(String condition) {
		return searchQuery + " WHERE " + condition + ";";
	}

	public List<String> getInsertQuery() {
		List<String> insertQueryList = new ArrayList<String>();
		String insertQuery = "INSERT INTO trade (product_id, quantity, price, sell_registration_id, buy_registration_id)"
							+ "VALUE (" + product_id + ", " + quantity + ", " + price + ", " + sell_registration_id + ", " + (buy_registration_id != 0 ? buy_registration_id : "NULL") + ");";
		insertQueryList.add(insertQuery);
		
		List<Data> stock = QueryManager.getDataWithCondition(Stock.class, "registration_id=" + sell_registration_id + " AND product_id=" + product_id);
		if(stock.size() == 0 || ((Stock) stock.get(0)).getQuantity() < quantity) {
			insertQueryList.clear();
			return insertQueryList;
		}
		
		insertQuery = "INSERT INTO stock (registration_id, product_id) "
					+ "VALUE (" + sell_registration_id + ", " + product_id + ") "
					+ "ON DUPLICATE KEY UPDATE quantity=quantity-" + quantity + ";";
		insertQueryList.add(insertQuery);
		if(buy_registration_id != 0) {
			insertQuery = "INSERT INTO stock (quantity, registration_id, product_id) "
						+ "VALUE (" + quantity + ", " + buy_registration_id + ", " + product_id + ") "
						+ "ON DUPLICATE KEY UPDATE quantity=quantity+" + quantity + ";";
			insertQueryList.add(insertQuery);
		}
		insertQuery = "UPDATE registration SET "
					+ "fund=fund+" + price + " "
					+ "WHERE registration_id=" + sell_registration_id + ";";
		insertQueryList.add(insertQuery);
		if(buy_registration_id != 0) {
			List<Data> registration = QueryManager.getDataWithCondition(Registration.class, "registration_id=" + buy_registration_id);
			if(registration.size() == 0 || ((Registration) registration.get(0)).getFund() < price) {
				insertQueryList.clear();
				return insertQueryList;
			}
			
			insertQuery = "UPDATE registration SET "
						+ "fund=fund-" + price + " "
						+ "WHERE registration_id=" + buy_registration_id + ";";
			insertQueryList.add(insertQuery);
		}
						
		return insertQueryList;
	}

	public List<String> getUpdateQuery() {
		List<String> updateQueryList = new ArrayList<String>();
		String updateQuery = "UPDATE trade SET "
							+ "product_id=" + product_id + ", "
							+ "quantity=" + quantity + ", "
							+ "price=" + price + ", "
							+ "sell_registration_id=" + sell_registration_id + ", "
							+ "buy_registration_id=" + (buy_registration_id != 0 ? buy_registration_id : "NULL") + ", "
							+ "trade_date='" + trade_date + "' "
							+ "WHERE trade_id=" + trade_id + ";";
		updateQueryList.add(updateQuery);
		return updateQueryList;
	}

	public int getTrade_id() {
		return trade_id;
	}

	public int getProduct_id() {
		return product_id;
	}

	public int getQuantity() {
		return quantity;
	}

	public int getPrice() {
		return price;
	}

	public Timestamp getTrade_date() {
		return trade_date;
	}

	public int getSell_registration_id() {
		return sell_registration_id;
	}

	public int getBuy_registration_id() {
		return buy_registration_id;
	}
}
