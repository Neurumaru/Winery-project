package wine_project;

import java.sql.ResultSet;
import java.util.List;

public abstract class Data {
	public abstract void setData(ResultSet result);
	public abstract String getSearchQuery();
	public abstract String getSearchQuery(String condition);
	public abstract List<String> getInsertQuery();
	public abstract List<String> getUpdateQuery();
}
