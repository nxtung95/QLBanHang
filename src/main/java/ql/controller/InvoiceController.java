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
    
    public double getTotalAmount(int userId) {
        double totalAmount = 0;
        String lastStartWorkTime = null;
        String lastEndWorkTime = null;
        List<WorkTime> workTimeList = workTimeDao.getWorkTime();
        if (!workTimeList.isEmpty()) {
            int currentHour = Calendar.getInstance().get(Calendar.HOUR_OF_DAY);
            for (WorkTime workTime : workTimeList) {
                int startHour = Utils.getHourFromTime(workTime.getStartTime());
                int endHour = Utils.getHourFromTime(workTime.getEndTime());
                if (startHour >= endHour) {
                    endHour += 24;
                    if (currentHour >= 0 && currentHour < startHour) {
                        currentHour += 24;
                    }
                }
                if (currentHour >= startHour && currentHour < endHour) {
                    if (workTime.getType() == 1) {
                        WorkTime nightTime = workTimeList.get(2);
                        String yesterday = Utils.getYesterday();
                        String now = Utils.getNow();
                        lastStartWorkTime = yesterday + " " + Utils.getHourFromTime(nightTime.getStartTime()) + ":" + "00" + ":" + "00";
                        lastEndWorkTime = now + " " + Utils.getHourFromTime(nightTime.getEndTime()) + ":" + "00" + ":" + "00";
                    } else if (workTime.getType() == 2) {
                        WorkTime morningTime = workTimeList.get(0);
                        String now = Utils.getNow();
                        lastStartWorkTime = now + " " + Utils.getHourFromTime(morningTime.getStartTime()) + ":" + "00" + ":" + "00";
                        lastEndWorkTime = now + " " + Utils.getHourFromTime(morningTime.getEndTime()) + ":" + "00" + ":" + "00";
                    } else if (workTime.getType() == 3) {
                        WorkTime afternoonTime = workTimeList.get(1);
                        if (currentHour < 24) {
                            String now = Utils.getNow();
                            lastStartWorkTime = now + " " + Utils.getHourFromTime(afternoonTime.getStartTime()) + ":" + "00" + ":" + "00";
                            lastEndWorkTime = now + " " + Utils.getHourFromTime(afternoonTime.getEndTime()) + ":" + "00" + ":" + "00";
                        } else {
                            String yesterday = Utils.getYesterday();
                            lastStartWorkTime = yesterday + " " + Utils.getHourFromTime(afternoonTime.getStartTime()) + ":" + "00" + ":" + "00";
                            lastEndWorkTime = yesterday + " " + Utils.getHourFromTime(afternoonTime.getEndTime()) + ":" + "00" + ":" + "00";
                        }
                    }
                    break;
                }
            }
            totalAmount = invoiceDao.getTotalAmount(userId, lastStartWorkTime, lastEndWorkTime);
        }
        return totalAmount;
    }
}
