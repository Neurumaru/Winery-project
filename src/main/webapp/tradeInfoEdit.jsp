<%@page import="wine_project.Product"%>
<%@page import="wine_project.TradeIDtoName"%>
<%@page import="wine_project.ProductFromLand"%>
<%@page import="wine_project.Registration"%>
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
				<a href="tradeInfo.jsp?trade_id=<%=trade_id%>"><%=trade_id%></a> / 
				<a href="tradeInfoEdit.jsp?trade_id=<%=trade_id%>">Edit</a>
	        </div>
	        <div>
	        	<form action="tradeEditResult.jsp" method="post">
	        		<input id="trade_id" name="trade_id" type="hidden" value="<%=trade_id%>"/>
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
									<select id="inputSeller" name="inputSeller">
										<option value="0">None</option>
										<%
										List<Data> registration = QueryManager.getData(Registration.class);
										for(Data d : registration) {
										  	Registration r = (Registration) d;
										  	if(r.getRegistration_id() == t.getSell_registration_id()) {
										%>
										<option value="<%=r.getRegistration_id()%>" selected="selected"><%=r.getRegistration_name()%></option>
										<%
										  	} 
										  	else {
										%>
										<option value="<%=r.getRegistration_id()%>"><%=r.getRegistration_name()%></option>
										<%
											}
										}
										%>
									</select>
								</td>
			        		</tr>
			        		<tr>
			        			<td>
							   		<label>Buyer</label>
							   	</td>
							   	<td>
									<select id="inputBuyer" name="inputBuyer">
										<option value="0">None</option>
										<%
										for(Data d : registration) {
										  	Registration r = (Registration) d;
										  	if(r.getRegistration_id() == t.getBuy_registration_id()) {
										%>
										<option value="<%=r.getRegistration_id()%>" selected="selected"><%=r.getRegistration_name()%></option>
										<%
										  	} 
										  	else {
										%>
										<option value="<%=r.getRegistration_id()%>"><%=r.getRegistration_name()%></option>
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
				        				<%
										List<Data> product = QueryManager.getData(Product.class);
										for(Data d : product) {
										  	Product p = (Product) d;
										  	if(p.getProduct_id() == t.getProduct_id()) {
										%>
										<option value="<%=p.getProduct_id()%>" selected="selected"><%=p.getProduct_name()%></option>
										<%
										  	} 
										  	else {
										%>
										<option value="<%=p.getProduct_id()%>"><%=p.getProduct_name()%></option>
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
			        				<input id="inputQuantity" name="inputQuantity" type="number" value="<%=t.getQuantity()%>"/>
			        			</td>
			        		</tr>
			        		<tr>
			        			<td>
			        				<label>Price</label>
			        			</td>
			        			<td>
			        				<input id="inputPrice" name="inputPrice" type="number" value="<%=t.getPrice()%>"/>
			        			</td>
			        		</tr>
			        		<tr>
			        			<td>
			        				<label>Date</label>
			        			</td>
			        			<td>
			        				<input id="inputDate" name="inputDate" type="text" value="<%=t.getTrade_date()%>"/>
			        			</td>
			        		</tr>
			        		<tr>
			        			<td colspan="2">
			        				<button type="submit">Edit</button>
			        			</td>
			        		</tr>
		        		</tbody>
	        		</table>
	        	</form>
	        </div>
		</main>
    </body>
</html>