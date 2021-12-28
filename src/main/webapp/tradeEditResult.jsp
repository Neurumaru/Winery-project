<%@page import="java.sql.Timestamp"%>
<%@page import="wine_project.Trade"%>
<%@page import="wine_project.Land"%>
<%@page import="wine_project.QueryManager"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Yonsei Valley</title>
</head>
<body>
<%
request.setCharacterEncoding("EUC_KR");
String trade_idString = request.getParameter("trade_id");
String sell_registration_idString = request.getParameter("inputSeller");
String buy_registration_idString = request.getParameter("inputBuyer");
String product_idString = request.getParameter("inputProduct");
String quantityString = request.getParameter("inputQuantity");
String priceString = request.getParameter("inputPrice");
String trade_date = request.getParameter("inputDate");

if(trade_idString != null
	&& sell_registration_idString != null
	&& buy_registration_idString != null
	&& product_idString != null
	&& quantityString != null
	&& priceString != null
	&& trade_date != null) {

	int trade_id = Integer.parseInt(trade_idString);
	int sell_registration_id = Integer.parseInt(sell_registration_idString);
	int buy_registration_id = Integer.parseInt(buy_registration_idString);
	int product_id = Integer.parseInt(product_idString);
	int quantity = Integer.parseInt(quantityString);
	int price = Integer.parseInt(priceString);
	
	Trade trade = new Trade();
	trade.setData(trade_id, product_id, quantity, price, Timestamp.valueOf(trade_date), sell_registration_id, buy_registration_id);
	QueryManager.updateData(trade);
}

response.sendRedirect("tradeInfo.jsp?trade_id="+trade_idString);
%>
</body>
</html>