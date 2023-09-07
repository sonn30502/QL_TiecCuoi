/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dcs.formatters;

import com.dcs.pojos.Menu;
import java.text.ParseException;
import java.util.Locale;
import org.springframework.format.Formatter;

/**
 *
 * @author ASUS
 */
public class MenuFormatter implements Formatter<Menu> {

    @Override
    public String print(Menu menu, Locale locale) {
        return String.valueOf(menu.getMenuID());
    }

    @Override
    public Menu parse(String menuID, Locale locale) throws ParseException {
        int id = Integer.parseInt(menuID);
        return new Menu(id);
    }
}
