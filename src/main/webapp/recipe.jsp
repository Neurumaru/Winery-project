<%@page import="wine_project.IngredientIDtoName"%>
<%@page import="wine_project.RecipeWithIngredient"%>
<%@page import="wine_project.WineryRank"%>
<%@page import="wine_project.LandNoOwner"%>
<%@page import="wine_project.ProductFromLand"%>
<%@page import="wine_project.Registration"%>
<%@page import="wine_project.Data"%>
<%@page import="wine_project.LandIDtoName"%>
<%@page import="wine_project.Product"%>
<%@page import="wine_project.Land"%>
<%@page import="wine_project.Vineyard"%>
<%@page import="java.util.List"%>
<%@page import="wine_project.QueryManager"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Yonsei Valley</title>
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <script src="script.js"></script>
        <link rel="stylesheet" href="base.css">
    </head>
    <body>
		<main>
			<div>
		        <h1>Recipe</h1>
		        <a href="index.jsp">Yonsei Valley</a> / 
		        <a href="recipe.jsp">Recipe</a>
	        </div>
			<div>
		        <form action="recipeInsertResult.jsp" method="post">
		        	<table>
			        	<tbody class="target">
				        	<tr>
				        		<td colspan="2">
							   		<label>Result</label>
							   	</td>
							   	<td>
									<select id="inputResult" name="inputResult">
										<option value="0">None</option>
									<%
		                          	List<Data> product = QueryManager.getDataWithCondition(Product.class, "product_from_land=0");
		                          	for(Data d : product) {
		                          		Product p = (Product) d;
		                          		%>
		                          		<option value="<%=p.getProduct_id()%>"><%=p.getProduct_name()%>/<%=p.getProduct_price()%></option>
		                          		<%
		                         	}
		                          	%>
									</select>
								</td>
							<tr>
							<%
							product = QueryManager.getData(Product.class);
							for(Data d : product) {
								Product p = (Product) d;
							%>
							<tr>
								<td class="id">
									Ingredient
								</td>
								<td>
									<%=p.getProduct_name()%>
								</td>
								<td>
									<input id="inputIngredient<%=p.getProduct_id()%>" name="inputIngredient<%=p.getProduct_id()%>" type="number" value="0"/>
								</td>
							</tr>
							<%
							}
							%>
						   	<tr>
						   		<td colspan="3">
				            		<button type="submit">Create Recipe</button>
				            	</td>
				            </tr>
			            </tbody>
		       		</table>
		        </form>
	        </div>
	        <div>
               <table>
                   	<thead>
                       	<tr>
	                       	<th rowspan="2">ID</th>
                           	<th rowspan="2">Result</th>
                           	<th colspan="<%=product.size()%>">Ingredient</th>
                       	</tr>
						<tr>
							<%
							for(Data d : product) {
								Product p = (Product) d;
							%>
							<th>
								<%=p.getProduct_name()%>
							</th>
							<%
							}
							%>
						</tr>
                   	</thead>
                   	<tbody>
                       	<%
                       	List<Data> recipe = QueryManager.getData(RecipeWithIngredient.class);
                       	List<Data> ingredient = QueryManager.getData(IngredientIDtoName.class);
                       	for(Data d : recipe) {
                       		RecipeWithIngredient r = (RecipeWithIngredient) d;
                       		r.setIngredient(ingredient);
                       	%>
                       	<tr>
                       		<td>
                       			<%=r.getRecipe_id()%>
                       		</td>
                       		<td>
                       			<%=r.getResult_name()%>
                       		</td>
                       		<%
                       		for(Data e : product) {
                       			Product p = (Product) e;
                       			int quantity = 0;
                       			
                       			for(IngredientIDtoName i : r.getIngredient())
									if(i.getProduct_id() == p.getProduct_id())
										quantity = i.getQuantity();
                       			%>
                       			<td>
                       				<%=quantity%>
                       			</td>
                       			<%
                       		}
                       		%>
                       	</tr>
                      	<%
                       	}
                       	%>
                   	</tbody>
               	</table>
			</div>
		</main>
    </body>
</html>
