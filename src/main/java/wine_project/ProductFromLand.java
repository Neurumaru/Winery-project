package wine_project;

public class ProductFromLand extends Product {
	private static String searchQuery
	= "SELECT * "
	+ "FROM product "
	+ "WHERE product_from_land = 1";

	public String getSearchQuery() {
		return searchQuery + ";";
	}
	
	public String getSearchQuery(String condition) {
		return searchQuery + " " + condition + ";";
	}
}
