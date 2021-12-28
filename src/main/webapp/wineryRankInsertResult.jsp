<%@page import="wine_project.WineryRank"%>
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
String rankString = request.getParameter("inputRank");
String multiplierString = request.getParameter("inputMultiplier");

if(rankString != null
	&& multiplierString != null) {
	
	int rank = Integer.parseInt(rankString);
	double multiplier = Double.parseDouble(multiplierString);
	
	WineryRank wineryRank = new WineryRank();
	wineryRank.setData(rank, multiplier);
	QueryManager.insertData(wineryRank);
}

response.sendRedirect("wineryRank.jsp");
%>
</body>
</html>