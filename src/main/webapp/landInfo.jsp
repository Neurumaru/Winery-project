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
String land_id = request.getParameter("land_id");
List<Data> land = QueryManager.getDataWithCondition(LandIDtoName.class, "land.land_id="+land_id);
LandIDtoName l = (LandIDtoName) land.get(0);
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
		        <h1>Vineyard</h1>
		        <a href="index.jsp">Yonsei Valley</a> /
				<a href="land.jsp">Land</a> /
				<a href="landInfo.jsp?land_id=<%=land_id%>"><%=land_id%></a>
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
		        				<label>Owner</label>
		        			</td>
		        			<td>
		        				<%=l.getRegistration_name()%>
		        			</td>
		        		</tr>
		        		<tr>
		        			<td>
		        				<label>Location</label>
		        			</td>
		        			<td>
		        				<%=l.getLocation()%>
		        			</td>
		        		</tr>
		        		<tr>
		        			<td>
		        				<label>Area</label>
		        			</td>
		        			<td>
		        				<%=l.getArea()%>
		        			</td>
		        		<tr>
		        			<td>
		        				<label>Product</label>
		        			</td>
		        			<td>
		        				<%=l.getProduct_name()%>
		        			</td>
		        		</tr>
		        		<tr>
		        			<td colspan="2">
		        				<button onClick="location.href='landInfoEdit.jsp?land_id=<%=land_id%>'">
		        					Edit
		        				</button>
		        			</td>
		        		</tr>
		        		<tr>
		        			<td colspan="2">
		        				<button onClick="location.href='vineyardHarvest.jsp?registration_id=<%=l.getRegistration_id_of_proprietor()%>&land_id=<%=land_id%>'">
		        					Harvest
		        				</button>
		        			</td>
		        		</tr>
	        		</tbody>
        		</table>
	        </div>
	        <div>
               <table>
                   	<thead>
                   		<tr>
                   			<th colspan="7">
                   				Harvest
                   			</th>
                   		</tr>
						<tr>
							<th>ID</th>
						    <th>Product</th>
						    <th>Quantity</th>
						    <th>Date</th>
						</tr>
                   	</thead>
                   	<tbody>
						<%
						List<Data> harvest = QueryManager.getDataWithCondition(HarvestIDtoName.class, "harvest.land_id="+land_id);
						for(Data d : harvest) {
							HarvestIDtoName h = (HarvestIDtoName) d;
						%>
						<tr onClick="location.href='vineyardHarvestInfo.jsp?harvest_id=<%=h.getHarvest_id()%>'">
							<td><%=h.getHarvest_id()%></td>
							<td><%=h.getProduct_name()%></td>
							<td><%=h.getQuantity()%></td>
							<td><%=h.getHarvest_date()%></td>
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