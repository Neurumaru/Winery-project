<%@page import="wine_project.Recipe"%>
<%@page import="java.util.ArrayList"%>
<%@page import="wine_project.Ingredient"%>
<%@page import="wine_project.Product"%>
<%@page import="wine_project.Data"%>
<%@page import="java.util.List"%>
<%@page import="wine_project.WineryRank"%>
<%@page import="wine_project.VineyardInsertWithLand"%>
<%@page import="wine_project.Vineyard"%>
<%@page import="wine_project.QueryManager"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Recipe</title>
</head>
<body>
<%
request.setCharacterEncoding("EUC_KR");
String result_idStirng = request.getParameter("inputResult");


if(result_idStirng != null) {
	int result_id = Integer.parseInt(result_idStirng);
	int recipe_id = QueryManager.getAutoIncrement("recipe");
	
	List<Data> product = QueryManager.getData(Product.class);
	List<Ingredient> ingredients = new ArrayList<Ingredient>();
	for(Data d : product) {
		Product p = (Product) d;
		String ingredient_quantityString = request.getParameter("inputIngredient"+p.getProduct_id());
		if(ingredient_quantityString != null) {
			int ingredient_quantity = Integer.parseInt(ingredient_quantityString);
			
			if(ingredient_quantity == 0)
				continue;
			
			Ingredient ingredient = new Ingredient();
			ingredient.setData(recipe_id, result_id, p.getProduct_id(), ingredient_quantity);
			ingredients.add(ingredient);
		}
	}
	
	Recipe recipe = new Recipe();
	recipe.setData(recipe_id, result_id);
	QueryManager.insertData(recipe);
	for(Ingredient i : ingredients)
		QueryManager.insertData(i);
}

response.sendRedirect("recipe.jsp");
%>
</body>
</html>