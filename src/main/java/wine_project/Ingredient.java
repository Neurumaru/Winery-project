package wine_project;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class Ingredient extends Recipe {
	private int product_id;
	private int quantity;
	private String searchQuery
		= "SELECT * FROM recipe "
		+ "JOIN ingredient ON recipe.recipe_id=ingredient.recipe_id";
	
	public void setData(ResultSet result) {
		super.setData(result);
		try {
			product_id = result.getInt("ingredient.product_id");
			quantity = result.getInt("ingredient.quantity");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void setData(int recipe_id, int result_id, int product_id, int quantity) {
		super.setData(recipe_id, result_id);
		this.product_id = product_id;
		this.quantity = quantity;
	}
	
	public String getSearchQuery() {
		return searchQuery + ";";
	}
	
	public String getSearchQuery(String condition) {
		return searchQuery + " WHERE " + condition + ";";
	}
	
	public List<String> getInsertQuery() {
		List<String> insertQueryList = new ArrayList<String>();
		String insertQuery = "INSERT INTO ingredient (recipe_id, product_id, quantity) "
							+ "VALUE (" + getRecipe_id() + ", " + product_id  + ", " + quantity + ");";
		insertQueryList.add(insertQuery);
		return insertQueryList;
	}
	
	public List<String> getUpdateQuery() {
		return null;
	}

	public int getProduct_id() {
		return product_id;
	}

	public int getQuantity() {
		return quantity;
	}
}
