package wine_project;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class QueryManager {
	
	private static String jdbcDriver = "jdbc:mariadb://localhost:3306/wine_project?characterEncoding=euckr&useUnicode=true&mysqlEncoding=euckr";
	private static String dbUser = "root";
	private static String dbPass = "6659";

	private static String checkStatus = "SHOW TABLE STATUS WHERE NAME='";
	
	@SuppressWarnings({ "deprecation", "rawtypes" })
	public static List<Data> getData(Class c) {
		try {
			return getData(c, ((Data)c.newInstance()).getSearchQuery());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ArrayList<Data>();
	}
	
	@SuppressWarnings({ "deprecation", "rawtypes" })
	public static List<Data> getDataWithCondition(Class c, String condition) {
		try {
			return getData(c, ((Data)c.newInstance()).getSearchQuery(condition));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ArrayList<Data>();
	}
	
	@SuppressWarnings({ "deprecation", "rawtypes" })
	public static List<Data> getData(Class c, String s) {
		List<Data> data = new ArrayList<Data>();
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet result = null;
		
		try {
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			stmt = conn.createStatement();
			System.out.println(s);
			result = stmt.executeQuery(s);
			while(result.next()) {
				Data d = (Data) c.newInstance();
				d.setData(result);
				data.add(d);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				result.close();
				stmt.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return data;
	}
	
	public static void updateData(Data d) {
		try {
			updateData(d.getUpdateQuery());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void updateData(List<String> strings) {
		Connection conn = null;
		Statement stmt = null;
		
		try {
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			conn.setAutoCommit(false);
			stmt = conn.createStatement();
			for(String s : strings) {
				System.out.println(s);
				stmt.executeUpdate(s);
			}
			conn.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.rollback();
				conn.setAutoCommit(true);
				
				stmt.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	
	public static void insertData(Data data) {
		Connection conn = null;
		Statement stmt = null;
		
		try {
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			conn.setAutoCommit(false);
			stmt = conn.createStatement();
			for(String query : data.getInsertQuery()) {
				System.out.println(query);
				stmt.executeUpdate(query);
			}
			conn.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.setAutoCommit(true);
				
				stmt.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}	
	}
	
	public static int getAutoIncrement(String table) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet result = null;
		
		try {
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			stmt = conn.createStatement();
			result = stmt.executeQuery(checkStatus + table + "'");
			result.next(); 
			return result.getInt("auto_increment");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				result.close();
				stmt.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return 0;
	}
}
