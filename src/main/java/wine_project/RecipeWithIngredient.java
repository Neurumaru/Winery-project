package wine_project;

import java.util.ArrayList;
import java.util.List;

public class RecipeWithIngredient extends RecipeIDtoName {
	private List<IngredientIDtoName> ingredient;
	
	public void setIngredient(List<Data> ingredient) {
		this.ingredient = new ArrayList<IngredientIDtoName>();
		for(Data d : ingredient) {
			IngredientIDtoName i = (IngredientIDtoName) d;
			if(i.getRecipe_id() == getRecipe_id())
				this.ingredient.add(i);
		}
	}
	
	public List<String> getInsertQuery() {
		List<String> insertQueryList = super.getInsertQuery();
		for(IngredientIDtoName i : ingredient)
			insertQueryList.addAll(i.getInsertQuery());
		return insertQueryList;
	}
	
	public List<IngredientIDtoName> getIngredient() {
		return ingredient;
	}
}
