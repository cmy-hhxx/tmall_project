package test;

import util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class test_url {
    public static void main(String[] args) {
        String sql = "select url from product where deleteAt is null and id=?";
        String  url_final = null;
//        try {
//            Connection c = DBUtil.getConnection();
//            PreparedStatement ps = c.prepareStatement(sql);
//            ps.setInt(1,3);
//            ResultSet re = ps.executeQuery();
//            if(re.next()){
//                url_final = re.getString("url");
//            }
//        } catch (SQLException e){
//            e.printStackTrace();
//        }

        try(Connection c = DBUtil.getConnection();
            PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1,4);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                url_final = rs.getString("url");
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        System.out.println(url_final);
    }
}
