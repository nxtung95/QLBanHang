/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ql.controller;

import java.util.Calendar;
import java.util.Date;
import java.util.List;
import ql.common.Utils;
import ql.dao.InvoiceDao;
import ql.dao.WorkTimeDao;
import ql.model.WorkTime;


public class InvoiceController {
    private InvoiceDao invoiceDao;
    private WorkTimeDao workTimeDao;
    
    public InvoiceController() {
        invoiceDao = new InvoiceDao();
        workTimeDao = new WorkTimeDao();
    }
    
    public boolean compareInputTotalAmount(int userId, double totalAmount) {
        String lastStartWorkTime;
        String lastEndWorkTime;
        List<WorkTime> workTimeList = workTimeDao.getWorkTime();
        if (workTimeList.isEmpty()) {
            return false;
        }
        if (!workTimeList.isEmpty()) {
            int currentHour = Calendar.getInstance().get(Calendar.HOUR_OF_DAY);
            for (WorkTime workTime : workTimeList) {
                int startHour = Utils.getHourFromDate(workTime.getStartTime());
                int endHour = Utils.getHourFromDate(workTime.getEndTime());
                if (startHour >= endHour) {
                    endHour += 24;
                    currentHour += 24;
                }
                if (currentHour >= startHour && currentHour <= endHour) {
                    if (workTime.getType() == 1) {
                        WorkTime nightTime = workTimeList.get(2);
                        String yesterday = Utils.getYesterday();
                        String now = Utils.getNow();
                        lastStartWorkTime = yesterday + Utils.getHourFromDate(nightTime.getStartTime()) + ":" + "00" + ":" + "00";
                        lastEndWorkTime = now + Utils.getHourFromDate(nightTime.getEndTime()) + ":" + "00" + ":" + "00";
                    } else if (workTime.getType() == 2) {
                        WorkTime morningTime = workTimeList.get(0);
                        String now = Utils.getNow();
                        lastStartWorkTime = now + Utils.getHourFromDate(morningTime.getStartTime()) + ":" + "00" + ":" + "00";
                        lastEndWorkTime = now + Utils.getHourFromDate(morningTime.getEndTime()) + ":" + "00" + ":" + "00";
                    } else if (workTime.getType() == 3) {
                        WorkTime afternoonTime = workTimeList.get(1);
                        String yesterday = Utils.getYesterday();
                        lastStartWorkTime = yesterday + Utils.getHourFromDate(afternoonTime.getStartTime()) + ":" + "00" + ":" + "00";
                        lastEndWorkTime = yesterday + Utils.getHourFromDate(afternoonTime.getEndTime()) + ":" + "00" + ":" + "00";
                    }
                    break;
                }
            }
        }
        return true;
    }
}
