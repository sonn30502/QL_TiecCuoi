/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dcs.controllers;

import com.dcs.pojos.Branch;
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
import com.dcs.service.DVService;
import com.dcs.service.EventService;
import com.dcs.service.HallsService;
import java.util.List;
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
    private DVService dvService;
    
    @Autowired EventService eventService;

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

    @GetMapping("/list_branch")
    public String list_branch(Model model) {
        List<Branch> branches = this.branchService.getAllBranch();
        model.addAttribute("branch", branches);

        int pageSize = Integer.parseInt(this.env.getProperty("PAGE_SIZE"));
        long count = this.branchService.countBranch();
        model.addAttribute("counter", Math.ceil(count * 1.0 / pageSize));
        return "list_branch";
    }

    @GetMapping("/list_service")
    public String list_service(Model model, @RequestParam Map<String, String> params) {
        model.addAttribute("service", this.dvService.getAllService(params));

        int pageSize = Integer.parseInt(this.env.getProperty("PAGE_SIZE"));
        long count = this.dvService.countService();
        model.addAttribute("counter", Math.ceil(count * 1.0 / pageSize));
        return "list_service";
    }

    @GetMapping("/list_event")
    public String list_event(Model model, @RequestParam Map<String, String> params) {
        model.addAttribute("event", this.eventService.getEvent(params));

        int pageSize = Integer.parseInt(this.env.getProperty("PAGE_SIZE"));
        long count = this.eventService.countEvent();
        model.addAttribute("counter", Math.ceil(count * 1.0 / pageSize));
        return "list_event";
    }
}
