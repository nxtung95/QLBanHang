/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ql.model;

import java.util.Date;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Staff extends User {
    private String staffNo;
    private int rank;

    public Staff(String staffNo, int rank, int id, String name, Date birthday, String address, String username, String password) {
        super(id, name, birthday, address, username, password);
        this.staffNo = staffNo;
        this.rank = rank;
    }

    public Staff() {

    }
    
    
}
