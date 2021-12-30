/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ql.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class InvoiceDao extends BaseDao {
    public double getTotalAmount(int userId, String startTime, String endTime) {
        double totalAmount = 0;
        Connection connection = null;
        PreparedStatement ps = null;
        try {
            connection = getConnection();
            StringBuilder sql = new StringBuilder("SELECT SUM(total_price) as totalAmount FROM invoice ");
            sql.append("WHERE user_id = ? ");
            sql.append("AND sale_date BETWEEN ? AND ?");
            ps = connection.prepareCall(sql.toString());
            ps.setInt(1, userId);
            ps.setString(2, startTime);
            ps.setString(3, endTime);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                totalAmount = rs.getDouble("totalAmount");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection(connection, ps, null);
        }
        return totalAmount;
    }
}
