<%@page import="wine_project.LandNoOwner"%>
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
		        <h1>Land Purchase</h1>
		        <a href="index.jsp">Yonsei Valley</a> / 
		        <a href="land.jsp">Land</a> / 
		        <a href="landPurchase.jsp">Purchase</a>
	        </div>
			<div>
		        <form action="landPurchaseResult.jsp" method="post">
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
						   		<label>Land</label>
						   	</td>
						   	<td>
								<select id="inputLand" name="inputLand">
									<option value="0">None</option>
								<%
	                          	List<Data> land = QueryManager.getData(LandNoOwner.class);
	                          	for(Data d : land) {
	                          		LandNoOwner l = (LandNoOwner) d;
	                          		%>
	                          		<option value="<%=l.getLand_id()%>"><%=l.getLocation()%>/<%=l.getArea()%></option>
	                          		<%
	                         	}
	                          	%>
								</select>
							</td>
						</tr>
					   	<tr>
					   		<td colspan="2">
			            		<button type="submit">Purchase</button>
			            	</td>
			            </tr>
		       		</table>
		        </form>
	        </div>
	        <div>
               <table>
                   	<thead>
                       <tr>
                           <th>Owner</th>
                           <th>Fund</th>
                           <th>ID</th>
                           <th>Location</th>
                           <th>Area</th>
                           <th>Product</th>
                       </tr>
                   	</thead>
                   	<tbody class="target">
                       	<%
                       	land = QueryManager.getDataWithCondition(LandIDtoName.class, "1=1 ORDER BY registration_id_of_proprietor, land.land_id");
                       	
                       	for(Data d : land) {
                       		LandIDtoName l = (LandIDtoName) d;
                       	%>
                      	<tr onClick="location.href='landInfo.jsp?land_id=<%=l.getLand_id()%>'">
                      		<td class="id"><%=l.getRegistration_name()%></td>
                      		<td class="value"><%=l.getFund()%></td>
                      		<td><%=l.getLand_id()%></td>
                      		<td><%=l.getLocation()%></td>
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
