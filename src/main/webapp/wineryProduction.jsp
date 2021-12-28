<%@page import="wine_project.ProductionIDtoName"%>
<%@page import="wine_project.Production"%>
<%@page import="wine_project.IngredientIDtoName"%>
<%@page import="wine_project.Ingredient"%>
<%@page import="wine_project.RecipeWithIngredient"%>
<%@page import="wine_project.Recipe"%>
<%@page import="wine_project.Winery"%>
<%@page import="wine_project.StockIDtoName"%>
<%@page import="wine_project.HarvestIDtoName"%>
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
<%
String winery_idString = request.getParameter("registration_id");
int winery_id=0;

if(winery_idString != null && winery_idString != "")
	winery_id = Integer.parseInt(winery_idString);
%>
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
				<h1>Winery Production</h1>
				<a href="index.jsp">Yonsei Valley</a> /
				<a href="winery.jsp">Winery</a> / 
				<a href="wineryProduction.jsp">Production</a>
	        </div>
			<div>
	        <form action="wineryProductionInsertResult.jsp" method="post">
	        	<table>
	        		<tr>
		        		<td>
					   		<label>Winery</label>
					   	</td>
					   	<td>
							<select id="inputWinery" name="inputWinery" onchange="onChangeWinery()">
								<option value="0">None</option>
								<%
								List<Data> registration = QueryManager.getData(Winery.class);
								for(Data d : registration) {
									Winery w = (Winery) d;
									
									if(w.getRegistration_id() == winery_id) {
								%>
								<option value="<%=w.getRegistration_id()%>" selected="selected"><%=w.getRegistration_name()%></option>
								<%	
									}
									else {
								%>
								<option value="<%=w.getRegistration_id()%>"><%=w.getRegistration_name()%></option>
								<%
									}
								}
								%>
							</select>
						</td>
					<tr>
	        		<tr>
	        			<td>
	        				<label>Recipe</label>
	        			</td>
	        			<td>
	        				<select id="inputRecipe" name="inputRecipe">
	        					<option value="0">None</option>
	        					<%
		                       	List<Data> recipe = QueryManager.getData(RecipeWithIngredient.class);
	        					List<Data> ingredient = QueryManager.getData(IngredientIDtoName.class);
		                       	for(Data d : recipe) {
		                       		RecipeWithIngredient r = (RecipeWithIngredient) d;
		                       		r.setIngredient(ingredient);
		                       	%>
		                      	<option value="<%=r.getRecipe_id()%>">
		                      		<%=r.getResult_name()%>:
		                      		<%
		                      		for(IngredientIDtoName i : r.getIngredient()) {
	                      			%>
	                      				<%=i.getProduct_name()%>*<%=i.getQuantity()%> 
	                      			<%
		                      		}
		                      		%>
		                      	</option>
		                      	<%
		                       	}
	                    	   	%>
		                    </select>
	                    </td>
	        		</tr>
	        		<tr>
	        			<td>
							<label>Quantity</label>
						</td>
						<td>
							<input id="inputQuantity" name="inputQuantity" type="number"/>
						</td>
					</tr>
				   	<tr>
				   		<td colspan="3">
		            		<button type="submit">Insert Data</button>
		            	</td>
		            </tr>
	       		</table>
	        </form>
	        </div>
	        
			<div>
               <table>
                   	<thead>
                   		<tr>
                   			<th colspan="3">
                   				Stock
                   			</th>
                   		</tr>
						<tr>
						    <th>Name</th>
						    <th>Product</th>
						    <th>Quantity</th>
						</tr>
                   	</thead>
                   	<tbody class="target">
						<%
						List<Data> stock = QueryManager.getDataWithCondition(StockIDtoName.class, "stock.registration_id IN (SELECT registration_id FROM winery)");
						for(Data d : stock) {
							StockIDtoName s = (StockIDtoName) d;
						%>
						<tr onClick="location.href='#?registration_id=<%=s.getRegistration_id()%>&product_id=<%=s.getProduct_id()%>'">
							<td class="id"><%=s.getRegistration_name()%></td>
							<td><%=s.getProduct_name()%></td>
							<td><%=s.getQuantity()%></td>
						</tr>
						<%
						}
						%>
                   	</tbody>
               	</table>
			</div>
	        <div>
               <table>
                   	<thead>
                   		<tr>
                   			<th colspan="5">
                   				Production
                   			</th>
                   		</tr>
						<tr>
							<th>ID</th>
						    <th>Name</th>
						    <th>Product</th>
						    <th>Quantity</th>
						    <th>Date</th>
						</tr>
                   	</thead>
                   	<tbody>
						<%
						List<Data> production = QueryManager.getData(ProductionIDtoName.class);
						for(Data d : production) {
							ProductionIDtoName p = (ProductionIDtoName) d;
						%>
						<tr onClick="location.href='wineryProductionInfo.jsp?production_id=<%=p.getProduction_id()%>'">
							<td><%=p.getProduction_id()%></td>
							<td><%=p.getRegistration_name()%></td>
							<td><%=p.getRecipeWithIngredient().getResult_name()%></td>
							<td><%=p.getQuantity()%></td>
							<td><%=p.getProduction_date()%></td>
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
