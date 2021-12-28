<%@page import="wine_project.TradeIDtoName"%>
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
List<Data> registration = QueryManager.getData(Registration.class);
List<Data> vineyard = QueryManager.getData(Vineyard.class);
List<Data> winery = QueryManager.getData(Winery.class);

String sell_registration_idString = request.getParameter("sell_registration_id");
String buy_registration_idString = request.getParameter("buy_registration_id");
int sell_registration_id=0;
int buy_registration_id=0;

if(sell_registration_idString != null && sell_registration_idString != "")
	sell_registration_id = Integer.parseInt(sell_registration_idString);

if(buy_registration_idString != null && buy_registration_idString != "")
	buy_registration_id = Integer.parseInt(buy_registration_idString);
%>
<html lang="en">
    <head>
        <title>Yonsei Valley</title>
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <script src="script.js"></script>
		<script type="text/javascript">
			function onChangeVineyard() {
				var server = document.getElementById('inputSeller');
				var client = document.getElementById('inputBuyer');
				var server_id = server.selectedOptions[0].id;
				var server_value = server.selectedOptions[0].value;
				
				if(server_value == 0 || server_id == "winery") client.disabled = true;
				else client.disabled = false;
				
				client.options[0].selected = true;
				
				for(var i = 1; i < client.options.length; i++) {
					if(client.options[i].id == server_value)
						client.options[i].hidden = false;
					else
						client.options[i].hidden = true;
				}
			}
			
			$(document).ready(function(e){
				var server = document.getElementById('inputSeller');
				var client = document.getElementById('inputBuyer');
				var server_id = server.selectedOptions[0].id;
				var server_value = server.selectedOptions[0].value;
				
				if(server_value == 0 || server_id == "winery") client.disabled = true;
				else client.disabled = false;
				
				for(var i = 1; i < client.options.length; i++) {
					if(client.options[i].id == server_value)
						client.options[i].hidden = false;
					else
						client.options[i].hidden = true;
				}
			});
		</script>
        <link rel="stylesheet" href="base.css">
    </head>
    <body>
		<main>
			<div>
				<h1>Trade</h1>
				<a href="index.jsp">Yonsei Valley</a> /
				<a href="trade.jsp">Trade</a>
	        </div>
			<div>
	        <form action="tradeInsertResult.jsp" method="post">
	        	<table>
	        		<tr>
		        		<td>
					   		<label>Seller</label>
					   	</td>
					   	<td>
							<select id="inputSeller" name="inputSeller" onchange="onChangeVineyard()">
								<option value="0">None</option>
								<option value="0" disabled="disabled">====== Vineyard ======</option>
								<%
								for(Data d : vineyard) {
									Vineyard v = (Vineyard) d;
									
									if(v.getRegistration_id() == sell_registration_id) {
								%>
								<option value="<%=v.getRegistration_id()%>" id="vineyard" selected="selected">
									<%=v.getRegistration_name()%>
								</option>
								<% 
									}
									else {
								%>
								<option value="<%=v.getRegistration_id()%>" id="vineyard">
									<%=v.getRegistration_name()%>
								</option>
								<% 		
									}
								}
								%>
								<option value="0" disabled="disabled">======= Winery =======</option>
								<%
								for(Data d : winery) {
									Winery w = (Winery) d;
									
									if(w.getRegistration_id() == sell_registration_id) {
								%>
								<option value="<%=w.getRegistration_id()%>" id="winery" selected="selected">
									<%=w.getRegistration_name()%>
								</option>
								<%
									}
									else {
								%>
								<option value="<%=w.getRegistration_id()%>" id="winery">
									<%=w.getRegistration_name()%>
								</option>
								<%
									}
								}
								%>
							</select>
						</td>
					<tr>
	        		<tr>
	        			<td>
	        				<label>Buyer</label>
	        			</td>
	        			<td>
	        				<select id="inputBuyer" name="inputBuyer" disabled="disabled">
	        					<option value="0">None</option>
	        					<%
		                       	for(Data d : vineyard) {
		                       		Vineyard v = (Vineyard) d;
		                       		
		                       		if(v.getRegistration_id() == buy_registration_id) {
                       			%>
		                      	<option value="<%=v.getRegistration_id()%>" id="" selected="selected">
		                      		<%=v.getRegistration_name()%>
		                      	</option>
		                      	<%
		                       		}
		                       		else {
		                       	%>
		                      	<option value="<%=v.getRegistration_id()%>" id="">
		                      		<%=v.getRegistration_name()%>
		                      	</option>
		                      	<%
		                       		}
		                       	}
	        					for(Data d : winery) {
									Winery w = (Winery) d;
									
									if(w.getRegistration_id() == buy_registration_id) {
								%>
								<option value="<%=w.getRegistration_id()%>" id="<%=w.getClient_id()%>" selected="selected">
									<%=w.getRegistration_name()%>
								</option>
								<%	
									}
									else {
								%>
								<option value="<%=w.getRegistration_id()%>" id="<%=w.getClient_id()%>">
									<%=w.getRegistration_name()%>
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
		                    List<Data> product = QueryManager.getData(Product.class);
		                    for(Data d : product) {
		                    	Product p = (Product) d;
		                    %>
		                    <option value="<%=p.getProduct_id()%>"><%=p.getProduct_name()%></option>
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
                   				Fund
                   			</th>
                   		</tr>
						<tr>
							<th>Category</th>
						    <th>Name</th>
						    <th>Fund</th>
						</tr>
                   	</thead>
                   	<tbody>
						<%
						int size = vineyard.size();
						for(Data d : vineyard) {
							Vineyard v = (Vineyard) d;
						%>
						<tr onClick="location.href='#?registration_id=<%=v.getRegistration_id()%>%>'">
							<%if(size > 0) {%>
								<td rowspan="<%=size%>">Vineyard</td>
							<%size = 0;}%>
							<td><%=v.getRegistration_name()%></td>
							<td><%=v.getFund()%></td>
						</tr>
						<%
						}
						%>
						<%
						size = winery.size();
						for(Data d : winery) {
							Winery w = (Winery) d;
						%>
						<tr onClick="location.href='#?registration_id=<%=w.getRegistration_id()%>'">
							<%if(size > 0) {%>
								<td rowspan="<%=size%>">Winery</td>
							<%size = 0;}%>
							<td><%=w.getRegistration_name()%></td>
							<td><%=w.getFund()%></td>
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
                   			<th colspan="4">
                   				Stock
                   			</th>
                   		</tr>
						<tr>
							<th>Category</th>
						    <th>Name</th>
						    <th>Product</th>
						    <th>Quantity</th>
						</tr>
                   	</thead>
                   	<tbody class="target">
						<%
						List<Data> stockVineyard = QueryManager.getDataWithCondition(StockIDtoName.class, "stock.registration_id IN (SELECT registration_id FROM vineyard)");
						size = stockVineyard.size();
						for(Data d : stockVineyard) {
							StockIDtoName s = (StockIDtoName) d;
						%>
						<tr onClick="location.href='#?registration_id=<%=s.getRegistration_id()%>&product_id=<%=s.getProduct_id()%>'">
							<%if(size > 0) {%>
								<td rowspan="<%=size%>">Vineyard</td>
							<%size = 0;}%>
							<td class="id"><%=s.getRegistration_name()%></td>
							<td><%=s.getProduct_name()%></td>
							<td><%=s.getQuantity()%></td>
						</tr>
						<%
						}
						%>
						<%
						List<Data> stockWinery = QueryManager.getDataWithCondition(StockIDtoName.class, "stock.registration_id IN (SELECT registration_id FROM winery)");
						size = stockWinery.size();
						for(Data d : stockWinery) {
							StockIDtoName s = (StockIDtoName) d;
						%>
						<tr onClick="location.href='#?registration_id=<%=s.getRegistration_id()%>&product_id=<%=s.getProduct_id()%>'">
							<%if(size > 0) {%>
								<td rowspan="<%=size%>">Winery</td>
							<%size = 0;}%>
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
                   				Trade
                   			</th>
                   		</tr>
						<tr>
							<th>ID</th>
						    <th>Seller</th>
						    <th>Buyer</th>
						    <th>Product</th>
						    <th>Quantity</th>
						    <th>Price</th>
						    <th>Date</th>
						</tr>
                   	</thead>
                   	<tbody>
						<%
						List<Data> trade = QueryManager.getData(TradeIDtoName.class);
						for(Data d : trade) {
							TradeIDtoName t = (TradeIDtoName) d;
						%>
						<tr onClick="location.href='tradeInfo.jsp?trade_id=<%=t.getTrade_id()%>'">
							<td><%=t.getTrade_id()%></td>
							<td><%=t.getSell_registration_name()%></td>
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
