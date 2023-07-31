/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entity.Order;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.DBConnect;

/**
 *
 * @author Lenovo
 */
public class DAOOrder extends DBConnect {

    public int addOrder(Order order) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[orders]\n"
                + "           ([order_id]\n"
                + "           ,[user_id]\n"
                + "           ,[name_receiver]\n"
                + "           ,[phone_receiver]\n"
                + "           ,[address_receiver]\n"
                + "           ,[total_price]\n"
                + "           ,[date]\n"
                + "           ,[status])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?,?)";

        PreparedStatement pre;
        try {
            pre = conn.prepareStatement(sql);
            pre.setInt(1, order.getOrder_id());
            pre.setInt(2, order.getUser_id());
            pre.setString(3, order.getName_receiver());
            pre.setString(4, order.getPhone_receiver());
            pre.setString(5, order.getAddress_receiver());
            pre.setDouble(6, order.getTotal_price());
            pre.setDate(7, (Date) order.getDate());
            pre.setString(8, order.getStatus());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrder.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int updateOrder(Order order) {
        int n = 0;

        String sql = "UPDATE [dbo].[orders]\n"
                + "   SET [user_id] = ?\n"
                + "      ,[name_receiver] = ?\n"
                + "      ,[phone_receiver] = ?\n"
                + "      ,[address_receiver] = ?\n"
                + "      ,[total_price] = ?\n"
                + "      ,[date] = ?\n"
                + "      ,[status] = ?\n"
                + " WHERE [order_id] = ?";

        PreparedStatement pre;
        try {
            pre = conn.prepareStatement(sql);
            pre.setInt(1, order.getUser_id());
            pre.setString(2, order.getName_receiver());
            pre.setString(3, order.getPhone_receiver());
            pre.setString(4, order.getAddress_receiver());
            pre.setDouble(5, order.getTotal_price());
            pre.setDate(6, (Date) order.getDate());
            pre.setString(7, order.getStatus());
            pre.setInt(8, order.getOrder_id());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrder.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int updateOrderStatus(int order_id, String status) {
        int n = 0;
        String sql = "UPDATE [dbo].[orders]\n"
                + "   SET [status] = ?\n"
                + " WHERE [order_id] = ?";

        PreparedStatement pre;
        try {
            pre = conn.prepareStatement(sql);
            pre.setString(1, status);
            pre.setInt(2, order_id);
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrder.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public Vector<Order> getOrder() {
        Vector<Order> vector = new Vector<Order>();

        String sql = "select * from orders";
        ResultSet rs = this.getData(sql);

        try {
            while (rs.next()) { //rs.previous()
                int order_id = rs.getInt(1);
                int user_id = rs.getInt(2);
                String name_receiver = rs.getString(3);
                String phone_receiver = rs.getString(4);
                String address_receiver = rs.getString(5);
                double total_price = rs.getInt(6);
                Date date = rs.getDate(7);
                String status = rs.getString(8);

                Order order = new Order(order_id, user_id, name_receiver, phone_receiver,
                        address_receiver, total_price, date, status);

                vector.add(order);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrder.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }

    public Vector<Order> getOrder(String sql) {
        Vector<Order> vector = new Vector<Order>();
        ResultSet rs = this.getData(sql);

        try {
            while (rs.next()) { //rs.previous()
                int order_id = rs.getInt(1);
                int user_id = rs.getInt(2);
                String name_receiver = rs.getString(3);
                String phone_receiver = rs.getString(4);
                String address_receiver = rs.getString(5);
                double total_price = rs.getInt(6);
                Date date = rs.getDate(7);
                String status = rs.getString(8);

                Order order = new Order(order_id, user_id, name_receiver, phone_receiver,
                        address_receiver, total_price, date, status);

                vector.add(order);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrder.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }

    public int removeOrder(int id) {
        int n = 0;
        String sql = "delete from orders where order_id= " + id;
        Statement state;
        try {
            state = conn.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOAdmin.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int removeOrderBill(int id) {
        int n = 0;
        String sql = "delete from bill where order_id= " + id;
        Statement state;
        try {
            state = conn.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOBill.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public Vector<Order> searchOrder(String id) {
        Vector<Order> vector = new Vector<Order>();
        String sql = "SELECT * FROM orders WHERE order_id =" + id;
        ResultSet rs = this.getData(sql);

        try {
            while (rs.next()) { //rs.previous()
                int order_id = rs.getInt(1);
                int user_id = rs.getInt(2);
                String name_receiver = rs.getString(3);
                String phone_receiver = rs.getString(4);
                String address_receiver = rs.getString(5);
                double total_price = rs.getInt(6);
                Date date = rs.getDate(7);
                String status = rs.getString(8);

                Order order = new Order(order_id, user_id, name_receiver, phone_receiver,
                        address_receiver, total_price, date, status);

                vector.add(order);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrder.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }

    public Vector<Order> searchOrderUserID(String id) {
        Vector<Order> vector = new Vector<Order>();
        String sql = "SELECT * FROM orders WHERE user_id =" + id;
        ResultSet rs = this.getData(sql);

        try {
            while (rs.next()) { //rs.previous()
                int order_id = rs.getInt(1);
                int user_id = rs.getInt(2);
                String name_receiver = rs.getString(3);
                String phone_receiver = rs.getString(4);
                String address_receiver = rs.getString(5);
                double total_price = rs.getInt(6);
                Date date = rs.getDate(7);
                String status = rs.getString(8);

                Order order = new Order(order_id, user_id, name_receiver, phone_receiver,
                        address_receiver, total_price, date, status);

                vector.add(order);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrder.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }

    public static void main(String[] args) {
        LocalDate currentDate = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("YYYY-MM-dd");
        String formattedDate = currentDate.format(formatter);
        System.out.println(formattedDate);
    }
}
