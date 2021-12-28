package wine_project;

import java.sql.ResultSet;
import java.sql.SQLException;

public class RecipeIDtoName extends Recipe {
	private String result_name;
	public static String searchQuery
			= "SELECT * FROM recipe "
			+ "LEFT OUTER JOIN product AS result "
			+ "ON recipe.result_id = result.product_id";
	
	public void setData(ResultSet result) {
		super.setData(result);
		try {
			result_name = result.getNString("result.product_name");
			if(result_name == null)
				result_name = "None";
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public String getSearchQuery() {
		return searchQuery + " ORDER BY recipe.recipe_id;";
	}
	
	public String getSearchQuery(String condition) {
		return searchQuery + " WHERE " + condition + " ORDER BY recipe.recipe_id;";
	}
	
	public String getResult_name() {
		return result_name;
	}
}

