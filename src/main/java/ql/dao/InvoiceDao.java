/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ql.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import ql.dto.ProductInvoiceRequest;
import ql.model.Customer;
import ql.model.Invoice;
import ql.model.Staff;
import ql.model.StoreManager;
import ql.model.User;


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

    public List<Invoice> search(String cusName, String invoiceId) {
        List<Invoice> invoices = new ArrayList<>();
        Connection connection = null;
        PreparedStatement ps = null;
        try {
            connection = getConnection();
            StringBuilder sql = new StringBuilder("SELECT a.id as invoiceId, b.name as userName, c.id as cusId, c.name as cusName, "
                    + "a.sale_date, string_agg(e.name, ',') as productList, a.discount_price, a.discount, a.total_price FROM invoice a ");
            sql.append("INNER JOIN users b ON a.user_id = b.id ");
            sql.append("INNER JOIN customer c ON a.customer_id = c.id ");
            sql.append("INNER JOIN detail_invoice d ON a.id = d.invoice_id ");
            sql.append("INNER JOIN product e ON d.product_id = e.id ");
            sql.append("INNER JOIN user_role f ON b.id = f.user_id ");
            sql.append("INNER JOIN role g ON g.id = f.role_id ");
            sql.append("WHERE g.id IN (2, 3) ");
            if (cusName != null && cusName != "") {
                sql.append("AND c.name LIKE ? ");
            }
            if (invoiceId != null && invoiceId != "") {
                sql.append("AND a.id LIKE ? ");
            }
            sql.append("GROUP BY a.id, b.name, c.id, c.name, a.sale_date, a.discount_price, a.discount, a.total_price ");
            sql.append("ORDER BY a.sale_date DESC");
            ps = connection.prepareCall(sql.toString());
            if (cusName != null && cusName != "") {
                ps.setString(1, '%' + cusName + '%');
            }
            if (invoiceId != null && invoiceId != "") {
                ps.setString(2, '%' + invoiceId + '%');
            }
            ResultSet rs = ps.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    String invId = rs.getString("invoiceId");
                    String userName = rs.getString("userName");
                    String cusId = rs.getString("cusId");
                    String customerName = rs.getString("cusName");
                    Timestamp saleDate = rs.getTimestamp("sale_date");
                    
                    String[] productArr = rs.getString("productList").split(",");
                    String productList = "";
                    int size = productArr.length;
                    for (int i = 0; i < size; i++) {
                        if (!productList.contains(productArr[i])) {
                            productList += productArr[i] + ",";
                        }
                    }
                    String products = productList.substring(0, productList.length() - 1);
                    
                    Double totalPrice = rs.getDouble("total_price");
                    Double discountPrice = rs.getDouble("discount_price");
                    int discount = rs.getInt("discount");
                    Customer customer = new Customer(cusId, customerName);
                    User user = new User();
                    user.setName(userName);
                    Invoice invoice = new Invoice(invId, user, customer, saleDate, products, totalPrice, discountPrice, discount);
                    invoices.add(invoice);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection(connection, ps, null);
        }
        return invoices;
    }

    public String getLastInvoiceId() {
        Connection connection = null;
        PreparedStatement ps = null;
        try {
            connection = getConnection();
            StringBuilder sql = new StringBuilder("SELECT TOP 1 id FROM invoice ORDER BY CAST(STUFF(id, 1, 7, '') AS int) DESC ");
            ps = connection.prepareStatement(sql.toString());
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getString("id");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection(connection, ps, null);
        }
        return null;
    }

    public boolean add(Invoice invoice, List<ProductInvoiceRequest> productInvoiceList) {
        Connection connection = null;
        PreparedStatement ps = null;
        try {
            connection = getConnection();
            connection.setAutoCommit(false);
            
            // Insert customer
            StringBuilder sql = new StringBuilder("INSERT INTO CUSTOMER(id, name, birthday, address) VALUES(?, ?, ?, ?)");
            ps = connection.prepareStatement(sql.toString());
            ps.setString(1, invoice.getCustomer().getId());
            ps.setString(2, invoice.getCustomer().getName());
            ps.setString(3, null);
            ps.setString(4, null);
            ps.executeUpdate();
            
            // Insert invoice
            sql = new StringBuilder("INSERT INTO INVOICE(id, customer_id, user_id, sale_date, discount, total_price, discount_price) VALUES(?, ?, ?, ?, ?, ?, ?)");
            ps = connection.prepareStatement(sql.toString());
            ps.setString(1, invoice.getId());
            ps.setString(2, invoice.getCustomer().getId());
            ps.setInt(3, invoice.getUser().getId());
            ps.setTimestamp(4, invoice.getSaleDate());
            ps.setInt(5, invoice.getDiscount());
            ps.setDouble(6, invoice.getTotalAmount());
            ps.setDouble(7, invoice.getDiscountAmount());
            ps.executeUpdate();
            
            for (ProductInvoiceRequest productInvoiceRequest : productInvoiceList) {
                String productId = productInvoiceRequest.getProductId();
                int quantity = productInvoiceRequest.getQuantity();
                double totalPriceDetail = productInvoiceRequest.getTotalPrice();
                sql = new StringBuilder("INSERT INTO DETAIL_INVOICE(product_id, invoice_id, quantity, price) VALUES(?, ?, ?, ?)");
                ps = connection.prepareStatement(sql.toString());
                ps.setString(1, productId);
                ps.setString(2, invoice.getId());
                ps.setInt(3, quantity);
                ps.setDouble(4, totalPriceDetail);
                ps.executeUpdate();
                
                // Update stock
                sql = new StringBuilder("SELECT * FROM detail_stock WHERE store_id = ? AND product_id = ?");
                ps = connection.prepareStatement(sql.toString());
                ps.setString(1, invoice.getUser().getStore().getId());
                ps.setString(2, productId);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    int currentQuantity = rs.getInt("quantity");
                    int currentSellQuantity = rs.getInt("sell_quantity");
                    sql = new StringBuilder("UPDATE detail_stock SET quantity = ?, sell_quantity = ? WHERE store_id = ? AND product_id = ?");
                    ps = connection.prepareStatement(sql.toString());
                    ps.setInt(1, currentQuantity - quantity);
                    ps.setInt(2, currentSellQuantity + quantity);
                    ps.setString(3, invoice.getUser().getStore().getId());
                    ps.setString(4, productId);
                    ps.executeUpdate();
                }
            }
            connection.commit();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            try {
                connection.rollback();
            } catch (SQLException ex) {
                Logger.getLogger(InvoiceDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        } finally {
            closeConnection(connection, ps, null);
        }
        return false;
    }

    public boolean remove(String removeInvoiceId, String description) {
        Connection connection = null;
        PreparedStatement ps = null;
        try {
            connection = getConnection();
            connection.setAutoCommit(false);
            
            StringBuilder sql = new StringBuilder("INSERT INTO reason_invoice VALUES(?, ?, ?)");
            ps = connection.prepareStatement(sql.toString());
            ps.setString(1, removeInvoiceId);
            ps.setString(2, description);
            ps.setTimestamp(3, new Timestamp(System.currentTimeMillis()));
            ps.executeUpdate();
            
            sql = new StringBuilder("DELETE FROM detail_invoice WHERE invoice_id = ?");
            ps = connection.prepareStatement(sql.toString());
            ps.setString(1, removeInvoiceId);
            ps.executeUpdate();
            
            
            sql = new StringBuilder("DELETE FROM invoice WHERE id = ?");
            ps = connection.prepareStatement(sql.toString());
            ps.setString(1, removeInvoiceId);
            ps.executeUpdate();
            
            connection.commit();
            return true;
        } catch (Exception e) {
            try {
                connection.rollback();
            } catch (SQLException ex) {
                Logger.getLogger(InvoiceDao.class.getName()).log(Level.SEVERE, null, ex);
            }
            e.printStackTrace();
        } finally {
            closeConnection(connection, ps, null);
        }
        return false;
    }

    public List<Invoice> findAllBySaleDate(int userId, String startWorkingTime, String endWorkingTime) {
        List<Invoice> invoiceList = new ArrayList<>();
        
        Connection connection = null;
        PreparedStatement ps = null;
        try {
            connection = getConnection();
            StringBuilder sql = new StringBuilder("SELECT * FROM invoice ");
            sql.append("WHERE user_id = ? ");
            sql.append("AND sale_date BETWEEN ? AND ?");
            ps = connection.prepareCall(sql.toString());
            ps.setInt(1, userId);
            ps.setString(2, startWorkingTime);
            ps.setString(3, endWorkingTime);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String invoiceId = rs.getString("id");
                Timestamp saleDate = rs.getTimestamp("sale_date");
                double discountAmount = rs.getDouble("discount_price");
                invoiceList.add(new Invoice(invoiceId, saleDate, discountAmount));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection(connection, ps, null);
        }
        return invoiceList;
    }
}
