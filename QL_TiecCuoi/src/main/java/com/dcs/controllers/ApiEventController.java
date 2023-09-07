/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dcs.controllers;

import com.dcs.pojos.Event;
import com.dcs.pojos.Feedback;
import com.dcs.service.EventService;
import com.dcs.service.FeedbackService;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author ASUS
 */
@RestController
@RequestMapping("/api")
public class ApiEventController {

    @Autowired
    private EventService eventService;

    @Autowired
    private FeedbackService feedbackService;

    @RequestMapping("/event/")
    @CrossOrigin
    public ResponseEntity<List<Event>> list(@RequestParam Map<String, String> params) {
        return new ResponseEntity<>(this.eventService.getEvent(params), HttpStatus.OK);
    }

    @RequestMapping(path = "/event/{eventID}/", produces = MediaType.APPLICATION_JSON_VALUE)
    @CrossOrigin
    public ResponseEntity<Event> details(@PathVariable(value = "eventID") int id) {
        return new ResponseEntity<>(this.eventService.getEventById(id), HttpStatus.OK);
    }

    @GetMapping("/event/{eventID}/feedback/")
    @CrossOrigin
    public ResponseEntity<List<Feedback>> listFeedback(@PathVariable(value = "eventID") int id) {
        return new ResponseEntity<>(this.feedbackService.getAllFeedbacks(id), HttpStatus.OK);
    }

    
//    đang lỗi csdl tự thêm
//    @PostMapping(path = "/feedback/", produces = MediaType.APPLICATION_JSON_VALUE)
//    @CrossOrigin
//    public ResponseEntity<Feedback> addFeedback(@RequestBody Feedback feedback) {
//        Feedback f = this.feedbackService.addFeedback(feedback);
//
//        return new ResponseEntity<>(f, HttpStatus.CREATED);
//    }

}
