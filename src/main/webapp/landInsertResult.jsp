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
String registration_id_of_proprietorString = request.getParameter("inputOwner");
String location = request.getParameter("inputLocation");
String areaString = request.getParameter("inputArea");
String product_idSting = request.getParameter("inputProduct");

if(registration_id_of_proprietorString != null && location != null
		&& areaString != null && product_idSting != null) {
	int registration_id_of_proprietor = Integer.parseInt(registration_id_of_proprietorString);
	int area = Integer.parseInt(areaString);
	int product_id = Integer.parseInt(product_idSting);
	
	Land land = new Land();
	land.setData(area, location, registration_id_of_proprietor, product_id);
	QueryManager.insertData(land);
}

response.sendRedirect("land.jsp");
%>
</body>
</html>