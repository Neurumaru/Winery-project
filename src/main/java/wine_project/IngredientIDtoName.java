package wine_project;

import java.sql.ResultSet;
import java.sql.SQLException;

public class IngredientIDtoName extends Ingredient {
	private String product_name;
	public static String searchQuery
			= "SELECT * FROM recipe "
			+ "LEFT OUTER JOIN ingredient "
			+ "ON recipe.recipe_id = ingredient.recipe_id "
			+ "LEFT OUTER JOIN product AS result "
			+ "ON recipe.result_id = result.product_id "
			+ "LEFT OUTER JOIN product "
			+ "ON ingredient.product_id = product.product_id";
	
	public void setData(ResultSet result) {
		super.setData(result);
		try {
			product_name = result.getNString("product.product_name");
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
	
	public String getProduct_name() {
		return product_name;
	}
}
