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
String trade_id = request.getParameter("trade_id");
List<Data> trade = QueryManager.getDataWithCondition(TradeIDtoName.class, "trade.trade_id="+trade_id);
TradeIDtoName t = (TradeIDtoName) trade.get(0);
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
		        <h1>Trade Information</h1>
		        <a href="index.jsp">Yonsei Valley</a> /
				<a href="trade.jsp">Trade</a> /
				<a href="tradeInfos.jsp?trade_id=<%=trade_id%>"><%=trade_id%></a>
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
		        				<label>Seller</label>
		        			</td>
		        			<td>
		        				<%=t.getSell_registration_name()%>
		        			</td>
		        		</tr>
		        		<tr>
		        			<td>
		        				<label>Buyer</label>
		        			</td>
		        			<td>
		        				<%=t.getBuy_registration_name()%>
		        			</td>
		        		</tr>
		        		<tr>
		        			<td>
		        				<label>Product</label>
		        			</td>
		        			<td>
		        				<%=t.getProduct_name()%>
		        			</td>
		        		</tr>
		        		<tr>
		        			<td>
		        				<label>Quantity</label>
		        			</td>
		        			<td>
		        				<%=t.getQuantity()%>
		        			</td>
		        		</tr>
		        		<tr>
		        			<td>
		        				<label>Price</label>
		        			</td>
		        			<td>
		        				<%=t.getPrice()%>
		        			</td>
		        		</tr>
		        		<tr>
		        			<td>
		        				<label>Date</label>
		        			</td>
		        			<td>
		        				<%=t.getTrade_date()%>
		        			</td>
		        		</tr>
		        		<tr>
		        			<td colspan="2">
		        				<button onClick="location.href='tradeInfoEdit.jsp?trade_id=<%=trade_id%>'">
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