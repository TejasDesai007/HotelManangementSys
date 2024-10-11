/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author DELL
 */
public class UserRegistration {

    private String txtFullName, txtEmail, txtUserNm, txtPassword, txtCnfPassword;

    public String getTxtFullName() {
        return txtFullName;
    }

    public void setTxtFullName(String txtFullName) {
        this.txtFullName = txtFullName;
    }

    public String getTxtEmail() {
        return txtEmail;
    }

    public void setTxtEmail(String txtEmail) {
        this.txtEmail = txtEmail;
    }

    public String getTxtUserNm() {
        return txtUserNm;
    }

    public void setTxtUserNm(String txtUserNm) {
        this.txtUserNm = txtUserNm;
    }

    public String getTxtPassword() {
        return txtPassword;
    }

    public void setTxtPassword(String txtPassword) {
        this.txtPassword = txtPassword;
    }

    public String getTxtCnfPassword() {
        return txtCnfPassword;
    }

    public void setTxtCnfPassword(String txtCnfPassword) {
        this.txtCnfPassword = txtCnfPassword;
    }

    public String isBlankNull(String str) {
        return (str == null || str.trim().isEmpty()) ? "" : str;
    }

    public Exception UserRegistration() throws SQLException {
        Exception ex = null;
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rst = null;
        MySqlConnection dbc = new MySqlConnection();
        try {
            dbc = new MySqlConnection();
            con = dbc.getConnection();
            pstmt = con.prepareStatement("insert into UserDetails(UserName, Name, Email, Password, CreatedOn) values(?,?,?,?,now())");
            pstmt.setString(1, txtUserNm);
            pstmt.setString(2, txtFullName);
            pstmt.setString(3, txtEmail);
            pstmt.setString(4, txtPassword);
            System.out.println();
            System.out.println("insert into UserDetails(UserName, Name, Email, Password, CreatedOn) values('"+ txtUserNm +"','"+ txtFullName +"','"+ txtEmail +"','"+ txtPassword +"',now())");
            pstmt.close();
        } catch (Exception e) {
            e.printStackTrace();
            e = ex;
        } finally {
            con.close();
        }
        return ex;
    }

}
