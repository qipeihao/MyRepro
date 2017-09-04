package yh.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * 
 * @author Administrator
 * 获取数据库连接
 */
public class DBUtil {
    static {
    	 try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
    /**
     * 返回一个连接对象(Connection对象)
     */
    public static Connection getConnection(){
    	String url="jdbc:oracle:thin:@localhost:1521:orcl";
    	String username="yh";
    	String password="123";
    	try {
			return DriverManager.getConnection(url, username, password);
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
    }
    public static void  closeAll(ResultSet rs,Statement st,Connection conn){
    	  
    		  try {
    			  if(rs!=null){
				     rs.close();
    			  }
    			  if(st!=null){
    				 st.close();
    			  }
    			  if(conn!=null){
    				  conn.close();//彻底关闭数据库连接
    			  }
			  } catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    	 
    }
}
