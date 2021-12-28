<%@page import="wine_project.ProductionIDtoName"%>
<%@page import="wine_project.TradeIDtoName"%>
<%@page import="wine_project.HarvestIDtoName"%>
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
				<a href="wineryProductionInfo.jsp?production_id=<%=production_id%>"><%=production_id%></a>
	        </div>
	        <div>
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
		        				<%=p.getRegistration_name()%>
		        			</td>
		        		</tr>
		        		<tr>
		        			<td>
		        				<label>Product</label>
		        			</td>
		        			<td>
		        				<%=p.getRecipeWithIngredient().getResult_name()%>
		        			</td>
		        		</tr>
		        		<tr>
		        			<td>
		        				<label>Quantity</label>
		        			</td>
		        			<td>
		        				<%=p.getQuantity()%>
		        			</td>
		        		</tr>
		        		<tr>
		        			<td>
		        				<label>Date</label>
		        			</td>
		        			<td>
		        				<%=p.getProduction_date()%>
		        			</td>
		        		</tr>
		        		<tr>
		        			<td colspan="2">
		        				<button onClick="location.href='wineryProductionInfoEdit.jsp?production_id=<%=production_id%>'">
		        					Edit
		        				</button>
		        			</td>
		        		</tr>
	        		</tbody>
        		</table>
	        </div>
	        
		</main>
    </body>
</html>