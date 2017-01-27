/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
/**
 *
 * @author Jeff & Shai
 */
public class Map 
{
    public static ResultSet GetMapData() throws SQLException
    {
       String sql;
       PreparedStatement st = null;
       Connection db = Database.open();
       ResultSet rs;
       
       sql = "SELECT latitude,longitude, cluster FROM rain";
       st = db.prepareStatement(sql);
       rs = st.executeQuery();
       db.close();
       return rs;
    }
    public static ResultSet GetCluster(String cluster) throws SQLException
    {
        String sql;
        PreparedStatement st = null;
        Connection db = Database.open();
        ResultSet rs;
        
        sql = "SELECT city,average_rainfall, winter_rainfall, spring_rainfall,"
                + " summer_rainfall, fall_rainfall, cluster "
                + "FROM rain WHERE cluster = ?";
        st = db.prepareStatement(sql);
        st.setString(1, cluster);
        rs = st.executeQuery();
        db.close();
        return rs;
    }
}
