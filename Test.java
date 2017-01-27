package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Jeff
 */
public class Test 
{
    public static void main(String [] args) throws Exception
    {
        ResultSet rs;
        rs = db.Map.GetCluster("1");
        int counter = 0;
        String[] test = new String[500];
        while (rs.next())
        {
            test[counter] = rs.getString(1);
            counter++;
        }
        System.out.println(test[0]);
        System.out.println(test[1]);
    }
}
