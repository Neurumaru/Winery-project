package wine_project;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

public class Main {
	public static void main(String[] args) {
		Connection conn = null;
		Statement stmt = null;
		
		String jdbcDriver = "jdbc:mariadb://localhost:3306/wine_project";
		String dbUser = "root";
		String dbPass = "6659";
		
		String [] create_table = {
				"CREATE TABLE IF NOT EXISTS registration"
				+ "("
				+ "registration_id INT NOT NULL AUTO_INCREMENT,"
				+ "registration_name VARCHAR(50),"
				+ "owner_name VARCHAR(50),"
				+ "owner_number VARCHAR(20),"
				+ "fund INT DEFAULT 0,"
				+ "PRIMARY KEY (registration_id)"
				+ ");",
				
				"CREATE TABLE IF NOT EXISTS vineyard"
				+ "("
				+ "registration_id INT NOT NULL,"
				+ "PRIMARY KEY (registration_id),"
				+ "FOREIGN KEY (registration_id) REFERENCES registration (registration_id) ON DELETE CASCADE"
				+ ");",
				
				"CREATE TABLE IF NOT EXISTS winery_rank"
				+ "("
				+ "rank INT NOT NULL,"
				+ "price_multiplier DOUBLE NOT NULL,"
				+ "PRIMARY KEY (rank)"
				+ ");",
				
				"CREATE TABLE IF NOT EXISTS winery"
				+ "("
				+ "registration_id INT NOT NULL,"
				+ "client_id INT,"
				+ "rank INT NOT NULL,"
				+ "PRIMARY KEY (registration_id),"
				+ "FOREIGN KEY (registration_id) REFERENCES registration (registration_id) ON DELETE CASCADE,"
				+ "FOREIGN KEY (client_id) REFERENCES vineyard (registration_id) ON DELETE SET NULL,"
				+ "FOREIGN KEY (rank) REFERENCES winery_rank (rank)"
				+ ");",
				
				"CREATE TABLE IF NOT EXISTS product"
				+ "("
				+ "product_id INT NOT NULL AUTO_INCREMENT,"
				+ "product_name VARCHAR(50) NOT NULL,"
				+ "product_price INT NOT NULL,"
				+ "product_from_land BOOLEAN DEFAULT FALSE,"
				+ "PRIMARY KEY (product_id)"
				+ ");",
				
				"CREATE TABLE IF NOT EXISTS land"
				+ "("
				+ "land_id INT NOT NULL AUTO_INCREMENT,"
				+ "location VARCHAR(200) NOT NULL,"
				+ "area	INT DEFAULT 0,"
				+ "registration_id_of_proprietor INT,"
				+ "PRIMARY KEY (land_id),"
				+ "FOREIGN KEY (registration_id_of_proprietor) REFERENCES registration (registration_id) ON DELETE SET NULL"
				+ ");",
				
				"CREATE TABLE IF NOT EXISTS land_product"
				+ "("
				+ "land_id INT NOT NULL,"
				+ "product_id INT,"
				+ "PRIMARY KEY (land_id),"
				+ "FOREIGN KEY (land_id) REFERENCES land (land_id) ON DELETE CASCADE,"
				+ "FOREIGN KEY (product_id) REFERENCES product (product_id) ON DELETE SET NULL"
				+ ");",
				
				"CREATE TABLE IF NOT EXISTS recipe"
				+ "("
				+ "recipe_id INT NOT NULL AUTO_INCREMENT,"
				+ "result_id INT NOT NULL,"
				+ "PRIMARY KEY (recipe_id),"
				+ "FOREIGN KEY (result_id) REFERENCES product (product_id) ON DELETE CASCADE"
				+ ");",
				
				"CREATE TABLE IF NOT EXISTS ingredient"
				+ "("
				+ "recipe_id INT NOT NULL,"
				+ "product_id INT NOT NULL,"
				+ "quantity INT DEFAULT 0,"
				+ "PRIMARY KEY (recipe_id, product_id),"
				+ "FOREIGN KEY (recipe_id) REFERENCES recipe (recipe_id) ON DELETE CASCADE,"
				+ "FOREIGN KEY (product_id) REFERENCES product (product_id) ON DELETE CASCADE"
				+ ");",
				
				"CREATE TABLE IF NOT EXISTS stock"
				+ "("
				+ "quantity INT DEFAULT 0,"
				+ "registration_id INT NOT NULL,"
				+ "product_id INT NOT NULL,"
				+ "PRIMARY KEY (registration_id, product_id),"
				+ "FOREIGN KEY (registration_id) REFERENCES registration (registration_id) ON DELETE CASCADE,"
				+ "FOREIGN KEY (product_id) REFERENCES product (product_id) ON DELETE CASCADE"
				+ ");",
				
				"CREATE TABLE IF NOT EXISTS trade"
				+ "("
				+ "trade_id INT NOT NULL AUTO_INCREMENT,"
				+ "product_id INT,"
				+ "quantity INT DEFAULT 0,"
				+ "price INT DEFAULT 0,"
				+ "trade_date TIMESTAMP,"
				+ "sell_registration_id INT,"
				+ "buy_registration_id INT,"
				+ "PRIMARY KEY (trade_id),"
				+ "FOREIGN KEY (product_id) REFERENCES product (product_id) ON DELETE SET NULL,"
				+ "FOREIGN KEY (sell_registration_id) REFERENCES registration (registration_id) ON DELETE SET NULL,"
				+ "FOREIGN KEY (buy_registration_id) REFERENCES registration (registration_id) ON DELETE SET NULL"
				+ ");",
				
				"CREATE TABLE IF NOT EXISTS production"
				+ "("
				+ "production_id INT NOT NULL AUTO_INCREMENT,"
				+ "quantity INT DEFAULT 0,"
				+ "production_date TIMESTAMP,"
				+ "recipe_id INT,"
				+ "registration_id_of_production INT,"
				+ "PRIMARY KEY (production_id),"
				+ "FOREIGN KEY (recipe_id) REFERENCES recipe (recipe_id) ON DELETE SET NULL,"
				+ "FOREIGN KEY (registration_id_of_production) REFERENCES winery (registration_id) ON DELETE SET NULL"
				+ ");",
				
				"CREATE TABLE IF NOT EXISTS harvest"
				+ "("
				+ "harvest_id INT NOT NULL AUTO_INCREMENT,"
				+ "quantity INT DEFAULT 0,"
				+ "harvest_date TIMESTAMP,"
				+ "product_id INT,"
				+ "land_id INT,"
				+ "registration_id INT,"
				+ "PRIMARY KEY (harvest_id),"
				+ "FOREIGN KEY (product_id) REFERENCES product (product_id) ON DELETE SET NULL,"
				+ "FOREIGN KEY (land_id) REFERENCES land (land_id) ON DELETE SET NULL,"
				+ "FOREIGN KEY (registration_id) REFERENCES registration (registration_id) ON DELETE SET NULL"
				+ ");"
		};
		
		String [] harvest_attribute = {
				"quantity", "product_id", "land_id", "registration_id"};
		String [][] harvest_values = {
				{"30", "1", "1", "1"},
				{"30", "1", "2", "1"},
				{"80", "2", "3", "1"}};
		String [] ingredient_attribute = {
				"recipe_id", "product_id", "quantity"};
		String [][] ingredient_values = {
				{"1", "1", "1"},
				{"2", "2", "1"},
				{"3", "3", "1"},
				{"3", "4", "1"},
				{"4", "3", "2"},
				{"4", "4", "1"}};
		String [] land_attribute = {
				"land_id", "location", "area", "registration_id_of_proprietor"};
		String [][] land_values = {
				{"1", "Èï¾÷¸é", "40", "1"},
				{"2", "Èï¾÷¸é", "30", "1"},
				{"3", "Èï¾÷¸®", "80", "1"},
				{"4", "¹«½Çµ¿", "50", "2"}};
		String [] land_product_attribute = {
				"land_id", "product_id"};
		String [][] land_product_values = {
				{"1", "1"},
				{"2", "1"},
				{"3", "2"}};
		String [] product_attribute1 = {
				"product_id", "product_name", "product_price", "product_from_land"};
		String [][] product_values1 = {
				{"1", "Red Grape", "1", "1"},
				{"2", "White Grape", "1", "1"}};
		String [] product_attribute2 = {
				"product_id", "product_name", "product_price"};
		String [][] product_values2 = {
				{"3", "Red Wine", "10"},
				{"4", "White Wine", "10"},
				{"5", "Blush Wine", "14"},
				{"6", "Sparkling Wine", "20"}};
		String [] production_attribute = {
				"quantity", "recipe_id", "registration_id_of_production"};
		String [][] production_values = {
				{"5", "1", "2"}};
		String [] recipe_attribute = {
				"recipe_id", "result_id"};
		String [][] recipe_values = {
				{"1", "3"},
				{"2", "4"},
				{"3", "5"},
				{"4", "6"}};
		String [] registration_attribute = {
				"registration_id", "registration_name", "owner_name", "owner_number", "fund"};
		String [][] registration_values = {
				{"1", "Yonsei Computer Vineyard", "Kim", "010-1234-5678", "1000"},
				{"2", "Yonsei Computer Winery", "Kim", "010-1234-5678", "1000"}};
		String [] stock_attribute = {
				"quantity", "registration_id", "product_id"};
		String [][] stock_values = {
				{"30", "1", "1"},
				{"50", "1", "2"},
				{"30", "2", "1"},
				{"30", "2", "2"}};
		String [] trade_attribute = {
				"product_id", "price", "quantity", "sell_registration_id", "buy_registration_id"};
		String [][] trade_values = {
				{"1", "30", "30", "1", "2"},
				{"2", "30", "30", "1", "2"}};
		String [] vineyard_attribute = {
				"registration_id"};
		String [][] vineyard_values = {
				{"1"}};
		String [] winery_attribute = {
				"registration_id", "client_id", "rank"};
		String [][] winery_values = {
				{"2", "1", "1"}};
		String [] winery_rank_attribute = {
				"rank", "price_multiplier"};
		String [][] winery_rank_values = {
				{"1", "2.0"},
				{"2", "1.0"},
				{"3", "0.5"}};
		
		try {			
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			conn.setAutoCommit(false);
			stmt = conn.createStatement();

			for(int i = 0; i < create_table.length; i++)
				stmt.executeUpdate(create_table[i]);
		
			executeUpdatePreStmt(conn, "registration", registration_attribute, registration_values);
			executeUpdatePreStmt(conn, "vineyard", vineyard_attribute, vineyard_values);
			executeUpdatePreStmt(conn, "winery_rank", winery_rank_attribute, winery_rank_values);
			executeUpdatePreStmt(conn, "winery", winery_attribute, winery_values);
			executeUpdatePreStmt(conn, "product", product_attribute1, product_values1);
			executeUpdatePreStmt(conn, "product", product_attribute2, product_values2);
			executeUpdatePreStmt(conn, "land", land_attribute, land_values);
			executeUpdatePreStmt(conn, "land_product", land_product_attribute, land_product_values);
			executeUpdatePreStmt(conn, "recipe", recipe_attribute, recipe_values);
			executeUpdatePreStmt(conn, "ingredient", ingredient_attribute, ingredient_values);
			executeUpdatePreStmt(conn, "stock", stock_attribute, stock_values);
			executeUpdatePreStmt(conn, "trade", trade_attribute, trade_values);
			executeUpdatePreStmt(conn, "production", production_attribute, production_values);
			executeUpdatePreStmt(conn, "harvest", harvest_attribute, harvest_values);

			conn.commit();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.rollback();
				conn.setAutoCommit(true);
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}	
	}
	
	private static void executeUpdatePreStmt(Connection conn, String table, String [] attribute, String [][] values) {
		PreparedStatement preStmt = null;
		try {
			preStmt = conn.prepareStatement(generateInsertPreStmt(table, attribute));
			
			for(String [] value : values) {
				for(int i = 0; i < value.length; i++)
					preStmt.setString(i+1, value[i]);
				preStmt.executeUpdate();
				preStmt.clearParameters();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				preStmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	private static String generateInsertPreStmt(String table, String [] attribute) {
		String result = "INSERT INTO " + table + ""
				+ " (" + attribute[0];
		for(int i = 1; i < attribute.length; i++)
			result += ", " + attribute[i];
		result += ") values(?";
		for(int i = 1; i < attribute.length; i++)
			result += ", ?";
		result += ");";
		return result;
	}
}
