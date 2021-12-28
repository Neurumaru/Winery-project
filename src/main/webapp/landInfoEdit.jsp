<%@page import="wine_project.ProductFromLand"%>
<%@page import="wine_project.Registration"%>
<%@page import="wine_project.LandIDtoName"%>
<%@page import="wine_project.Vineyard"%>
<%@page import="wine_project.QueryManager"%>
<%@page import="wine_project.Data"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%
String land_id = request.getParameter("land_id");
List<Data> land = QueryManager.getDataWithCondition(LandIDtoName.class, "land.land_id="+land_id);
LandIDtoName l = (LandIDtoName) land.get(0);
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
		        <h1>Land</h1>
		        <a href="index.jsp">Yonsei Valley</a> /
				<a href="land.jsp">Land</a> /
				<a href="landInfo.jsp?land_id=<%=land_id%>"><%=land_id%></a> / 
				<a href="landInfoEdit.jsp?land_id=<%=land_id%>">Edit</a>
	        </div>
	        <div>
	        	<form action="landEditResult.jsp" method="post">
	        		<input id="land_id" name="land_id" type="hidden" value="<%=land_id%>"/>
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
							   		<label>Owner</label>
							   	</td>
							   	<td>
									<select id="inputOwner" name="inputOwner">
										<option value="0">None</option>
										<%
										List<Data> registration = QueryManager.getData(Registration.class);
										for(Data d : registration) {
										  	Registration r = (Registration) d;
										  	if(r.getRegistration_id() == l.getRegistration_id_of_proprietor()) {
										%>
										<option value="<%=r.getRegistration_id()%>" selected="selected"><%=r.getRegistration_name()%></option>
										<%
										  	} 
										  	else {
										%>
										<option value="<%=r.getRegistration_id()%>"><%=r.getRegistration_name()%></option>
										<%
											}
										}
										%>
									</select>
								</td>
			        		</tr>
			        		<tr>
			        			<td>
			        				<label>Location</label>
			        			</td>
			        			<td>
			        				<input id="inputLocation" name="inputLocation" type="text" value="<%=l.getLocation()%>"/>
			        			</td>
			        		</tr>
			        		<tr>
			        			<td>
			        				<label>Area</label>
			        			</td>
			        			<td>
			        				<input id="inputArea" name="inputArea" type="number" value="<%=l.getArea()%>"/>
			        			</td>
			        		<tr>
			        			<td>
			        				<label>Product</label>
			        			</td>
			        			<td>
			        				<select id="inputProduct" name="inputProduct">
				                    	<option value="0">None</option>
					                    <%
					                    List<Data> product = QueryManager.getData(ProductFromLand.class);
					                    for(Data d : product) {
					                    	ProductFromLand p = (ProductFromLand) d;
					                    	if(l.getProduct_id() == p.getProduct_id()) {
					                    %>
					                    <option value="<%=p.getProduct_id()%>" selected="selected"><%=p.getProduct_name()%></option>
					                    <%
					                    	}
					                    	else {
					                    %>
					                    <option value="<%=p.getProduct_id()%>"><%=p.getProduct_name()%></option>
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