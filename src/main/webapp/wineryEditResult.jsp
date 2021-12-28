<%@page import="wine_project.Winery"%>
<%@page import="wine_project.Vineyard"%>
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
String registration_idString = request.getParameter("registration_id");
String registration_name = request.getParameter("inputRegistrationName");
String owner_name = request.getParameter("inputOwnerName");
String owner_number = request.getParameter("inputOwnerNumber");
String fundString = request.getParameter("inputFund");
String client_idString = request.getParameter("inputClient");
String rankString = request.getParameter("inputRank");

if(registration_idString != null
	&& registration_name != null
	&& owner_name != null
	&& owner_number != null
	&& fundString != null
	&& client_idString != null
	&& rankString != null) {

	int registration_id = Integer.parseInt(registration_idString);
	int fund = Integer.parseInt(fundString);
	int client_id = Integer.parseInt(client_idString);
	int rank = Integer.parseInt(rankString);
	
	Winery winery = new Winery();
	winery.setData(registration_id, registration_name, owner_name, owner_number, fund, client_id, rank);
	QueryManager.updateData(winery);
}

response.sendRedirect("wineryInfo.jsp?winery_id="+registration_idString);
%>
</body>
</html>