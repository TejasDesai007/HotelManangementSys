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
 * @author TEJAS
 */
public class RoomDtls {

    private String txtUserId, txtRoomdscrpt, txtRoomPrice, slcRoomType, txtRoomNo;

    public String getTxtUserId() {
        return txtUserId;
    }

    public void setTxtUserId(String txtUserId) {
        this.txtUserId = txtUserId;
    }

    public String getTxtRoomdscrpt() {
        return txtRoomdscrpt;
    }

    public void setTxtRoomdscrpt(String txtRoomdscrpt) {
        this.txtRoomdscrpt = txtRoomdscrpt;
    }

    public String getTxtRoomPrice() {
        return txtRoomPrice;
    }

    public void setTxtRoomPrice(String txtRoomPrice) {
        this.txtRoomPrice = txtRoomPrice;
    }

    public String getSlcRoomType() {
        return slcRoomType;
    }

    public void setSlcRoomType(String slcRoomType) {
        this.slcRoomType = slcRoomType;
    }

    public String getTxtRoomNo() {
        return txtRoomNo;
    }

    public void setTxtRoomNo(String txtRoomNo) {
        this.txtRoomNo = txtRoomNo;
    }

    public String isBlankNull(String s) {
        return (s == null || s.trim().isEmpty()) ? "" : s;
    }

    public Exception RoomDtls() throws SQLException {
        Exception ex = null;
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rst = null;
        MySqlConnection dbc;
        String roomtype = "";
        try {
            dbc = new MySqlConnection();
            con = dbc.getConnection();
            pstmt = con.prepareStatement("Select type from roomstypesdetails where type_id = ?", ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            pstmt.setString(1, slcRoomType);
            rst = pstmt.executeQuery();
            if (rst.next()) {
                roomtype = rst.getString("type");
            }

            rst.close();
            pstmt.close();
            pstmt = con.prepareStatement("Insert into rooms(room_no, status, room_type, price_per_day, room_dscrpt, created_on, created_by, type_id) values (?,'Unoccupied',?,?,?,now(),?,?)");
            pstmt.setString(1, txtRoomNo);
            pstmt.setString(2, roomtype);
            pstmt.setString(3, txtRoomPrice);
            pstmt.setString(4, txtRoomdscrpt);
            pstmt.setString(5, txtUserId);
            pstmt.setString(6, slcRoomType);
            pstmt.executeUpdate();
            pstmt.close();

        } catch (Exception e) {
            System.out.println("Error in RoomDtls.java");
            e.printStackTrace();
            e = ex;
        } finally {
            con.close();
        }
        return ex;
    }

}
