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

if(registration_idString != null
	&& registration_name != null && owner_name != null
	&& owner_number != null && fundString != null) {
	int registration_id = Integer.parseInt(registration_idString);
	int fund = Integer.parseInt(fundString);
	
	Vineyard vineyard = new Vineyard();
	vineyard.setData(registration_id, registration_name, owner_name, owner_number, fund);
	QueryManager.updateData(vineyard);
}

response.sendRedirect("vineyardInfo.jsp?vineyard_id="+registration_idString);
%>
</body>
</html>