/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dcs.controllers;

import com.dcs.pojos.User;
import com.dcs.service.MenuService;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.dcs.service.BranchService;

/**
 *
 * @author ASUS
 */
@Controller
@ControllerAdvice
@PropertySource("classpath:configs.properties")
public class IndexController {

    @Autowired
    private MenuService menuService;

    @Autowired
    private BranchService branchService;

    @Autowired
    private Environment env;

    public void commonAttr(Model model) {
        model.addAttribute("branch", this.branchService.getAllBranch());
    }

    @RequestMapping("/")
    public String index(Model model, @RequestParam Map<String, String> params) {
        model.addAttribute("menu", this.menuService.getMenu(params));

        int pageSize = Integer.parseInt(this.env.getProperty("PAGE_SIZE"));
        long count = this.menuService.countMenu();
        model.addAttribute("counter", Math.ceil(count * 1.0 / pageSize));
        return "index";
    }
}
