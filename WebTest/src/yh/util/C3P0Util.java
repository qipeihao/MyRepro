package yh.util;

import java.sql.Connection;
import java.sql.SQLException;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class C3P0Util {
    private  static ComboPooledDataSource ds = new ComboPooledDataSource("c3p0-config.xml");
    public static Connection getConnection(){
    	try {
			return ds.getConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
    	
    }
    public static void close(Connection conn){
    	try {
			conn.close();//释放数据库连接， 并不关闭
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
}
