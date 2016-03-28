package db;

import java.sql.Connection;
import java.sql.SQLException;

public class ConnectionPoolSingleton {
	
	private static ConnectionPool cp ;
	private static final String URL="jdbc:mysql://121.42.179.29/cvhammer?useUnicode=true&amp;characterEncoding=utf-8";
	private static final String USER="root";
	private static final String PASSWORD="root123";
	
	private static void init(){
		if (cp == null){
			cp = new ConnectionPool("com.mysql.jdbc.Driver",URL,USER,PASSWORD);
			try {
				cp.createPool();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	
	private ConnectionPoolSingleton(){
		
	}
	
	public synchronized static Connection getConnection() throws SQLException{
		if(cp == null){
			init();
		}  
		return cp.getConnection();
	}
	
	
	public synchronized static void returnConnection(Connection conn){
		cp.returnConnection(conn);
	}

}
