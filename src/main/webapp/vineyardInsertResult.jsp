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
String registration_name = request.getParameter("inputRegistrationName");
String owner_name = request.getParameter("inputOwnerName");
String owner_number = request.getParameter("inputOwnerNumber");
String fund_String = request.getParameter("inputFund");
String land_idString = request.getParameter("inputLand");

if(registration_name != null && owner_name != null
		&& owner_number != null && fund_String != null
		&& land_idString != null
		&& registration_name != "") {
	int fund = Integer.parseInt(fund_String);
	int land_id = Integer.parseInt(land_idString);
	
	VineyardInsertWithLand vineyard = new VineyardInsertWithLand();
	vineyard.setData(registration_name, owner_name, owner_number, fund, land_id);
	QueryManager.insertData(vineyard);
}

response.sendRedirect("vineyard.jsp");
%>
</body>
</html>