<%@page import="wine_project.IngredientIDtoName"%>
<%@page import="wine_project.RecipeWithIngredient"%>
<%@page import="wine_project.Winery"%>
<%@page import="wine_project.ProductionIDtoName"%>
<%@page import="wine_project.Product"%>
<%@page import="wine_project.TradeIDtoName"%>
<%@page import="wine_project.ProductFromLand"%>
<%@page import="wine_project.Registration"%>
<%@page import="wine_project.LandIDtoName"%>
<%@page import="wine_project.Vineyard"%>
<%@page import="wine_project.QueryManager"%>
<%@page import="wine_project.Data"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%
String production_id = request.getParameter("production_id");
List<Data> production = QueryManager.getDataWithCondition(ProductionIDtoName.class, "production.production_id="+production_id);
ProductionIDtoName p = (ProductionIDtoName) production.get(0);
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
				<a href="wineryProduction.jsp">Production</a> /
				<a href="wineryProductionInfo.jsp?production_id=<%=production_id%>"><%=production_id%></a> /
				<a href="wineryProductionInfoEdit.jsp?production_id=<%=production_id%>">Edit</a>
	        </div>
	        <div>
	        	<form action="wineryProductionEditResult.jsp" method="post">
	        		<input id="production_id" name="production_id" type="hidden" value="<%=production_id%>"/>
		        	<table>
		        		<thead>
		        			<tr>
		        				<th colspan="2">
		        					Information
		        				</th>
		        			</tr>
		        		</thead>
		        		<tbody>
			        		<tr>
			        			<td>
							   		<label>Name</label>
							   	</td>
							   	<td>
									<select id="inputRegistration" name="inputRegistration">
										<option value="0">None</option>
										<%
										List<Data> winery = QueryManager.getData(Winery.class);
										for(Data d : winery) {
											Winery w = (Winery) d;
										  	if(w.getRegistration_id() == p.getRegistration_id_of_production()) {
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
			        		</tr>
			        		<tr>
			        			<td>
			        				<label>Product</label>
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
				                       		
				                       		if(r.getRecipe_id() == p.getRecipe_id()) {
		                       			%>
				                      	<option value="<%=r.getRecipe_id()%>" selected="selected">
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
				                       		else {
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
			        				<input id="inputQuantity" name="inputQuantity" type="number" value="<%=p.getQuantity()%>"/>
			        			</td>
			        		</tr>
			        		<tr>
			        			<td>
			        				<label>Date</label>
			        			</td>
			        			<td>
			        				<input id="inputDate" name="inputDate" type="text" value="<%=p.getProduction_date()%>"/>
			        			</td>
			        		</tr>
			        		<tr>
			        			<td colspan="2">
			        				<button type="submit">Edit</button>
			        			</td>
			        		</tr>
		        		</tbody>
	        		</table>
	        	</form>
	        </div>
		</main>
    </body>
</html>