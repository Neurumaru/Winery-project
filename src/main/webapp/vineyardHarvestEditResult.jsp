<%@page import="java.sql.Timestamp"%>
<%@page import="wine_project.Harvest"%>
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
String harvest_idString = request.getParameter("harvest_id");
String registration_idString = request.getParameter("inputRegistration");
String land_idString = request.getParameter("inputLand");
String product_idString = request.getParameter("inputProduct");
String quantityString = request.getParameter("inputQuantity");
String harvest_date = request.getParameter("inputDate");

if(harvest_idString != null
	&& registration_idString != null
	&& land_idString != null
	&& product_idString != null
	&& quantityString != null
	&& harvest_date != null) {

	int harvest_id = Integer.parseInt(harvest_idString);
	int registration_id = Integer.parseInt(registration_idString);
	int land_id = Integer.parseInt(land_idString);
	int product_id = Integer.parseInt(product_idString);
	int quantity = Integer.parseInt(quantityString);

	Harvest harvest = new Harvest();
	harvest.setData(harvest_id, quantity, Timestamp.valueOf(harvest_date), product_id, land_id, registration_id);
	QueryManager.updateData(harvest);
}

response.sendRedirect("vineyardHarvestInfo.jsp?harvest_id="+harvest_idString);
%>
</body>
</html>