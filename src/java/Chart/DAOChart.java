/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Chart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.DBConnect;

/**
 *
 * @author Lenovo
 */
public class DAOChart extends DBConnect {

    PreparedStatement ps = null;
    ResultSet rs = null;

    public ArrayList<ChartBuy> getChartBuy(String date) {
        ArrayList<ChartBuy> list = new ArrayList<>();
        String sql = "select count(o.order_id)as total from orders o "
                + " where  month(o.date) = ? and YEAR(o.date) = '2023' ";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, date);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new ChartBuy(rs.getInt(1)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public ArrayList<ChartTotalMoney> getChartTotalMoney(String date) {
        ArrayList<ChartTotalMoney> list = new ArrayList<>();
        String sql = "select sum(o.total_price)as totalmoney from orders o "
                + " where  month(o.date) = ? and o.status ='Done' and YEAR(o.date) = '2023'";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, date);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new ChartTotalMoney(rs.getInt(1)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public ArrayList<chartCategory> getchartCategory(String name) {
        ArrayList<chartCategory> list = new ArrayList<>();
        String sql = "select count(p.category_name)as total from bill b join products p "
                + "on b.product_id = p.product_id and p.category_name Like ? "
                + "group by p.category_name";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new chartCategory(rs.getInt(1)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public static void main(String[] args) {
        DAOChart dao = new DAOChart();
        ArrayList<chartCategory> Technology = dao.getchartCategory("Technology");
        if(Technology.isEmpty()){
            System.out.println(0);
        }else{
            System.out.println(Technology.get(0).getTotalcategory());
        }
        
    }
    
}
