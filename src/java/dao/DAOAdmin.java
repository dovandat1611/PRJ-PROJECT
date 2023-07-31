/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entity.Admin;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.DBConnect;

/**
 *
 * @author Lenovo
 */
public class DAOAdmin extends DBConnect {

    public int addAdmin(Admin admin) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[admin]\n"
                + "           ([admin_id]\n"
                + "           ,[first_name]\n"
                + "           ,[last_name]\n"
                + "           ,[phone]\n"
                + "           ,[username]\n"
                + "           ,[password])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?)";

        PreparedStatement pre;
        try {
            pre = conn.prepareStatement(sql);
            pre.setInt(1, admin.getAdmin_id());
            pre.setString(2, admin.getFirst_name());
            pre.setString(3, admin.getLast_name());
            pre.setString(4, admin.getPhone());
            pre.setString(5, admin.getUsername());
            pre.setString(6, admin.getPassword());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOAdmin.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int updateAdmin(Admin admin) {
        int n = 0;

        String sql = "UPDATE [dbo].[admin]\n"
                + "   SET [first_name] = ?\n"
                + "      ,[last_name] = ?\n"
                + "      ,[phone] = ?\n"
                + "      ,[username] = ?\n"
                + "      ,[password] = ?\n"
                + " WHERE [admin_id] = ?";

        PreparedStatement pre;
        try {
            pre = conn.prepareStatement(sql);
            pre.setString(1, admin.getFirst_name());
            pre.setString(2, admin.getLast_name());
            pre.setString(3, admin.getPhone());
            pre.setString(4, admin.getUsername());
            pre.setString(5, admin.getPassword());
            pre.setInt(6, admin.getAdmin_id());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOAdmin.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public Vector<Admin> getAdmin() {
        Vector<Admin> vector = new Vector<Admin>();

        String sql = "select * from admin";
        ResultSet rs = this.getData(sql);

        try {
            while (rs.next()) { //rs.previous()
                int admin_id = rs.getInt(1);
                String first_name = rs.getString(2);
                String last_name = rs.getString(3);
                String phone = rs.getString(4);
                String username = rs.getString(5);
                String password = rs.getString(6);

                Admin admin = new Admin(admin_id, first_name,
                        last_name, phone, username, password);

                vector.add(admin);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOAdmin.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }

    public Vector<Admin> getAdmin(String sql) {
        Vector<Admin> vector = new Vector<Admin>();

        ResultSet rs = this.getData(sql);

        try {
            while (rs.next()) { //rs.previous()
                int admin_id = rs.getInt(1);
                String first_name = rs.getString(2);
                String last_name = rs.getString(3);
                String phone = rs.getString(4);
                String username = rs.getString(5);
                String password = rs.getString(6);

                Admin admin = new Admin(admin_id, first_name,
                        last_name, phone, username, password);

                vector.add(admin);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOAdmin.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }

    public int removeAdmin(int id) {
        int n = 0;
        String sql = "delete from admin where admin_id= " + id;
        Statement state;
        try {
            state = conn.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOAdmin.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public Admin loginAdmin(String username, String password) {
        String sql = "select * from admin where username =? and password =?";
        PreparedStatement pre;
        try {
            pre = conn.prepareStatement(sql);
            pre.setString(1, username);
            pre.setString(2, password);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                Admin admin = new Admin();
                admin.setUsername(username);
                return admin;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOAdmin.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Vector<Admin> searchAdmin(String name) {
        Vector<Admin> vector = new Vector<Admin>();
        String sql = "SELECT * FROM admin WHERE first_name+' '+last_name LIKE N'%" + name + "%'";
        ResultSet rs = this.getData(sql);

        try {
            while (rs.next()) { //rs.previous()
                int admin_id = rs.getInt(1);
                String first_name = rs.getString(2);
                String last_name = rs.getString(3);
                String phone = rs.getString(4);
                String username = rs.getString(5);
                String password = rs.getString(6);

                Admin admin = new Admin(admin_id, first_name,
                        last_name, phone, username, password);

                vector.add(admin);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOAdmin.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }

    public static void main(String[] args) {
//        DAOAdmin dao = new dao.DAOAdmin();
//        ArrayList<Admin> ad = new ArrayList<Admin>();
//        Admin admin = new Admin(1, "2", "3", "4", "5", "6");
//        ad.add(admin);
//        System.out.println(ad.get(0).getFirst_name());
        // ADD
//        int n = dao.updateAdmin(new Admin(5, "1", "1", "1", "1", "2"));
//        if (n > 0) {
//            System.out.println("inserted");
//        }
    }
}
