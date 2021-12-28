<%@page import="wine_project.Product"%>
<%@page import="wine_project.WineryRank"%>
<%@page import="wine_project.VineyardInsertWithLand"%>
<%@page import="wine_project.Vineyard"%>
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
String name = request.getParameter("inputName");
String priceString = request.getParameter("inputPrice");

if(name != null
	&& priceString != null) {
	
	int price = Integer.parseInt(priceString);
	
	Product product = new Product();
	product.setData(name, price, false);
	QueryManager.insertData(product);
}

response.sendRedirect("product.jsp");
%>
</body>
</html>