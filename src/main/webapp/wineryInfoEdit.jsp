<%@page import="wine_project.WineryRank"%>
<%@page import="wine_project.Vineyard"%>
<%@page import="wine_project.LandIDtoName"%>
<%@page import="wine_project.Land"%>
<%@page import="wine_project.Winery"%>
<%@page import="wine_project.QueryManager"%>
<%@page import="wine_project.Data"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%
String winery_id = request.getParameter("winery_id");
String searchQueryVinery 
		= "SELECT * "
		+ "FROM registration "
		+ "JOIN winery ON registration.registration_id = winery.registration_id "
		+ "WHERE winery.registration_id = " + winery_id + ";";
		
List<Data> winery = QueryManager.getData(Winery.class, searchQueryVinery);
Winery w = (Winery) winery.get(0);
%>
<html lang="en">
    <head>
        <title>Yonsei Valley</title>
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <script src="script.js"></script>
        <link rel="stylesheet" href="base.css">
    </head>
    <body>
		<main>
			<div>
		        <h1>Winery</h1>
				<a href="index.jsp">Yonsei Valley</a> /
				<a href="winery.jsp">Winery</a> /
				<a href="wineryInfo.jsp?winery_id=<%=winery_id%>"><%=winery_id%></a> /
				<a href="wineryInfoEdit.jsp?winery_id=<%=winery_id%>">Edit</a>
	        </div>
	        <div>
	        	<form action="wineryEditResult.jsp" method="post">
	        		<input id="registration_id" name="registration_id" type="hidden" value="<%=winery_id%>"/>
		        	<table>
		        		<thead>
		        			<tr>
		        				<th colspan="2">
		        					Information
		        				</th>
		        			</tr>
		        		</thead>
		        		<tbody>
				        	<tr>
			        			<td>
			        				<label>Name</label>
			        			</td>
			        			<td>
									<input id="inputRegistrationName" name="inputRegistrationName" type="text" value="<%=w.getRegistration_name()%>"/>
			        			</td>
			        		</tr>
			        		<tr>
			        			<td>
									<label>Owner</label>
								</td>
								<td>
									<input id="inputOwnerName" name="inputOwnerName" type="text" value="<%=w.getOwner_name()%>"/>
								</td>
							</tr>
			        		<tr>
			        			<td>
									<label>Number</label>
								</td>
								<td>
									<input id="inputOwnerNumber" name="inputOwnerNumber" type="text" value="<%=w.getOwner_number()%>"/>
								</td>
							</tr>
			        		<tr>
			        			<td>
									<label>Fund</label>
								</td>
								<td>
									<input id="inputFund" name="inputFund" type="number" value="<%=w.getFund()%>"/>
								</td>
							</tr>
							<tr>
				        		<td>
							   		<label>Client</label>
							   	</td>
							   	<td>
									<select id="inputClient" name="inputClient">
									<%
		                          	List<Data> vineyard = QueryManager.getData(Vineyard.class);
		                          	for(Data d : vineyard) {
		                          		Vineyard v = (Vineyard) d;
		                          		
		                          		if(v.getRegistration_id() == w.getClient_id()) {
	                          			%>
		                          		<option value="<%=v.getRegistration_id()%>" selected="selected"><%=v.getRegistration_name()%></option>
		                          		<%
		                          		}
		                          		else {
		                          		%>
		                          		<option value="<%=v.getRegistration_id()%>"><%=v.getRegistration_name()%></option>
		                          		<%
		                          		}
		                         	}
		                          	%>
									</select>
								</td>
							</tr>
				        	<tr>
				        		<td>
							   		<label>Rank</label>
							   	</td>
							   	<td>
									<select id="inputRank" name="inputRank">
									<%
		                          	List<Data> rank = QueryManager.getData(WineryRank.class);
									
		                          	for(Data d : rank) {
		                          		WineryRank r = (WineryRank) d;
		                          		
		                          		if(r.getRank() == w.getRank()) {
	                          			%>
		                          		<option value="<%=r.getRank()%>" selected="selected"><%=r.getRank()%></option>
		                          		<%	
		                          		}
		                          		else {
		                          		%>
		                          		<option value="<%=r.getRank()%>"><%=r.getRank()%></option>
		                          		<%
		                          		}
		                         	}
		                          	%>
									</select>
								</td>
							</tr>
			        		<tr>
			        			<td colspan="2">
			        				<button type="submit">Edit</button>
			        			</td>
			        		</tr>
		        		</tbody>
	        		</table>
	        	</form>
	        </div>
		</main>
    </body>
</html>