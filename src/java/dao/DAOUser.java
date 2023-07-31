/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entity.User;
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
public class DAOUser extends DBConnect {

    public int addUser(User user) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[users]\n"
                + "           ([user_id]\n"
                + "           ,[first_name]\n"
                + "           ,[last_name]\n"
                + "           ,[phone]\n"
                + "           ,[address]\n"
                + "           ,[username]\n"
                + "           ,[password])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?)";

        PreparedStatement pre;
        try {
            pre = conn.prepareStatement(sql);
            pre.setInt(1, user.getUser_id());
            pre.setString(2, user.getFirst_name());
            pre.setString(3, user.getLast_name());
            pre.setString(4, user.getPhone());
            pre.setString(5, user.getAddress());
            pre.setString(6, user.getUsername());
            pre.setString(7, user.getPassword());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOUser.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int updateUser(User user) {
        int n = 0;

        String sql = "UPDATE [dbo].[users]\n"
                + "   SET [first_name] = ?\n"
                + "      ,[last_name] = ?\n"
                + "      ,[phone] = ?\n"
                + "      ,[address] = ?\n"
                + "      ,[username] = ?\n"
                + "      ,[password] = ?\n"
                + " WHERE [user_id] = ?";

        PreparedStatement pre;
        try {
            pre = conn.prepareStatement(sql);
            pre.setString(1, user.getFirst_name());
            pre.setString(2, user.getLast_name());
            pre.setString(3, user.getPhone());
            pre.setString(4, user.getAddress());
            pre.setString(5, user.getUsername());
            pre.setString(6, user.getPassword());
            pre.setInt(7, user.getUser_id());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOUser.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public Vector<User> getUser() {
        Vector<User> vector = new Vector<User>();

        String sql = "select * from users";
        ResultSet rs = this.getData(sql);

        try {
            while (rs.next()) { //rs.previous()
                int user_id = rs.getInt(1);
                String first_name = rs.getString(2);
                String last_name = rs.getString(3);
                String phone = rs.getString(4);
                String address = rs.getString(5);
                String username = rs.getString(6);
                String password = rs.getString(7);

                User user = new User(user_id, first_name, last_name,
                        phone, address, username, password);

                vector.add(user);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOUser.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }

    public Vector<User> getUser(String sql) {
        Vector<User> vector = new Vector<User>();

        ResultSet rs = this.getData(sql);

        try {
            while (rs.next()) { //rs.previous()
                int user_id = rs.getInt(1);
                String first_name = rs.getString(2);
                String last_name = rs.getString(3);
                String phone = rs.getString(4);
                String address = rs.getString(5);
                String username = rs.getString(6);
                String password = rs.getString(7);

                User user = new User(user_id, first_name, last_name,
                        phone, address, username, password);

                vector.add(user);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOUser.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }

    public int removeUser(int id) {
        int n = 0;
        String sql = "delete from users where user_id= " + id;
        Statement state;
        try {
            state = conn.createStatement();
            ResultSet rs1 = this.getData("select * from orders where user_id= " + id);

            if (rs1.next()) {
                n = -1; //-1 vi pham toan ven khoa ngoai;
            } else {
                n = state.executeUpdate(sql);
            }

        } catch (SQLException ex) {
            Logger.getLogger(DAOUser.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public User loginUser(String username, String password) {
        String sql = "select * from users where username =? and password =?";
        PreparedStatement pre;
        try {
            pre = conn.prepareStatement(sql);
            pre.setString(1, username);
            pre.setString(2, password);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                User user = new User();
                user.setUsername(username);
                return user;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOUser.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Vector<User> searchUser(String name) {
        Vector<User> vector = new Vector<User>();
        String sql = "SELECT * FROM users WHERE first_name+' '+last_name LIKE N'%" + name + "%' ";
        ResultSet rs = this.getData(sql);

        try {
            while (rs.next()) { //rs.previous()
                int user_id = rs.getInt(1);
                String first_name = rs.getString(2);
                String last_name = rs.getString(3);
                String phone = rs.getString(4);
                String address = rs.getString(5);
                String username = rs.getString(6);
                String password = rs.getString(7);

                User user = new User(user_id, first_name, last_name,
                        phone, address, username, password);

                vector.add(user);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOUser.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }
}
