<%@page import="wine_project.LandIDtoName"%>
<%@page import="wine_project.Land"%>
<%@page import="wine_project.Vineyard"%>
<%@page import="wine_project.QueryManager"%>
<%@page import="wine_project.Data"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%
String vineyard_id = request.getParameter("vineyard_id");
String searchQueryVinery 
		= "SELECT * "
		+ "FROM registration "
		+ "JOIN vineyard ON registration.registration_id = vineyard.registration_id "
		+ "WHERE vineyard.registration_id = " + vineyard_id + ";";
		
List<Data> vineyard = QueryManager.getData(Vineyard.class, searchQueryVinery);
Vineyard v = (Vineyard) vineyard.get(0);
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
		        <h1>Vineyard Information</h1>
				<a href="index.jsp">Yonsei Valley</a> /
				<a href="vineyard.jsp">Vineyard</a> /
				<a href="vineyardInfo.jsp?vineyard_id=<%=vineyard_id%>"><%=vineyard_id%></a> /
				<a href="vineyardInfoEdit.jsp?vineyard_id=<%=vineyard_id%>">Edit</a>
	        </div>
	        <div>
	        	<form action="vineyardEditResult.jsp" method="post">
	        		<input id="registration_id" name="registration_id" type="hidden" value="<%=vineyard_id%>"/>
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
									<input id="inputRegistrationName" name="inputRegistrationName" type="text" value="<%=v.getRegistration_name()%>"/>
			        			</td>
			        		</tr>
			        		<tr>
			        			<td>
									<label>Owner</label>
								</td>
								<td>
									<input id="inputOwnerName" name="inputOwnerName" type="text" value="<%=v.getOwner_name()%>"/>
								</td>
							</tr>
			        		<tr>
			        			<td>
									<label>Number</label>
								</td>
								<td>
									<input id="inputOwnerNumber" name="inputOwnerNumber" type="text" value="<%=v.getOwner_number()%>"/>
								</td>
							</tr>
			        		<tr>
			        			<td>
									<label>Fund</label>
								</td>
								<td>
									<input id="inputFund" name="inputFund" type="number" value="<%=v.getFund()%>"/>
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