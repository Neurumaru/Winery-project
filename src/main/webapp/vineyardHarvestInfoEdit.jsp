<%@page import="wine_project.IngredientIDtoName"%>
<%@page import="wine_project.RecipeWithIngredient"%>
<%@page import="wine_project.Vineyard"%>
<%@page import="wine_project.HarvestIDtoName"%>
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
String harvest_id = request.getParameter("harvest_id");
List<Data> harvest = QueryManager.getDataWithCondition(HarvestIDtoName.class, "harvest.harvest_id="+harvest_id);
HarvestIDtoName h = (HarvestIDtoName) harvest.get(0);
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
		        <h1>Vineyard Harvest</h1>
		        <a href="index.jsp">Yonsei Valley</a> /
				<a href="vineyard.jsp">Vineyard</a> /
				<a href="vineyardHarvest.jsp">Harvest</a> /
				<a href="vineyardHarvestInfo.jsp?harvest_id=<%=harvest_id%>"><%=harvest_id%></a> /
				<a href="vineyardHarvestInfoEdit.jsp?harvest_id=<%=harvest_id%>">Edit</a>
	        </div>
	        <div>
	        	<form action="vineyardHarvestEditResult.jsp" method="post">
	        		<input id="harvest_id" name="harvest_id" type="hidden" value="<%=harvest_id%>"/>
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
										List<Data> vineyard = QueryManager.getData(Vineyard.class);
										for(Data d : vineyard) {
											Vineyard w = (Vineyard) d;
										  	if(w.getRegistration_id() == h.getRegistration_id()) {
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
			        				<label>Land</label>
			        			</td>
			        			<td>
			        				<select id="inputLand" name="inputLand">
			        					<option value="0">None</option>
			        					<%
				                       	List<Data> land = QueryManager.getDataWithCondition(LandIDtoName.class, "land.registration_id_of_proprietor="+h.getRegistration_id());
				                       	for(Data d : land) {
				                       		LandIDtoName l = (LandIDtoName) d;
				                       		
				                       		if(l.getLand_id() == h.getLand_id()) {
				                       	%>
				                      	<option id="<%=l.getRegistration_id_of_proprietor()%>" value="<%=l.getLand_id()%>" selected="selected">
				                      		<%=l.getLocation()%>/<%=l.getArea()%>/<%=l.getProduct_name()%>
				                      	</option>
				                      	<%
				                       		}
				                       		else {
				                       	%>
				                      	<option id="<%=l.getRegistration_id_of_proprietor()%>" value="<%=l.getLand_id()%>">
				                      		<%=l.getLocation()%>/<%=l.getArea()%>/<%=l.getProduct_name()%>
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
									<label>Product</label>
								</td>
								<td>
				                    <select id="inputProduct" name="inputProduct">
				                    	<option value="0">None</option>
				                    <%
				                    List<Data> product = QueryManager.getData(ProductFromLand.class);
				                    for(Data d : product) {
				                    	ProductFromLand p = (ProductFromLand) d;
				                    	
				                    	if(p.getProduct_id() == h.getProduct_id()) {
				                    %>
				                    <option value="<%=p.getProduct_id()%>" selected="selected"><%=p.getProduct_name()%></option>
				                    <%
				                    	}
				                    	else {
				                    %>
				                    <option value="<%=p.getProduct_id()%>"><%=p.getProduct_name()%></option>
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
			        				<input id="inputQuantity" name="inputQuantity" type="number" value="<%=h.getQuantity()%>"/>
			        			</td>
			        		</tr>
			        		<tr>
			        			<td>
			        				<label>Date</label>
			        			</td>
			        			<td>
			        				<input id="inputDate" name="inputDate" type="text" value="<%=h.getHarvest_date()%>"/>
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