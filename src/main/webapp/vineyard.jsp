<%@page import="wine_project.VineyardSummary"%>
<%@page import="wine_project.StockIDtoName"%>
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
		        <h1>Vineyard</h1>
		        <a href="index.jsp">Yonsei Valley</a> / 
		        <a href="vineyard.jsp">Vineyard</a>
	        </div>
			<div>
		        <form action="vineyardInsertResult.jsp" method="post">
		        	<table>
		        		<tr>
		        			<td>
		        				<label>Name</label>
		        			</td>
		        			<td>
								<input id="inputRegistrationName" name="inputRegistrationName" type="text"/>
		        			</td>
		        		</tr>
		        		<tr>
		        			<td>
								<label>Owner</label>
							</td>
							<td>
								<input id="inputOwnerName" name="inputOwnerName" type="text"/>
							</td>
						</tr>
		        		<tr>
		        			<td>
								<label>Number</label>
							</td>
							<td>
								<input id="inputOwnerNumber" name="inputOwnerNumber" type="text"/>
							</td>
						</tr>
		        		<tr>
		        			<td>
								<label>Fund</label>
							</td>
							<td>
								<input id="inputFund" name="inputFund" type="number"/>
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
	                          	List<Data> land = QueryManager.getData(LandNoOwner.class);
	                          	for(Data d : land) {
	                          		LandNoOwner l = (LandNoOwner) d;
	                          		%>
	                          		<option value="<%=l.getLand_id()%>"><%=l.getLocation()%>/<%=l.getArea()%></option>
	                          		<%
	                         	}
	                          	%>
								</select>
							</td>
						<tr>
					   	<tr>
					   		<td colspan="2">
			            		<button type="submit">Insert Data</button>
			            	</td>
			            </tr>
		       		</table>
		        </form>
	        </div>
	        <div>
	        	<table>
	        		<tr>
	        			<td>
		            		<button onClick="location.href='vineyardHarvest.jsp'">Harvest</button>
	        			</td>
	        			<td>
		            		<button onClick="location.href='trade.jsp'">Trade</button>
	        			</td>
	        		</tr>
	        	</table>
	        </div>
	        <div>
               <table>
                   	<thead>
						<tr>
						    <th>ID</th>
						    <th>Name</th>
						    <th>Owner</th>
						    <th>Number</th>
						    <th>Fund</th>
						    <th>Area</th>
						    <th>Product</th>
						    <th>Harvest</th>
						    <th>Harvest (This Year)</th>
						    <th>Trade</th>
						    <th>Trade (This Year)</th>
						</tr>
                   	</thead>
                   	<tbody class="target">
						<%
						List<Data> vineyard = QueryManager.getData(VineyardSummary.class);
						for(Data d : vineyard) {
							VineyardSummary v = (VineyardSummary) d;
						%>
						<tr onClick="location.href='vineyardInfo.jsp?vineyard_id=<%=v.getRegistration_id()%>'">
							<td class="id"><%=v.getRegistration_id()%></td>
							<td class="value"><%=v.getRegistration_name()%></td>
							<td class="value"><%=v.getOwner_name()%></td>
							<td class="value"><%=v.getOwner_number()%></td>
							<td class="value"><%=v.getFund()%></td>
							<td class="value"><%=v.getSum_area()%></td>
							<td><%=v.getProduct_name()%></td>
							<td><%=v.getSum_harvest()%></td>
							<td><%=v.getSum_harvest_thisyear()%></td>
							<td><%=v.getSum_trade()%></td>
							<td><%=v.getSum_trade_thisyear()%></td>
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
						List<Data> stockVineyard = QueryManager.getDataWithCondition(StockIDtoName.class, "stock.registration_id IN (SELECT registration_id FROM vineyard)");

						for(Data d : stockVineyard) {
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
		</main>
    </body>
</html>
