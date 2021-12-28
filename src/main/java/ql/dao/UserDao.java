/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ql.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import ql.model.CenterManager;
import ql.model.Staff;
import ql.model.StoreManager;
import ql.model.User;

/**
 *
 * @author ADMIN
 */
public class UserDao extends BaseDao {

    public User getUserByUsername(String username) {
        Connection connection = null;
        PreparedStatement ps = null;
        User user = null;
        try {
            connection = getConnection();
            StringBuilder sql = new StringBuilder("SELECT a.*, c.*, d.*, e.*, f.* FROM users a ");
            sql.append("INNER JOIN user_role b ON a.id = b.user_id ");
            sql.append("INNER JOIN role c ON b.role_id = c.id ");
            sql.append("LEFT JOIN center_manager d ON a.id = d.user_id ");
            sql.append("LEFT JOIN store_manager e ON a.id = e.user_id ");
            sql.append("LEFT JOIN staff f ON a.id = f.user_id ");
            sql.append("WHERE a.username = ? ");
            ps = connection.prepareStatement(sql.toString(), ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            if (rs != null) {
                List<String> roleList = new ArrayList<>();
                while(rs.next()) {
                    String role = rs.getString("role");
                    roleList.add(role);
                    if (rs.isLast()) {
                        int id = rs.getInt("id");
                        String name = rs.getString("name");
                        Date birthday = rs.getDate("birthday");
                        String address = rs.getString("address");
                        String loginName = rs.getString("username");
                        String password = rs.getString("password");
                        if (roleList.contains("QUANLY_TRUNGTAM")) {
                            user = new CenterManager(id, name, birthday, address, loginName, password);
                        } else if (roleList.contains("QUANLY_CUAHANG") && roleList.contains("NHAN_VIEN")) {
                            user = new StoreManager(id, name, birthday, address, loginName, password);
                        } else if (roleList.contains("NHAN_VIEN")) {
                            String staffNo = rs.getString("staff_no");
                            int rank = rs.getInt("rank");
                            user = new Staff(staffNo, rank, id, name, birthday, address, loginName, password);
                        }
                        user.setRoleList(roleList);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection(connection, ps, null);
        }
        return user;
    }
    
}
