/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dcs.formatters;

import com.dcs.pojos.Service;
import java.text.ParseException;
import java.util.Locale;
import org.springframework.format.Formatter;

/**
 *
 * @author ASUS
 */
public class ServiceFormatter implements Formatter<Service> {

    @Override
    public String print(Service service, Locale locale) {
        return String.valueOf(service.getServiceID());
    }

    @Override
    public Service parse(String serviceID, Locale locale) throws ParseException {
        int id = Integer.parseInt(serviceID);
        return new Service(id);
    }

}
