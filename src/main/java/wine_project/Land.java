package wine_project;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class Land extends Data {
	private int land_id;
	private String location;
	private int area;
	private int registration_id_of_proprietor;

	private int product_id;
	private static String searchQuery
		= "SELECT * FROM land "
		+ "LEFT OUTER JOIN land_product "
		+ "ON land.land_id=land_product.land_id";
	
	public void setData(ResultSet result) {
		try {
			land_id = result.getInt("land_id");
			location = result.getNString("location");
			area = result.getInt("area");
			registration_id_of_proprietor = result.getInt("registration_id_of_proprietor");
			product_id = result.getInt("product_id");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void setData(int land_id, int area, String location, int registration_id_of_proprietor, int product_id) {
		this.land_id = land_id;
		this.area = area;
		this.location = location;
		this.registration_id_of_proprietor = registration_id_of_proprietor;
		this.product_id = product_id;
	}
	
	public void setData(int area, String location, int registration_id_of_proprietor, int product_id) {
		setData(QueryManager.getAutoIncrement("land"), area, location, registration_id_of_proprietor, product_id);
	}
	
	public String getSearchQuery() {
		return searchQuery + ";";
	}
	
	public String getSearchQuery(String condition) {
		return searchQuery + " WHERE " + condition + ";";
	}
	
	public List<String> getInsertQuery() {
		List<String> insertQueryList = new ArrayList<String>();
		String insertQuery = "INSERT INTO land (land_id, area, location, registration_id_of_proprietor) "
								+ "VALUE (" + land_id + ", " + area + ", '" + location + "'";
		if(registration_id_of_proprietor != 0)
			insertQuery += ", " + registration_id_of_proprietor;
		else
			insertQuery += ", null";
		insertQuery += ");";
		insertQueryList.add(insertQuery);
		
		if(product_id != 0) {
			insertQuery = "INSERT INTO land_product (land_id, product_id) "
						+ "VALUE (" + land_id + ", " + product_id + ");";
			insertQueryList.add(insertQuery);
		}
		return insertQueryList;
	}
	
	public List<String> getUpdateQuery() {
		List<String> updateQueryList = new ArrayList<String>();
		String updateQuery = "UPDATE land SET area=" + area + ", location='" + location + "'";
		if(registration_id_of_proprietor != 0)
			updateQuery += ", registration_id_of_proprietor=" + registration_id_of_proprietor;
		else
			updateQuery += ", registration_id_of_proprietor=null";
		updateQuery += " WHERE land_id=" + land_id + ";";
		updateQueryList.add(updateQuery);

		if(product_id != 0) {
			updateQuery = "INSERT INTO land_product (land_id, product_id) "
						+ "VALUE (" + land_id + ", " + product_id + ") "
						+ "ON DUPLICATE KEY UPDATE product_id=" + product_id + ";";
		}
		else {
			updateQuery = "DELETE FROM land_product WHERE land_id=" + land_id + ";";
		}
		updateQueryList.add(updateQuery);
		return updateQueryList;
	}

	public int getLand_id() {
		return land_id;
	}

	public String getLocation() {
		return location;
	}

	public int getArea() {
		return area;
	}

	public int getRegistration_id_of_proprietor() {
		return registration_id_of_proprietor;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setRegistration_id_of_proprietor(int registration_id_of_proprietor) {
		this.registration_id_of_proprietor = registration_id_of_proprietor;
	}
}
