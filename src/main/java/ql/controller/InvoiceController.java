/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ql.controller;

import ql.dao.InvoiceDao;


public class InvoiceController {
    private InvoiceDao invoiceDao;
    
    public InvoiceController() {
        invoiceDao = new InvoiceDao();
    }
    
    public boolean compareInputTotalAmount(int userId, String workTime, double totalAmount) {
        
        return true;
    }
}
