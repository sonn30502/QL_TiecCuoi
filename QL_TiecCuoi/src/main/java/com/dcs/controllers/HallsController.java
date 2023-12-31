/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dcs.controllers;

import com.dcs.pojos.Halls;
import com.dcs.service.BranchService;
import com.dcs.service.HallsService;
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
public class HallsController {

    @Autowired
    private HallsService hallsService;
    @Autowired
    private BranchService branchService;

    @GetMapping("/halls")
    public String list(Model model) {
        model.addAttribute("halls", new Halls());
        model.addAttribute("branches", branchService.getAllBranch());
        return "halls";

    }

    @GetMapping("/halls/{id}")
    public String update(Model model, @PathVariable(value = "id") int id) {
        model.addAttribute("halls", this.hallsService.getHallById(id));
        model.addAttribute("branches", branchService.getAllBranch());
        return "halls";
    }

    @PostMapping("/halls")
    public String add(Model model, @ModelAttribute(value = "halls") @Valid Halls hall,
            BindingResult rs) {
        if (!rs.hasErrors()) {
            if (hallsService.addOrUpdateHall(hall)) {
                return "redirect:/list_halls";
            }
        }
        model.addAttribute("branches", branchService.getAllBranch());
        return "halls";
    }
    
    @GetMapping("/halls/delete/{id}")
    public String delete(@PathVariable(value = "id")int id){
        hallsService.deleteHall(id);
        return "redirect:/list_halls";
    }
    

}
