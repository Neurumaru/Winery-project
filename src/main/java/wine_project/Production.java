package wine_project;

import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class Production extends Data {
	private int production_id;
	private int quantity;
	private Timestamp production_date;
	private int recipe_id;
	private int registration_id_of_production;
	private RecipeWithIngredient recipeWithIngredient;

	private String searchQuery
		= "SELECT * FROM production";
	
	public void setData(ResultSet result) {
		try {
			production_id = result.getInt("production_id");
			quantity = result.getInt("quantity");
			production_date = result.getTimestamp("production_date");
			recipe_id = result.getInt("recipe_id");
			registration_id_of_production = result.getInt("registration_id_of_production");
			
			List<Data> recipe = QueryManager.getDataWithCondition(RecipeWithIngredient.class, "recipe.recipe_id="+recipe_id);
			List<Data> ingredient = QueryManager.getDataWithCondition(IngredientIDtoName.class, "recipe.recipe_id="+recipe_id);
			recipeWithIngredient = (RecipeWithIngredient) recipe.get(0);
			recipeWithIngredient.setIngredient(ingredient);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void setData(int production_id, int quantity, Timestamp production_date, int recipe_id, int registration_id_of_production) {
		this.production_id = production_id;
		this.quantity = quantity;
		this.production_date = production_date;
		this.recipe_id = recipe_id;
		this.registration_id_of_production = registration_id_of_production;
		
		List<Data> recipe = QueryManager.getDataWithCondition(RecipeWithIngredient.class, "recipe.recipe_id="+recipe_id);
		List<Data> ingredient = QueryManager.getDataWithCondition(IngredientIDtoName.class, "recipe.recipe_id="+recipe_id);
		recipeWithIngredient = (RecipeWithIngredient) recipe.get(0);
		recipeWithIngredient.setIngredient(ingredient);
	}
	
	public void setData(int quantity, int recipe_id, int registration_id_of_production) {
		this.setData(0, quantity, null, recipe_id, registration_id_of_production);
	}
	
	public String getSearchQuery() {
		return searchQuery + ";";
	}
	
	public String getSearchQuery(String condition) {
		return searchQuery + " WHERE " + condition + ";";
	}
	
	public List<String> getInsertQuery() {
		List<String> insertQueryList = new ArrayList<String>();
		String insertQuery = "INSERT INTO production (quantity, recipe_id, registration_id_of_production)"
							+ "VALUE (" + quantity + ", " + recipe_id + ", " + registration_id_of_production + ");";
		insertQueryList.add(insertQuery);
		insertQuery = "INSERT INTO stock (quantity, registration_id, product_id) "
					+ "VALUE (" + quantity + ", " + registration_id_of_production + ", " + recipeWithIngredient.getResult_id() + ") "
					+ "ON DUPLICATE KEY UPDATE quantity=quantity+" + quantity + ";";
		insertQueryList.add(insertQuery);
		for(IngredientIDtoName i : recipeWithIngredient.getIngredient()) {
			List<Data> stock = QueryManager.getDataWithCondition(Stock.class, "registration_id=" + registration_id_of_production + " AND product_id=" + i.getProduct_id());
			if(stock.size() == 0 || ((Stock) stock.get(0)).getQuantity() < (i.getQuantity() * quantity)) {
				insertQueryList.clear();
				break;
			}
			insertQuery = "UPDATE stock SET "
						+ "quantity=quantity-" + (i.getQuantity() * quantity) + " "
						+ "WHERE registration_id=" + registration_id_of_production + " AND product_id=" + i.getProduct_id() + ";";
			insertQueryList.add(insertQuery);
		}
		return insertQueryList;
	}
	
	public List<String> getUpdateQuery() {
		List<String> updateQueryList = new ArrayList<String>();
		String updateQuery = "UPDATE production SET "
							+ "quantity=" + quantity + ", "
							+ "recipe_id=" + recipe_id + ", "
							+ "registration_id_of_production=" + registration_id_of_production + ", "
							+ "production_date='" + production_date + "' "
							+ "WHERE production_id=" + production_id + ";";
		updateQueryList.add(updateQuery);
		return updateQueryList;
	}

	public int getProduction_id() {
		return production_id;
	}

	public int getQuantity() {
		return quantity;
	}

	public Timestamp getProduction_date() {
		return production_date;
	}

	public int getRecipe_id() {
		return recipe_id;
	}

	public int getRegistration_id_of_production() {
		return registration_id_of_production;
	}
	
	public RecipeWithIngredient getRecipeWithIngredient() {
		return recipeWithIngredient;
	}
}
