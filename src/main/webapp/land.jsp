<%@page import="wine_project.ProductFromLand"%>
<%@page import="wine_project.Registration"%>
<%@page import="wine_project.Data"%>
<%@page import="wine_project.LandIDtoName"%>
<%@page import="wine_project.Product"%>
<%@page import="wine_project.Land"%>
<%@page import="wine_project.Vineyard"%>
<%@page import="java.util.List"%>
<%@page import="wine_project.QueryManager"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
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
		        <a href="index.jsp">Yonsei Valley</a> / <a href="land.jsp">Land</a>
	        </div>
			<div>
	        <form action="landInsertResult.jsp" method="post">
	        	<table>
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
							%>
							<option value="<%=r.getRegistration_id()%>"><%=r.getRegistration_name()%></option>
							<%
							}
							%>
							</select>
						</td>
					<tr>
					<tr>
						<td>
					   		<label>Location</label>
					   	</td>
					   	<td>
				   			<input id="inputLocation" name="inputLocation" type="text"/>
				   		</td>
				   	<tr>
				   		<td>
				   			<label>Area</label>
				   		</td>
				   		<td>
				   			<input id="inputArea" name="inputArea" type="number"/>
				   		</td>
				   	</tr>
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
		                    %>
		                    <option value="<%=p.getProduct_id()%>"><%=p.getProduct_name()%></option>
		                    <%
		                    }
		                    %>
		                    </select>
	                    </td>
					</tr>
				   	<tr>
				   		<td colspan="2">
		            		<button type="submit">Insert Data</button>
		            	</td>
		            </tr>
	       		</table>
	        </form>
	        </div>
	        <div>
               <table>
                   	<thead>
                       <tr>
                           <th>ID</th>
                           <th>Location</th>
                           <th>Owner</th>
                           <th>Area</th>
                           <th>Product</th>
                       </tr>
                   	</thead>
                   	<tbody>
                       	<%
                       	List<Data> land = QueryManager.getData(LandIDtoName.class);
                       	for(Data d : land) {
                       		LandIDtoName l = (LandIDtoName) d;
                       	%>
                      	<tr onClick="location.href='landInfo.jsp?land_id=<%=l.getLand_id()%>'">
                      		<td><%=l.getLand_id()%></td>
                      		<td><%=l.getLocation()%></td>
                      		<td><%=l.getRegistration_name()%></td>
                      		<td><%=l.getArea()%></td>
                      		<td><%=l.getProduct_name()%></td>
                      	</tr>
                      	<%
                       	}
                       	%>
                   	</tbody>
               	</table>
			</div>
		</main>
    </body>
</html>
