package wine_project;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class Recipe extends Data {
	private int recipe_id;
	private int result_id;
	private String searchQuery
		= "SELECT * FROM recipe";
	
	public void setData(ResultSet result) {
		try {
			recipe_id = result.getInt("recipe.recipe_id");
			result_id = result.getInt("recipe.result_id");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void setData(int recipe_id, int result_id) {
		this.recipe_id = recipe_id;
		this.result_id = result_id;
	}
	
	public String getSearchQuery() {
		return searchQuery + " ORDER BY recipe.recipe_id;";
	}
	
	public String getSearchQuery(String condition) {
		return searchQuery + " WHERE " + condition + " ORDER BY recipe.recipe_id;";
	}
	
	public List<String> getInsertQuery() {
		List<String> insertQueryList = new ArrayList<String>();
		String insertQuery = "INSERT INTO recipe (recipe_id, result_id) "
							+ "VALUE (" + recipe_id + ", " + result_id + ");";
		insertQueryList.add(insertQuery);
		return insertQueryList;
	}
	
	public List<String> getUpdateQuery() {
		return null;
	}

	public int getRecipe_id() {
		return recipe_id;
	}

	public int getResult_id() {
		return result_id;
	}
}
