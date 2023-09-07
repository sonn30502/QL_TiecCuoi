/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dcs.service.Impl;

import com.dcs.pojos.Event;
import com.dcs.repository.EventRepository;
import com.dcs.service.EventService;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author ASUS
 */
@Service
public class EventServiceImpl implements EventService {

    @Autowired
    private EventRepository eventRepository;

    @Override
    public boolean addOrUpdateEvent(Event event) {
        return this.eventRepository.addOrUpdateEvent(event);
    }

    @Override
    public Event getEventById(int eventID) {
        return this.eventRepository.getEventById(eventID);
    }

    @Override
    public boolean deleteEvent(int id) {
        return this.eventRepository.deleteEvent(id);
    }

    @Override
    public List<Event> getEvent(Map<String, String> params) {
        return this.eventRepository.getEvent(params);
    }

    @Override
    public List<Event> getAllEvent() {
        return this.eventRepository.getAllEvent();
    }

    @Override
    public Long countEvent() {
        return this.eventRepository.countEvent();
    }

}
