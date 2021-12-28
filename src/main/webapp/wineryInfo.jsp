<%@page import="wine_project.TradeIDtoName"%>
<%@page import="wine_project.ProductionIDtoName"%>
<%@page import="wine_project.WinerySummary"%>
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
String winery_id = request.getParameter("winery_id");	
List<Data> winery = QueryManager.getDataWithCondition(WinerySummary.class,
		"winery.registration_id = " + winery_id);
WinerySummary w = (WinerySummary) winery.get(0);
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
		        <h1>Winery Information</h1>
		        <a href="index.jsp">Yonsei Valley</a> /
				<a href="winery.jsp">Winery</a> /
				<a href="wineryInfo.jsp?winery_id=<%=winery_id%>"><%=winery_id%></a>
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
		        				<%=w.getRegistration_name()%>
		        			</td>
		        		</tr>
		        		<tr>
		        			<td>
		        				<label>Owner</label>
		        			</td>
		        			<td colspan="2">
		        				<%=w.getOwner_name()%>
		        			</td>
		        		<tr>
		        			<td>
		        				<label>Number</label>
		        			</td>
		        			<td colspan="2">
		        				<%=w.getOwner_number()%>
		        			</td>
		        		</tr>
		        		<tr>
		        			<td>
		        				<label>Fund</label>
		        			</td>
		        			<td colspan="2">
		        				<%=w.getFund()%>
		        			</td>
		        		</tr>
		        		<tr>
		        			<td>
		        				<label>Client</label>
		        			</td>
		        			<td colspan="2">
		        				<%=w.getClient_name()%>
		        			</td>
		        		</tr>
		        		<tr>
		        			<td>
		        				<label>Rank</label>
		        			</td>
		        			<td colspan="2">
		        				<%=w.getRank()%>
		        			</td>
		        		</tr>
		        		<tr>
		        			<td colspan="3">
		        				<button onClick="location.href='wineryInfoEdit.jsp?winery_id=<%=winery_id%>'">
		        					Edit
		        				</button>
		        			</td>
		        		</tr>
		        		<tr>
		        			<td colspan="3">
		        				<button onClick="location.href='trade.jsp?sell_registration_id=<%=w.getClient_id()%>&buy_registration_id=<%=winery_id%>'">
		        					Buy
		        				</button>
		        			</td>
		        		</tr>
		        		<tr>
		        			<td colspan="3">
		        				<button onClick="location.href='wineryProduction.jsp?registration_id=<%=winery_id%>'">
		        					Production
		        				</button>
		        			</td>
		        		</tr>
		        		<tr>
		        			<td colspan="3">
		        				<button onClick="location.href='trade.jsp?sell_registration_id=<%=winery_id%>'">
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
		        		<%
						for(Data d : winery) {
							WinerySummary ws = (WinerySummary) d;
							if(ws.getSum_production_quantity() > 0) {
						%>
						<tr>
							<td class="id" width="200px">Production</td>
							<td><%=ws.getProduct_name()%></td>
							<td><%=ws.getSum_production_quantity()%></td>
						</tr>
						<%
							}
						}
						%>
						<%
						for(Data d : winery) {
							WinerySummary ws = (WinerySummary) d;
							if(ws.getSum_production_quantity_thisyear() > 0) {
						%>
						<tr>
							<td class="id">Production (This Year)</td>
							<td><%=ws.getProduct_name()%></td>
							<td><%=ws.getSum_production_quantity_thisyear()%></td>
						</tr>
						<%
							}
						}
						%>
						<%
						for(Data d : winery) {
							WinerySummary ws = (WinerySummary) d;
							if(ws.getSum_sell_quantity() > 0) {
						%>
						<tr>
							<td class="id">Sell Quantity</td>
							<td><%=ws.getProduct_name()%></td>
							<td><%=ws.getSum_sell_quantity()%></td>
						</tr>
						<%
							}
						}
						%>
						<%
						for(Data d : winery) {
							WinerySummary ws = (WinerySummary) d;
							if(ws.getSum_sell_quantity_thisyear() > 0) {
						%>
						<tr>
							<td class="id">Sell Quantity (This Year)</td>
							<td><%=ws.getProduct_name()%></td>
							<td><%=ws.getSum_sell_quantity_thisyear()%></td>
						</tr>
						<%
							}
						}
						%>
						<%
						for(Data d : winery) {
							WinerySummary ws = (WinerySummary) d;
							if(ws.getSum_sell_price() > 0) {
						%>
						<tr>
							<td class="id">Sell Price</td>
							<td><%=ws.getProduct_name()%></td>
							<td><%=ws.getSum_sell_price()%></td>
						</tr>
						<%
							}
						}
						%>
						<%
						for(Data d : winery) {
							WinerySummary ws = (WinerySummary) d;
							if(ws.getSum_sell_price_thisyear() > 0) {
						%>
						<tr>
							<td class="id">Sell Price (This Year)</td>
							<td><%=ws.getProduct_name()%></td>
							<td><%=ws.getSum_sell_price_thisyear()%></td>
						</tr>
						<%
							}
						}
						%>
						<%
						for(Data d : winery) {
							WinerySummary ws = (WinerySummary) d;
							if(ws.getSum_buy_quantity() > 0) {
						%>
						<tr>
							<td class="id">Buy Quantity</td>
							<td><%=ws.getProduct_name()%></td>
							<td><%=ws.getSum_buy_quantity()%></td>
						</tr>
						<%
							}
						}
						%>
						<%
						for(Data d : winery) {
							WinerySummary ws = (WinerySummary) d;
							if(ws.getSum_buy_quantity_thisyear() > 0) {
						%>
						<tr>
							<td class="id">Buy Quantity (This Year)</td>
							<td><%=ws.getProduct_name()%></td>
							<td><%=ws.getSum_buy_quantity_thisyear()%></td>
						</tr>
						<%
							}
						}
						%>
						<%
						for(Data d : winery) {
							WinerySummary ws = (WinerySummary) d;
							if(ws.getSum_buy_price() > 0) {
						%>
						<tr>
							<td class="id">Buy Price</td>
							<td><%=ws.getProduct_name()%></td>
							<td><%=ws.getSum_buy_price()%></td>
						</tr>
						<%
							}
						}
						%>
						<%
						for(Data d : winery) {
							WinerySummary ws = (WinerySummary) d;
							if(ws.getSum_buy_price_thisyear() > 0) {
						%>
						<tr>
							<td class="id">Buy Price (This Year)</td>
							<td><%=ws.getProduct_name()%></td>
							<td><%=ws.getSum_buy_price_thisyear()%></td>
						</tr>
						<%
							}
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
						List<Data> stock = QueryManager.getDataWithCondition(StockIDtoName.class, "stock.registration_id="+w.getRegistration_id());
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
                   			<th colspan="5">
                   				Production
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
						List<Data> production = QueryManager.getDataWithCondition(ProductionIDtoName.class, "registration_id_of_production="+w.getRegistration_id());
						for(Data d : production) {
							ProductionIDtoName p = (ProductionIDtoName) d;
						%>
						<tr onClick="location.href='wineryProductionInfo.jsp?production_id=<%=p.getProduction_id()%>'">
							<td><%=p.getProduction_id()%></td>
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
			<div>
               <table>
                   	<thead>
                   		<tr>
                   			<th colspan="7">
                   				Buy
                   			</th>
                   		</tr>
						<tr>
							<th>ID</th>
						    <th>Server</th>
						    <th>Product</th>
						    <th>Quantity</th>
						    <th>Price</th>
						    <th>Date</th>
						</tr>
                   	</thead>
                   	<tbody>
						<%
						List<Data> tradeBuy = QueryManager.getDataWithCondition(TradeIDtoName.class, "buy_registration_id="+w.getRegistration_id());
						for(Data d : tradeBuy) {
							TradeIDtoName t = (TradeIDtoName) d;
						%>
						<tr onClick="location.href='tradeInfo.jsp?trade_id=<%=t.getTrade_id()%>'">
							<td><%=t.getTrade_id()%></td>
							<td><%=t.getSell_registration_name()%></td>
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
						    <th>Product</th>
						    <th>Quantity</th>
						    <th>Price</th>
						    <th>Date</th>
						</tr>
                   	</thead>
                   	<tbody>
						<%
						List<Data> tradeSell = QueryManager.getDataWithCondition(TradeIDtoName.class, "sell_registration_id="+w.getRegistration_id());
						for(Data d : tradeSell) {
							TradeIDtoName t = (TradeIDtoName) d;
						%>
						<tr onClick="location.href='tradeInfo.jsp?trade_id=<%=t.getTrade_id()%>'">
							<td><%=t.getTrade_id()%></td>
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