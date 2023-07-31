/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entity.Bill;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.DBConnect;

/**
 *
 * @author Lenovo
 */
public class DAOBill extends DBConnect {

    public int addBill(Bill bill) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[bill]\n"
                + "           ([bill_id]\n"
                + "           ,[order_id]\n"
                + "           ,[user_id]\n"
                + "           ,[product_id]\n"
                + "           ,[product_name]\n"
                + "           ,[image]\n"
                + "           ,[list_price]\n"
                + "           ,[quantity]\n"
                + "           ,[status])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?,?,?)";

        PreparedStatement pre;
        try {
            pre = conn.prepareStatement(sql);
            pre.setInt(1, bill.getBill_id());
            pre.setInt(2, bill.getOrder_id());
            pre.setInt(3, bill.getUser_id());
            pre.setInt(4, bill.getProduct_id());
            pre.setString(5, bill.getProduct_name());
            pre.setString(6, bill.getImage());
            pre.setDouble(7, bill.getList_price());
            pre.setInt(8, bill.getQuantity());
            pre.setString(9, bill.getStatus());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOBill.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int updateBill(Bill bill) {
        int n = 0;

        String sql = "UPDATE [dbo].[bill]\n"
                + "   SET [order_id] = ?\n"
                + "      ,[user_id] = ?\n"
                + "      ,[product_id] = ?\n"
                + "      ,[product_name] = ?\n"
                + "      ,[image] = ?\n"
                + "      ,[list_price] = ?\n"
                + "      ,[quantity] = ?\n"
                + "      ,[status] = ?\n"
                + " WHERE [bill_id] = ?";

        PreparedStatement pre;
        try {
            pre = conn.prepareStatement(sql);
            pre.setInt(1, bill.getOrder_id());
            pre.setInt(2, bill.getUser_id());
            pre.setInt(3, bill.getProduct_id());
            pre.setString(4, bill.getProduct_name());
            pre.setString(5, bill.getImage());
            pre.setDouble(6, bill.getList_price());
            pre.setInt(7, bill.getQuantity());
            pre.setString(8, bill.getStatus());
            pre.setInt(9, bill.getBill_id());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOBill.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public Vector<Bill> getBill() {
        Vector<Bill> vector = new Vector<Bill>();

        String sql = "select * from bill";
        ResultSet rs = this.getData(sql);

        try {
            while (rs.next()) { //rs.previous()
                int bill_id = rs.getInt(1);
                int order_id = rs.getInt(2);
                int user_id = rs.getInt(3);
                int product_id = rs.getInt(4);
                String product_name = rs.getString(5);
                String image = rs.getString(6);
                double list_price = rs.getDouble(7);
                int quantity = rs.getInt(8);
                String status = rs.getString(9);

                Bill bill = new Bill(bill_id, order_id, user_id, product_id,
                        product_name, image, list_price, quantity, status);

                vector.add(bill);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOBill.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }

    public Vector<Bill> getBill(String sql) {
        Vector<Bill> vector = new Vector<Bill>();
        ResultSet rs = this.getData(sql);

        try {
            while (rs.next()) { //rs.previous()
                int bill_id = rs.getInt(1);
                int order_id = rs.getInt(2);
                int user_id = rs.getInt(3);
                int product_id = rs.getInt(4);
                String product_name = rs.getString(5);
                String image = rs.getString(6);
                double list_price = rs.getDouble(7);
                int quantity = rs.getInt(8);
                String status = rs.getString(9);

                Bill bill = new Bill(bill_id, order_id, user_id, product_id,
                        product_name, image, list_price, quantity, status);

                vector.add(bill);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOBill.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }

    public int removeBill(int id) {
        int n = 0;
        String sql = "delete from bill where bill_id= " + id;
        Statement state;
        try {
            state = conn.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOBill.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public Vector<Bill> searchBill(String id) {
        Vector<Bill> vector = new Vector<Bill>();
        String sql = "SELECT * FROM bill WHERE bill_id =" + id;
        ResultSet rs = this.getData(sql);

        try {
            while (rs.next()) { //rs.previous()
                 int bill_id = rs.getInt(1);
                int order_id = rs.getInt(2);
                int user_id = rs.getInt(3);
                int product_id = rs.getInt(4);
                String product_name = rs.getString(5);
                String image = rs.getString(6);
                double list_price = rs.getDouble(7);
                int quantity = rs.getInt(8);
                String status = rs.getString(9);

                Bill bill = new Bill(bill_id, order_id, user_id, product_id,
                        product_name, image, list_price, quantity, status);

                vector.add(bill);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOBill.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }
    
        public Vector<Bill> searchBillUserID(String userid,String orderid) {
        Vector<Bill> vector = new Vector<Bill>();
        String sql = "SELECT * FROM bill WHERE user_id =" + userid +" and order_id ="+ orderid;
        ResultSet rs = this.getData(sql);

        try {
            while (rs.next()) { //rs.previous()
                 int bill_id = rs.getInt(1);
                int order_id = rs.getInt(2);
                int user_id = rs.getInt(3);
                int product_id = rs.getInt(4);
                String product_name = rs.getString(5);
                String image = rs.getString(6);
                double list_price = rs.getDouble(7);
                int quantity = rs.getInt(8);
                String status = rs.getString(9);

                Bill bill = new Bill(bill_id, order_id, user_id, product_id,
                        product_name, image, list_price, quantity, status);

                vector.add(bill);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOBill.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }

}
