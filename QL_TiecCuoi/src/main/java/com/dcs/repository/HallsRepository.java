/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.dcs.repository;

import com.dcs.pojos.Halls;
import java.util.List;
import java.util.Map;

/**
 *
 * @author ASUS
 */
public interface HallsRepository {

    List<Halls> getHall(Map<String, String> params);

    List<Halls> getAllHall();

    Halls getHallById(int hallID);

    boolean addOrUpdateHall(Halls halls);

    Long countHall();

    boolean deleteHall(int id);
}
