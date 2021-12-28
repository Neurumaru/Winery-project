<%@page import="wine_project.HarvestIDtoName"%>
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
				<a href="vineyardHarvestInfo.jsp?harvest_id=<%=harvest_id%>"><%=harvest_id%></a>
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
		        				<%=h.getRegistration_name()%>
		        			</td>
		        		</tr>
		        		<tr>
		        			<td>
		        				<label>Land</label>
		        			</td>
		        			<td>
		        				<%=h.getLocation()%>/<%=h.getArea()%>
		        			</td>
		        		</tr>
		        		<tr>
		        			<td>
		        				<label>Product</label>
		        			</td>
		        			<td>
		        				<%=h.getProduct_name()%>
		        			</td>
		        		</tr>
		        		<tr>
		        			<td>
		        				<label>Quantity</label>
		        			</td>
		        			<td>
		        				<%=h.getQuantity()%>
		        			</td>
		        		</tr>
		        		<tr>
		        			<td>
		        				<label>Date</label>
		        			</td>
		        			<td>
		        				<%=h.getHarvest_date()%>
		        			</td>
		        		</tr>
		        		<tr>
		        			<td colspan="2">
		        				<button onClick="location.href='vineyardHarvestInfoEdit.jsp?harvest_id=<%=harvest_id%>'">
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