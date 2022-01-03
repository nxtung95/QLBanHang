/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ql.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class Customer {

    public static final String prefixId = "CUSTOMER";
    
    private String id;
    private String name;

    public Customer(String cusId, String cusName) {
        this.id = cusId;
        this.name = cusName;
    }
}
