/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dcs.controllers;

import com.dcs.service.MenuService;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.dcs.service.BranchService;
import com.dcs.service.HallsService;
import org.springframework.web.bind.annotation.GetMapping;

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
    private HallsService hallsService;

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

    @GetMapping("/list_halls")
    public String list_hall(Model model, @RequestParam Map<String, String> params) {
        model.addAttribute("halls", this.hallsService.getHall(params));

        int pageSize = Integer.parseInt(this.env.getProperty("PAGE_SIZE"));
        long count = this.hallsService.countHall();
        model.addAttribute("counter", Math.ceil(count * 1.0 / pageSize));
        return "list_halls";
    }
}
