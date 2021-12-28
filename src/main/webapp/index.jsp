<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
    <head>
		<title>Yonsei Valley</title>
		<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
		<script src="script.js"></script>
		<link rel="stylesheet" href="main.css">
   	</head>
	<main>
        <h1>Yonsei Valley</h1>
        <div>
	        <table border="1">
	            <tr height="0">
                    <td>Vineyard</td>
                    <td><button onclick="location.href='vineyard.jsp'">Main Page</button></td>
                    <td><button onclick="location.href='vineyardHarvest.jsp'">Harvest</button></td>
                    <td rowspan="2"><button style="height:50px" onclick="location.href='trade.jsp'">Trade</button></td>
	            </tr>
	            <tr>
                    <td>Winery</td>
                    <td><button onclick="location.href='winery.jsp'">Main Page</button></td>
                    <td><button onclick="location.href='wineryProduction.jsp'">Production</button></td>
	            </tr>
	            <tr>
                	<td>Land</td>
                    <td><button onclick="location.href='land.jsp'">Main Page</button></td>
                    <td colspan="2"><button onclick="location.href='landPurchase.jsp'">Purchase</button></td>
	            </tr>
	        </table>
        </div>
        <div>
	        <table border="1">
	            <tr>
                    <td>Winery Rank</td>
                    <td><button onclick="location.href='wineryRank.jsp'">Edit</button></td>
	            </tr>
	            <tr>
                    <td>Product</td>
                    <td><button onclick="location.href='product.jsp'">Edit</button></td>
	            </tr>
	            <tr>
                    <td>Recipe</td>
                    <td><button onclick="location.href='recipe.jsp'">Edit</button></td>
	            </tr>
	        </table>
        </div>
	</main>
</html>
