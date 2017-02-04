package com.awebarts.control;

import com.mysql.jdbc.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBconnection {

    private static Connection con;

    public static Connection getConnect() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/awebarts", "root", "root");

        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }

        return con;
    }

    public static void connect() {
        if (con == null) {

            getConnect();
            System.out.println("connection success");
        }

    }

    public static void disconnect() {

        if (con != null) {
            try {
                con.close();
            } catch (SQLException ex) {
                System.out.println(ex.getMessage());
            }
        }

    }

}
