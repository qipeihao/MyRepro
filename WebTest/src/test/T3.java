package test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import yh.util.C3P0Util;

public class T3 {
    public static void main(String[] args) {
		Connection conn = C3P0Util.getConnection();
		try {
			PreparedStatement ps = conn.prepareStatement("select * from emp");
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				System.out.println("######################::"+rs.getString("loginname"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
