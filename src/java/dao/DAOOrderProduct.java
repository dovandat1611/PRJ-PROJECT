/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entity.OrderProduct;
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
public class DAOOrderProduct extends DBConnect {

    public int addOrderProduct(OrderProduct op) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[order_product]\n"
                + "           ([order_id]\n"
                + "           ,[product_id]\n"
                + "           ,[quantity])\n"
                + "     VALUES\n"
                + "           (?,?,?)";

        PreparedStatement pre;
        try {
            pre = conn.prepareStatement(sql);
            pre.setInt(1, op.getOrder_id());
            pre.setInt(2, op.getProduct_id());
            pre.setInt(3, op.getQuantity());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrderProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int updateOrderProduct(OrderProduct op) {
        int n = 0;

        String sql = "UPDATE [dbo].[order_product]\n"
                + "   SET [quantity] = ?\n"
                + " WHERE [order_id] = ? and  [product_id] = ?";

        PreparedStatement pre;
        try {
            pre = conn.prepareStatement(sql);
            pre.setInt(1, op.getQuantity());
            pre.setInt(2, op.getOrder_id());
            pre.setInt(3, op.getProduct_id());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrderProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public Vector<OrderProduct> getOrderProduct() {
        Vector<OrderProduct> vector = new Vector<OrderProduct>();

        String sql = "select * from order_product";
        ResultSet rs = this.getData(sql);

        try {
            while (rs.next()) { //rs.previous()
                int order_id = rs.getInt(1);
                int product_id = rs.getInt(2);
                int quantity = rs.getInt(3);

                OrderProduct op = new OrderProduct(order_id, product_id, quantity);

                vector.add(op);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrderProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }

    public Vector<OrderProduct> getOrderProduct(String sql) {
        Vector<OrderProduct> vector = new Vector<OrderProduct>();
        ResultSet rs = this.getData(sql);

        try {
            while (rs.next()) { //rs.previous()
                int order_id = rs.getInt(1);
                int product_id = rs.getInt(2);
                int quantity = rs.getInt(3);

                OrderProduct op = new OrderProduct(order_id, product_id, quantity);

                vector.add(op);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrderProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }

    public int removeOrderProduct(int order_id, int product_id) {
        int n = 0;
        String sql = "delete from order_product where order_id= " + order_id + " and product_id = " + product_id;
        Statement state;
        try {
            state = conn.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrderProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public Vector<OrderProduct> searchOrderProduct(String number) {
        Vector<OrderProduct> vector = new Vector<OrderProduct>();
        String sql = "SELECT * FROM order_product WHERE quantity =" + number;
        ResultSet rs = this.getData(sql);

        try {
            while (rs.next()) { //rs.previous()
                int order_id = rs.getInt(1);
                int product_id = rs.getInt(2);
                int quantity = rs.getInt(3);

                OrderProduct op = new OrderProduct(order_id, product_id, quantity);

                vector.add(op);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrderProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }
}
