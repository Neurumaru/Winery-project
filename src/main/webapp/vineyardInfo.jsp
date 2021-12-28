<%@page import="wine_project.TradeIDtoName"%>
<%@page import="wine_project.HarvestIDtoName"%>
<%@page import="wine_project.StockIDtoName"%>
<%@page import="wine_project.VineyardSummary"%>
<%@page import="wine_project.LandIDtoName"%>
<%@page import="wine_project.Land"%>
<%@page import="wine_project.Vineyard"%>
<%@page import="wine_project.QueryManager"%>
<%@page import="wine_project.Data"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%
String vineyard_id = request.getParameter("vineyard_id");	
List<Data> vineyard = QueryManager.getDataWithCondition(VineyardSummary.class,
		"vineyard.registration_id = " + vineyard_id);
VineyardSummary v = (VineyardSummary) vineyard.get(0);
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
		        <h1>Vineyard Information</h1>
		        <a href="index.jsp">Yonsei Valley</a> /
				<a href="vineyard.jsp">Vineyard</a> /
				<a href="vineyardInfo.jsp?vineyard_id=<%=vineyard_id%>"><%=vineyard_id%></a>
	        </div>
	        <div>
	        	<table>
	        		<thead>
	        			<tr>
	        				<th colspan="3">
	        					Information
	        				</th>
	        			</tr>
	        		</thead>
	        		<tbody>
		        		<tr>
		        			<td>
		        				<label>Name</label>
		        			</td>
		        			<td colspan="2">
		        				<%=v.getRegistration_name()%>
		        			</td>
		        		</tr>
		        		<tr>
		        			<td>
		        				<label>Owner</label>
		        			</td>
		        			<td colspan="2">
		        				<%=v.getOwner_name()%>
		        			</td>
		        		<tr>
		        			<td>
		        				<label>Number</label>
		        			</td>
		        			<td colspan="2">
		        				<%=v.getOwner_number()%>
		        			</td>
		        		</tr>
		        		<tr>
		        			<td>
		        				<label>Fund</label>
		        			</td>
		        			<td colspan="2">
		        				<%=v.getFund()%>
		        			</td>
		        		</tr>
		        		<tr>
		        			<td colspan="3">
		        				<button onClick="location.href='vineyardInfoEdit.jsp?vineyard_id=<%=vineyard_id%>'">
		        					Edit
		        				</button>
		        			</td>
		        		</tr>
		        		<tr>
		        			<td colspan="3">
		        				<button onClick="location.href='vineyardHarvest.jsp?registration_id=<%=vineyard_id%>'">
		        					Harvest
		        				</button>
		        			</td>
		        		</tr>
		        		<tr>
		        			<td colspan="3">
		        				<button onClick="location.href='trade.jsp?sell_registration_id=<%=vineyard_id%>'">
		        					Sell
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
	        				<th colspan="3">
	        					Summary
	        				</th>
	        			</tr>
	        		</thead>
	        		<tbody class="target">
	        			<tr>
		        			<td>
		        				<label>Area</label>
		        			</td>
		        			<td colspan="2">
		        				<%=v.getSum_area()%>
		        			</td>
		        		</tr>
		        		<%
						for(Data d : vineyard) {
							VineyardSummary vs = (VineyardSummary) d;
						%>
						<tr>
							<td class="id">Harvest</td>
							<td><%=vs.getProduct_name()%></td>
							<td><%=vs.getSum_harvest()%></td>
						</tr>
						<%
						}
						%>
						<%
						for(Data d : vineyard) {
							VineyardSummary vs = (VineyardSummary) d;
						%>
						<tr>
							<td class="id">Harvest (This Year)</td>
							<td><%=vs.getProduct_name()%></td>
							<td><%=vs.getSum_harvest_thisyear()%></td>
						</tr>
						<%
						}
						%>
						<%
						for(Data d : vineyard) {
							VineyardSummary vs = (VineyardSummary) d;
						%>
						<tr>
							<td class="id">Trade</td>
							<td><%=vs.getProduct_name()%></td>
							<td><%=vs.getSum_trade()%></td>
						</tr>
						<%
						}
						%>
						<%
						for(Data d : vineyard) {
							VineyardSummary vs = (VineyardSummary) d;
						%>
						<tr>
							<td class="id">Trade (This Year)</td>
							<td><%=vs.getProduct_name()%></td>
							<td><%=vs.getSum_trade_thisyear()%></td>
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
	        					Land
	        				</th>
	        			</tr>
	        			<tr>
	        				<th>location</th>
	        				<th>Area</th>
	        				<th>Product</th>
	        			</tr>
	        		</thead>
	        		<tbody>
		        		<%
	                   	List<Data> land = QueryManager.getDataWithCondition(LandIDtoName.class,
	                   			"registration_id_of_proprietor = " + vineyard_id);
	                   	for(Data d : land) {
	                   		LandIDtoName l = (LandIDtoName) d;
	               		%>
	               		<tr onClick="location.href='landInfo.jsp?land_id=<%=l.getLand_id()%>'">
	               			<td><%=l.getLocation()%></td>
	               			<td><%=l.getArea()%></td>
	               			<td><%=l.getProduct_name()%></td>
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
						    <th>Product</th>
						    <th>Quantity</th>
						</tr>
                   	</thead>
                   	<tbody>
						<%
						List<Data> stock = QueryManager.getDataWithCondition(StockIDtoName.class, "stock.registration_id="+v.getRegistration_id());
						for(Data d : stock) {
							StockIDtoName s = (StockIDtoName) d;
						%>
						<tr onClick="location.href='#?registration_id=<%=s.getRegistration_id()%>&product_id=<%=s.getProduct_id()%>'">
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
                   			<th colspan="6">
                   				Harvest
                   			</th>
                   		</tr>
						<tr>
							<th>ID</th>
						    <th>Location</th>
						    <th>Area</th>
						    <th>Product</th>
						    <th>Quantity</th>
						    <th>Date</th>
						</tr>
                   	</thead>
                   	<tbody>
						<%
						List<Data> harvest = QueryManager.getDataWithCondition(HarvestIDtoName.class, "registration.registration_id="+v.getRegistration_id());
						for(Data d : harvest) {
							HarvestIDtoName h = (HarvestIDtoName) d;
						%>
						<tr onClick="location.href='vineyardHarvestInfo.jsp?harvest_id=<%=h.getHarvest_id()%>'">
							<td><%=h.getHarvest_id()%></td>
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
			<div>
               <table>
                   	<thead>
                   		<tr>
                   			<th colspan="7">
                   				Sell
                   			</th>
                   		</tr>
						<tr>
							<th>ID</th>
						    <th>Client</th>
						    <th>Product</th>
						    <th>Quantity</th>
						    <th>Price</th>
						    <th>Date</th>
						</tr>
                   	</thead>
                   	<tbody>
						<%
						List<Data> trade = QueryManager.getDataWithCondition(TradeIDtoName.class, "sell_registration_id="+v.getRegistration_id());
						for(Data d : trade) {
							TradeIDtoName t = (TradeIDtoName) d;
						%>
						<tr onClick="location.href='tradeInfo.jsp?trade_id=<%=t.getTrade_id()%>'">
							<td><%=t.getTrade_id()%></td>
							<td><%=t.getBuy_registration_name()%></td>
							<td><%=t.getProduct_name()%></td>
							<td><%=t.getQuantity()%></td>
							<td><%=t.getPrice()%></td>
							<td><%=t.getTrade_date()%></td>
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