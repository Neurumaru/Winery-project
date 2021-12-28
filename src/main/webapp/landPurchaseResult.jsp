<%@page import="wine_project.Registration"%>
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
<title>Yonsei Valley</title>
</head>
<body>
<%
request.setCharacterEncoding("EUC_KR");
String registration_idString = request.getParameter("inputOwner");
String land_idString = request.getParameter("inputLand");

if(registration_idString != null
	&& land_idString != null) {
	int registration_id = Integer.parseInt(registration_idString);
	int land_id = Integer.parseInt(land_idString);

	List<Data> registration = QueryManager.getDataWithCondition(Registration.class, "registration.registration_id="+registration_id);
	Registration r = (Registration) registration.get(0);
	List<Data> land = QueryManager.getDataWithCondition(Land.class, "land.land_id="+land_id);
	Land l = (Land) land.get(0);
	
	int price = l.getArea() * 10;

	if(r.getFund() >= price) {
		r.setFund(r.getFund() - price);
		l.setRegistration_id_of_proprietor(registration_id);
		QueryManager.updateData(r);
		QueryManager.updateData(l);
	}
}

response.sendRedirect("landPurchase.jsp");
%>
</body>
</html>