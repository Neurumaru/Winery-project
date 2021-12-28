<%@page import="wine_project.Production"%>
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
String winery_idString = request.getParameter("inputWinery");
String recipe_idString = request.getParameter("inputRecipe");
String quantityString = request.getParameter("inputQuantity");

if(winery_idString != null
	&& recipe_idString != null
	&& quantityString != null) {
	int winery_id = Integer.parseInt(winery_idString);
	int recipe_id = Integer.parseInt(recipe_idString);
	int quantity = Integer.parseInt(quantityString);
	
	Production production = new Production();
	production.setData(quantity, recipe_id, winery_id);
	QueryManager.insertData(production);
}

response.sendRedirect("wineryProduction.jsp");
%>
</body>
</html>