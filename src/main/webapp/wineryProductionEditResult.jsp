<%@page import="wine_project.Production"%>
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
String production_idString = request.getParameter("production_id");
String registration_idString = request.getParameter("inputRegistration");
String recipe_idString = request.getParameter("inputRecipe");
String quantityString = request.getParameter("inputQuantity");
String production_date = request.getParameter("inputDate");

if(production_idString != null
	&& registration_idString != null
	&& recipe_idString != null
	&& quantityString != null
	&& production_date != null) {

	int production_id = Integer.parseInt(production_idString);
	int registration_id = Integer.parseInt(registration_idString);
	int recipe_id = Integer.parseInt(recipe_idString);
	int quantity = Integer.parseInt(quantityString);
	
	Production production = new Production();
	production.setData(production_id, quantity, Timestamp.valueOf(production_date), recipe_id, registration_id);
	QueryManager.updateData(production);
}

response.sendRedirect("wineryProductionInfo.jsp?production_id="+production_idString);
%>
</body>
</html>