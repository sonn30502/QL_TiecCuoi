    /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dcs.controllers;

import com.dcs.pojos.Event;
import com.dcs.service.BranchService;
import com.dcs.service.DVService;
import com.dcs.service.EventService;
import com.dcs.service.HallsService;
import com.dcs.service.MenuService;
import com.dcs.service.UserService;
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
public class EventController {

    @Autowired
    private EventService eventService;
    @Autowired
    private BranchService branchService;
    @Autowired
    private HallsService hallsService;
    @Autowired
    private MenuService menuService;
    @Autowired
    private DVService dvService;
    @Autowired
    private UserService userService;

    @GetMapping("/event")
    public String list(Model model) {
        model.addAttribute("event", new Event());
        model.addAttribute("branchList", branchService.getAllBranch());
        model.addAttribute("menuList", menuService.getAllMenu());
        model.addAttribute("hallList", hallsService.getAllHall());
        model.addAttribute("dvList", dvService.getService());
        return "event";
    }

    @GetMapping("/event/{id}")
    public String update(Model model, @PathVariable(value = "id") int id) {
        model.addAttribute("event", this.eventService.getEventById(id));
        model.addAttribute("branchList", branchService.getAllBranch());
        model.addAttribute("menuList", menuService.getAllMenu());
        model.addAttribute("hallList", hallsService.getAllHall());
        model.addAttribute("dvList", dvService.getService());
        return "event";
    }

    @PostMapping("/event")
    public String addEvent(Model model, @ModelAttribute(value = "event") @Valid Event event,
            BindingResult rs) {
        if (!rs.hasErrors()) {
            if (eventService.addOrUpdateEvent(event) == true) {
                return "redirect:/list_event";
            }
        }
        model.addAttribute("branchList", branchService.getAllBranch());
        model.addAttribute("menuList", menuService.getAllMenu());
        model.addAttribute("hallList", hallsService.getAllHall());
        model.addAttribute("dvList", dvService.getService());
        return "event";
    }

    @GetMapping("/event/delete/{id}")
    public String delete(@PathVariable(value = "id") int id) {
        eventService.deleteEvent(id);
        return "redirect:/list_event";
    }
}
