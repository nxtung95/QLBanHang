/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ql.model;

import java.util.Date;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class User {
    private int id;
    private String name;
    private Date birthday;
    private String address;
    private String username;
    private String password;

    public User(int id, String name, Date birthday, String address, String username, String password) {
        this.id = id;
        this.name = name;
        this.birthday = birthday;
        this.address = address;
        this.username = username;
        this.password = password;
    }
    
    private List<String> roleList;
}
