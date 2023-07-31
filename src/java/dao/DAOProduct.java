/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entity.Product;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.DBConnect;

/**
 *
 * @author Lenovo
 */
public class DAOProduct extends DBConnect {

    public int addProduct(Product product) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[products]\n"
                + "           ([product_id]\n"
                + "           ,[product_name]\n"
                + "           ,[description]\n"
                + "           ,[image]\n"
                + "           ,[list_price]\n"
                + "           ,[discount]\n"
                + "           ,[category_name])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?)";

        PreparedStatement pre;
        try {
            pre = conn.prepareStatement(sql);
            pre.setInt(1, product.getProduct_id());
            pre.setString(2, product.getProduct_name());
            pre.setString(3, product.getDescription());
            pre.setString(4, product.getImage());
            pre.setDouble(5, product.getList_price());
            pre.setDouble(6, product.getDiscount());
            pre.setString(7, product.getCategory_name());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int updateProduct(Product product) {
        int n = 0;

        String sql = "UPDATE [dbo].[products]\n"
                + "   SET [product_name] = ?\n"
                + "      ,[description] = ?\n"
                + "      ,[image] = ?\n"
                + "      ,[list_price] = ?\n"
                + "      ,[discount] = ?\n"
                + "      ,[category_name] = ?\n"
                + " WHERE [product_id] = ?";

        PreparedStatement pre;
        try {
            pre = conn.prepareStatement(sql);
            pre.setString(1, product.getProduct_name());
            pre.setString(2, product.getDescription());
            pre.setString(3, product.getImage());
            pre.setDouble(4, product.getList_price());
            pre.setDouble(5, product.getDiscount());
            pre.setString(6, product.getCategory_name());
            pre.setInt(7, product.getProduct_id());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public Vector<Product> getProduct() {
        Vector<Product> vector = new Vector<Product>();

        String sql = "select * from products";
        ResultSet rs = this.getData(sql);

        try {
            while (rs.next()) { //rs.previous()
                int product_id = rs.getInt(1);
                String product_name = rs.getString(2);
                String description = rs.getString(3);
                String image = rs.getString(4);
                double list_price = rs.getDouble(5);
                double discount = rs.getDouble(6);
                String category_name = rs.getString(7);

                Product product = new Product(product_id, product_name,
                        description, image, list_price, discount, category_name);

                vector.add(product);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }

    public Vector<Product> getProduct(String sql) {
        Vector<Product> vector = new Vector<Product>();
        ResultSet rs = this.getData(sql);
        try {
            while (rs.next()) { //rs.previous()
                int product_id = rs.getInt(1);
                String product_name = rs.getString(2);
                String description = rs.getString(3);
                String image = rs.getString(4);
                double list_price = rs.getDouble(5);
                double discount = rs.getDouble(6);
                String category_name = rs.getString(7);

                Product product = new Product(product_id, product_name,
                        description, image, list_price, discount, category_name);

                vector.add(product);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }

    public int removeProduct(int id) {
        int n = 0;
        String sql = "delete from products where product_id= " + id;
        Statement state;
        try {
            state = conn.createStatement();
            ResultSet rs1 = this.getData("select * from order_product where product_id= " + id);
            if (rs1.next()) {
                n = -1; //-1 vi pham toan ven khoa ngoai;
            } else {
                n = state.executeUpdate(sql);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public Vector<Product> searchProduct(String productname) {
        Vector<Product> products = new Vector<Product>();
        String sql = "SELECT * FROM products WHERE product_name LIKE N'%" + productname + "%' ";
        ResultSet rs = this.getData(sql);

        try {
            while (rs.next()) { //rs.previous()
                int product_id = rs.getInt(1);
                String product_name = rs.getString(2);
                String description = rs.getString(3);
                String image = rs.getString(4);
                double list_price = rs.getDouble(5);
                double discount = rs.getDouble(6);
                String category_name = rs.getString(7);

                Product product = new Product(product_id, product_name,
                        description, image, list_price, discount, category_name);

                products.add(product);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }

    public Vector<Product> searchProductId(String productname) {
        Vector<Product> products = new Vector<Product>();
        String sql = "SELECT * FROM products WHERE product_id =" + productname;
        ResultSet rs = this.getData(sql);

        try {
            while (rs.next()) { //rs.previous()
                int product_id = rs.getInt(1);
                String product_name = rs.getString(2);
                String description = rs.getString(3);
                String image = rs.getString(4);
                double list_price = rs.getDouble(5);
                double discount = rs.getDouble(6);
                String category_name = rs.getString(7);

                Product product = new Product(product_id, product_name,
                        description, image, list_price, discount, category_name);

                products.add(product);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }

    public Vector<Product> searchProductPrice(String min, String max) {
        Vector<Product> products = new Vector<Product>();
        String sql = "select * from products where (list_price*(1-discount)) between " + min + " and " + max + "";
        ResultSet rs = this.getData(sql);
        try {
            while (rs.next()) { //rs.previous()
                int product_id = rs.getInt(1);
                String product_name = rs.getString(2);
                String description = rs.getString(3);
                String image = rs.getString(4);
                double list_price = rs.getDouble(5);
                double discount = rs.getDouble(6);
                String category_name = rs.getString(7);

                Product product = new Product(product_id, product_name,
                        description, image, list_price, discount, category_name);

                products.add(product);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }

    public Vector<Product> searchProductPriceASC() {
        Vector<Product> products = new Vector<Product>();
        String sql = "select * from products order by list_price ASC";
        ResultSet rs = this.getData(sql);
        try {
            while (rs.next()) { //rs.previous()
                int product_id = rs.getInt(1);
                String product_name = rs.getString(2);
                String description = rs.getString(3);
                String image = rs.getString(4);
                double list_price = rs.getDouble(5);
                double discount = rs.getDouble(6);
                String category_name = rs.getString(7);

                Product product = new Product(product_id, product_name,
                        description, image, list_price, discount, category_name);

                products.add(product);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }
    
        public Vector<Product> searchProductPriceDESC() {
        Vector<Product> products = new Vector<Product>();
        String sql = "select * from products order by list_price DESC";
        ResultSet rs = this.getData(sql);
        try {
            while (rs.next()) { //rs.previous()
                int product_id = rs.getInt(1);
                String product_name = rs.getString(2);
                String description = rs.getString(3);
                String image = rs.getString(4);
                double list_price = rs.getDouble(5);
                double discount = rs.getDouble(6);
                String category_name = rs.getString(7);

                Product product = new Product(product_id, product_name,
                        description, image, list_price, discount, category_name);

                products.add(product);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }

    public static void main(String[] args) {
        DAOProduct dao = new dao.DAOProduct();
//         LocalDate currentDate = LocalDate.now();
//        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
//        String formattedDate = currentDate.format(formatter);
//        System.out.println("Today's date: " + formattedDate);
//        // update
//        int n;
//        n = dao.updateProduct(new Product(1, "Hoodie Boxy", "made by nike in 2018",
//                "image/Hoodieboxy.png", 100, 0.2, "Garment"));
//        if (n > 0) {
//            System.out.println("updated");
//        }
    }
}
