<%@page import="wine_project.Data"%>
<%@page import="java.util.List"%>
<%@page import="wine_project.Harvest"%>
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
String vineyard_idString = request.getParameter("inputVineyard");
String land_id = request.getParameter("inputLand");
String quantityString = request.getParameter("inputQuantity");

List<Data> land = QueryManager.getDataWithCondition(Land.class, "land.land_id="+land_id);
Land l = (Land) land.get(0);

if(vineyard_idString != null
	&& quantityString != null) {

	int vineyard_id = Integer.parseInt(vineyard_idString);
	int quantity = Integer.parseInt(quantityString);
	
	if(quantity <= l.getArea() &&
			quantity > 0) {
		Harvest harvest = new Harvest();
		harvest.setData(quantity, l.getProduct_id(), l.getLand_id(), vineyard_id);
		QueryManager.insertData(harvest);
	}
}

response.sendRedirect("vineyardHarvest.jsp");
%>
</body>
</html>