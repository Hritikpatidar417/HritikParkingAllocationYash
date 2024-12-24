package com.parkingallocationyash.JDBCutils;

import java.sql.Connection;
import java.sql.DriverManager;

public class JdbcUtils {

    private final String url = "jdbc:mysql://localhost:3306/yashparking";
    private final String username ="root";
    private final String pass = "root";


    public JdbcUtils() {

        try {

            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, username, pass);
            System.out.println("JDBC Connection Establish");
            

        } catch (Exception e) {
            e.printStackTrace();
        }


    }
}
