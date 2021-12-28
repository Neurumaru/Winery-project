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
		        <h1>Winery Rank</h1>
		        <a href="index.jsp">Yonsei Valley</a> / 
		        <a href="wineryRank.jsp">Winery Rank</a>
	        </div>
			<div>
		        <form action="wineryRankInsertResult.jsp" method="post">
		        	<table>
			        	<tr>
		        			<td>
								<label>Rank</label>
							</td>
							<td>
								<input id="inputRank" name="inputRank" type="number"/>
							</td>
						</tr>
			        	<tr>
		        			<td>
								<label>Multiplier</label>
							</td>
							<td>
								<input id="inputMultiplier" name="inputMultiplier" type="number" step="0.01"/>
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
                           <th>Rank</th>
                           <th>Multiplier</th>
                       </tr>
                   	</thead>
                   	<tbody>
                       	<%
                       	List<Data> rank = QueryManager.getData(WineryRank.class);
                       	for(Data d : rank) {
                       		WineryRank r = (WineryRank) d;
                       	%>
                      	<tr onClick="location.href='#?rank=<%=r.getRank()%>'">
                      		<td><%=r.getRank()%></td>
                      		<td><%=r.getPrice_multiplier()%></td>
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
