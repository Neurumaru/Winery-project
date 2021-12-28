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
String vineyard_idString = request.getParameter("registration_id");
String land_idString = request.getParameter("land_id");
int vineyard_id=0;
int land_id=0;

if(vineyard_idString != null && vineyard_idString != "")
	vineyard_id = Integer.parseInt(vineyard_idString);


if(land_idString != null && land_idString != "")
	land_id = Integer.parseInt(land_idString);
%>
<html lang="en">
    <head>
        <title>Yonsei Valley</title>
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <script src="script.js"></script>
		<script type="text/javascript">			
			function onChangeVineyard() {
				var land = document.getElementById('inputLand');
				var vineyard_id = document.getElementById('inputVineyard').selectedOptions[0].value;
				
				if(vineyard_id == 0) land.disabled = true;
				else land.disabled = false;
				
				land.options[0].selected = true;
				
				for(var i = 1; i < land.options.length; i++) {
					if(land.options[i].id == vineyard_id)
						land.options[i].hidden = false;
					else
						land.options[i].hidden = true;
				}
			}
			
			$(document).ready(function(e){
				var land = document.getElementById('inputLand');
				var vineyard_id = document.getElementById('inputVineyard').selectedOptions[0].value;
			
				if(vineyard_id == 0) land.disabled = true;
				else land.disabled = false;
				
				for(var i = 1; i < land.options.length; i++) {
					if(land.options[i].id == vineyard_id)
						land.options[i].hidden = false;
					else
						land.options[i].hidden = true;
				}
			});
		</script>
        <link rel="stylesheet" href="base.css">
    </head>
    <body>
		<main>
			<div>
				<h1>Vineyard Harvest</h1>
				<a href="index.jsp">Yonsei Valley</a> /
				<a href="vineyard.jsp">Vineyard</a> / 
				<a href="vineyardHarvest.jsp">Harvest</a>
	        </div>
			<div>
	        <form action="vineyardHarvestInsertResult.jsp" method="post">
	        	<table>
	        		<tr>
		        		<td>
					   		<label>Vineyard</label>
					   	</td>
					   	<td>
							<select id="inputVineyard" name="inputVineyard" onchange="onChangeVineyard()">
								<option value="0">None</option>
								<%
								List<Data> registration = QueryManager.getData(Vineyard.class);
								for(Data d : registration) {
									Vineyard v = (Vineyard) d;
									
									if(v.getRegistration_id() == vineyard_id) {
								%>
								<option value="<%=v.getRegistration_id()%>" selected="selected"><%=v.getRegistration_name()%></option>
								<%
									}
									else {
								%>
								<option value="<%=v.getRegistration_id()%>"><%=v.getRegistration_name()%></option>
								<%
									}
								}
								%>
							</select>
						</td>
					<tr>
	        		<tr>
	        			<td>
	        				<label>Land</label>
	        			</td>
	        			<td>
	        				<select id="inputLand" name="inputLand" disabled="disabled">
	        					<option value="0">None</option>
	        					<%
		                       	List<Data> land = QueryManager.getData(LandIDtoName.class);
		                       	for(Data d : land) {
		                       		LandIDtoName l = (LandIDtoName) d;
		                       		
		                       		if(l.getLand_id() == land_id) {
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
						List<Data> stock = QueryManager.getDataWithCondition(StockIDtoName.class, "stock.registration_id IN (SELECT registration_id FROM vineyard)");
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
                   			<th colspan="7">
                   				Harvest
                   			</th>
                   		</tr>
						<tr>
							<th>ID</th>
						    <th>Name</th>
						    <th>Location</th>
						    <th>Area</th>
						    <th>Product</th>
						    <th>Quantity</th>
						    <th>Date</th>
						</tr>
                   	</thead>
                   	<tbody>
						<%
						List<Data> harvest = QueryManager.getData(HarvestIDtoName.class);
						for(Data d : harvest) {
							HarvestIDtoName h = (HarvestIDtoName) d;
						%>
						<tr onClick="location.href='vineyardHarvestInfo.jsp?harvest_id=<%=h.getHarvest_id()%>'">
							<td><%=h.getHarvest_id()%></td>
							<td><%=h.getRegistration_name()%></td>
							<td><%=h.getLocation()%></td>
							<td><%=h.getArea()%></td>
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
