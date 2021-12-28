<%@page import="wine_project.StockIDtoName"%>
<%@page import="wine_project.WinerySummary"%>
<%@page import="wine_project.WineryIDtoName"%>
<%@page import="wine_project.WineryRank"%>
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
		        <h1>Winery</h1>
		        <a href="index.jsp">Yonsei Valley</a> / 
		        <a href="winery.jsp">Winery</a>
	        </div>
			<div>
	        <form action="wineryInsertResult.jsp" method="post">
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
					   		<label>Client</label>
					   	</td>
					   	<td>
							<select id="inputClient" name="inputClient">
							<%
                          	List<Data> vineyard = QueryManager.getData(Vineyard.class);
                          	for(Data d : vineyard) {
                          		Vineyard v = (Vineyard) d;
                          		%>
                          		<option value="<%=v.getRegistration_id()%>"><%=v.getRegistration_name()%></option>
                          		<%
                         	}
                          	%>
							</select>
						</td>
					</tr>
		        	<tr>
		        		<td>
					   		<label>Rank</label>
					   	</td>
					   	<td>
							<select id="inputRank" name="inputRank">
							<%
                          	List<Data> rank = QueryManager.getData(WineryRank.class);
                          	for(Data d : rank) {
                          		WineryRank r = (WineryRank) d;
                          		%>
                          		<option value="<%=r.getRank()%>"><%=r.getRank()%></option>
                          		<%
                         	}
                          	%>
							</select>
						</td>
					</tr>
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
	                    <td><button onclick="location.href='wineryProduction.jsp'">Production</button></td>
	                    <td><button onclick="location.href='trade.jsp'">Trade</button></td>
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
						    <th>Client</th>
						    <th>Rank</th>
						    <th>Product</th>
						    <th>Production</th>
						    <th>Production (This Year)</th>
						    <th>Sell Quantity</th>
						    <th>Sell Quantity (This Year)</th>
						    <th>Sell Price</th>
						    <th>Sell Price (This Year)</th>
						</tr>
                   	</thead>
                   	<tbody class="target">
                   		<%
						List<Data> winery = QueryManager.getData(WinerySummary.class);
						for(Data d : winery) {
							WinerySummary w = (WinerySummary) d;
							
							if(!w.isProduct_from_land()) {
						%>
						<tr class="target" onClick="location.href='wineryInfo.jsp?winery_id=<%=w.getRegistration_id()%>'">
							<td class="id"><%=w.getRegistration_id()%></td>
							<td class="value"><%=w.getRegistration_name()%></td>
							<td class="value"><%=w.getOwner_name()%></td>
							<td class="value"><%=w.getOwner_number()%></td>
							<td class="value"><%=w.getFund()%></td>
							<td class="value"><%=w.getClient_name()%></td>
							<td class="value"><%=w.getRank()%></td>
							<td><%=w.getProduct_name()%></td>
							<td><%=w.getSum_production_quantity()%></td>
							<td><%=w.getSum_production_quantity_thisyear()%></td>
							<td><%=w.getSum_sell_quantity()%></td>
							<td><%=w.getSum_sell_quantity_thisyear()%></td>
							<td><%=w.getSum_sell_price()%></td>
							<td><%=w.getSum_sell_price_thisyear()%></td>
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
						    <th>ID</th>
						    <th>Name</th>
						    <th>Owner</th>
						    <th>Number</th>
						    <th>Fund</th>
						    <th>Client</th>
						    <th>Rank</th>
						    <th>Product</th>
						    <th>Buy Quantity</th>
						    <th>Buy Quantity (This Year)</th>
						    <th>Buy Price</th>
						    <th>Buy Price (This Year)</th>
						</tr>
                   	</thead>
                   	<tbody class="target">
                   		<%
						for(Data d : winery) {
							WinerySummary w = (WinerySummary) d;

							if(w.isProduct_from_land()) {
						%>
						<tr class="target" onClick="location.href='wineryInfo.jsp?winery_id=<%=w.getRegistration_id()%>'">
							<td class="id"><%=w.getRegistration_id()%></td>
							<td class="value"><%=w.getRegistration_name()%></td>
							<td class="value"><%=w.getOwner_name()%></td>
							<td class="value"><%=w.getOwner_number()%></td>
							<td class="value"><%=w.getFund()%></td>
							<td class="value"><%=w.getClient_name()%></td>
							<td class="value"><%=w.getRank()%></td>
							<td><%=w.getProduct_name()%></td>
							<td><%=w.getSum_buy_quantity()%></td>
							<td><%=w.getSum_buy_quantity_thisyear()%></td>
							<td><%=w.getSum_buy_price()%></td>
							<td><%=w.getSum_buy_price_thisyear()%></td>
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
						    <th>Name</th>
						    <th>Product</th>
						    <th>Quantity</th>
						</tr>
                   	</thead>
                   	<tbody class="target">
						<%
						List<Data> stockVineyard = QueryManager.getDataWithCondition(StockIDtoName.class, "stock.registration_id IN (SELECT registration_id FROM winery)");

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
