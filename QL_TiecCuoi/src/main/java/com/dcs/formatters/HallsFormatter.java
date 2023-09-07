/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dcs.formatters;

import com.dcs.pojos.Halls;
import java.text.ParseException;
import java.util.Locale;
import org.springframework.format.Formatter;

/**
 *
 * @author ASUS
 */
public class HallsFormatter implements Formatter<Halls> {

    @Override
    public String print(Halls halls, Locale locale) {
        return String.valueOf(halls.getHallID());
    }

    @Override
    public Halls parse(String hallID, Locale locale) throws ParseException {
        int id = Integer.parseInt(hallID);
        return new Halls(id);
    }
}
