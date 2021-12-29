/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ql.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class InvoiceDao extends BaseDao {
    public double getTotalAmountByUserId(int userId) {
        double totalAmount = 0;
        Connection connection = null;
        PreparedStatement ps = null;
        try {
            connection = getConnection();
            StringBuilder sql = new StringBuilder("SELECT SUM(total_price) as totalAmount FROM invoice ");
            sql.append("INNER JOIN ");
            ps = connection.prepareCall(sql.toString());
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            if (rs != null) {
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
