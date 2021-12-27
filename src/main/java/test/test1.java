package test;

import util.DBUtil;
import java.sql.*;
public class test1 {
    public static void main(String[] args) {
        try(Connection c = DBUtil.getConnection();
        Statement s = c.createStatement()) {
            String sql = "select * from user";
            ResultSet rs = s.executeQuery(sql);

            System.out.println(rs);
        }catch (SQLException e){
            e.printStackTrace();;
        }
    }
}
