<%@page import="wine_project.Winery"%>
<%@page import="wine_project.WineryRank"%>
<%@page import="javax.swing.WindowConstants"%>
<%@page import="wine_project.Data"%>
<%@page import="java.util.List"%>
<%@page import="wine_project.Product"%>
<%@page import="wine_project.Trade"%>
<%@page import="wine_project.Land"%>
<%@page import="wine_project.QueryManager"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Vineyard</title>
</head>
<body>
<%
request.setCharacterEncoding("EUC_KR");
String server_idString = request.getParameter("inputSeller");
String client_idString = request.getParameter("inputBuyer");
String product_idString = request.getParameter("inputProduct");
String quantityString = request.getParameter("inputQuantity");

if(server_idString != null
	&& product_idString != null 
	&& quantityString != null) {
	int server_id = Integer.parseInt(server_idString);
	int client_id = client_idString != null ? Integer.parseInt(client_idString) : 0;
	int product_id = Integer.parseInt(product_idString);
	int quantity = Integer.parseInt(quantityString);
	
	List<Data> product = QueryManager.getDataWithCondition(Product.class, "product_id="+product_id);
	Product p = (Product) product.get(0);
	
	int price = p.getProduct_price() * quantity;	
	if(client_id == 0) {
		List<Data> server = QueryManager.getDataWithCondition(Winery.class,	"registration.registration_id="+server_id);
		Winery s = (Winery) server.get(0);
		List<Data> rank = QueryManager.getDataWithCondition(WineryRank.class, "rank="+s.getRank());
		WineryRank r = (WineryRank) rank.get(0);
		price = (int) Math.ceil(price * r.getPrice_multiplier());
	}
	
	Trade trade = new Trade();
	trade.setData(product_id, quantity, price, server_id, client_id);
	QueryManager.insertData(trade);
}

response.sendRedirect("trade.jsp");
%>
</body>
</html>