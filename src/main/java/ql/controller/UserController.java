/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ql.controller;

import ql.common.SecurityUtil;
import ql.dao.UserDao;
import ql.model.User;

/**
 *
 * @author ADMIN
 */
public class UserController {
    
    private UserDao userDao;

    public UserController() {
        userDao = new UserDao();
    }
    public User login(String username, String password) {
        User user = userDao.getUserByUsername(username);
        if (user != null) {
            System.out.println("Login: " + user.toString());
            String requestHash = SecurityUtil.getMD5(username + password);
            if (!requestHash.equals(user.getPassword())) {
                System.out.println("Login fail");
                return null;
            }
            System.out.println("Login success");
        }
        return user;
    }
    
}
