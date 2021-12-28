<%@page import="wine_project.ProductionIDtoName"%>
<%@page import="wine_project.WineryRank"%>
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
		        <h1>Product</h1>
		        <a href="index.jsp">Yonsei Valley</a> / 
		        <a href="product.jsp">Product</a>
	        </div>
			<div>
		        <form action="productInsertResult.jsp" method="post">
		        	<table>
			        	<tr>
		        			<td>
								<label>Name</label>
							</td>
							<td>
								<input id="inputName" name="inputName" type="text"/>
							</td>
						</tr>
			        	<tr>
		        			<td>
								<label>Price</label>
							</td>
							<td>
								<input id="inputPrice" name="inputPrice" type="number"/>
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
                           <th>Name</th>
                           <th>Price</th>
                       </tr>
                   	</thead>
                   	<tbody>
                       	<%
                       	List<Data> product = QueryManager.getDataWithCondition(Product.class, "product_from_land=0");
                       	for(Data d : product) {
                       		Product p = (Product) d;
                       	%>
                      	<tr onClick="location.href='#?product_id=<%=p.getProduct_id()%>'">
                      		<td><%=p.getProduct_id()%></td>
                      		<td><%=p.getProduct_name()%></td>
                      		<td><%=p.getProduct_price()%></td>
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
