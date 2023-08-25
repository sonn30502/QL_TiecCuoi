/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dcs.controllers;

import com.dcs.pojos.Menu;
import com.dcs.service.MenuService;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

/**
 *
 * @author ASUS
 */
@Controller
public class MenuController {

    @Autowired
    private MenuService menuService;

    @GetMapping("admin/menu")
    public String list(Model model) {
        model.addAttribute("menu", new Menu());
        return "menu";
    }

    @GetMapping("admin/menu/{id}")
    public String update(Model model, @PathVariable(value = "id") int id) {
        model.addAttribute("menu", this.menuService.getMenuById(id));
        return "menu";
    }

    @PostMapping("admin/menu")
    public String add(@ModelAttribute(value = "menu") @Valid Menu menu,
            BindingResult rs) {
        if (!rs.hasErrors()) {
            if (menuService.addOrUpdateMenu(menu) == true) {
                return "redirect:/";
            }
        }

        return "menu";
    }
}
