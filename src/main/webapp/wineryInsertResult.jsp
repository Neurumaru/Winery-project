<%@page import="wine_project.Winery"%>
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
String client_idString = request.getParameter("inputClient");
String rank_String = request.getParameter("inputRank");

if(registration_name != null && owner_name != null
		&& owner_number != null && fund_String != null
		&& client_idString != null
		&& rank_String != null
		&& registration_name != "") {
	int fund = Integer.parseInt(fund_String);
	int client_id = Integer.parseInt(client_idString);
	int rank = Integer.parseInt(rank_String);
	
	Winery winery = new Winery();
	winery.setData(registration_name, owner_name, owner_number, fund, client_id, rank);
	QueryManager.insertData(winery);
}

response.sendRedirect("winery.jsp");
%>
</body>
</html>