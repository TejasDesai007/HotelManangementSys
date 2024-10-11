/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author DELL
 */
public class MySqlConnection {
    Connection con = null;

    public Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/trekingdb";
            String username = "root";
            String password = "root";
            con = DriverManager.getConnection(url, username, password);
            System.out.println("Connection String : >>>>>>" + con);
        } catch (Exception ex) {
            System.out.println("Exception While Connection : " + ex.getMessage());

        }
        return con;
    }
}
