/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.dcs.service;

import com.dcs.pojos.Event;
import java.util.List;
import java.util.Map;

/**
 *
 * @author ASUS
 */
public interface EventService {

    boolean addOrUpdateEvent(Event event);

    Event getEventById(int eventID);

    boolean deleteEvent(int id);

    List<Event> getEvent(Map<String, String> params);

    List<Event> getAllEvent();
    
    Long countEvent();
}
