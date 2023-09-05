/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dcs.service.Impl;

import com.dcs.repository.DVRepository;
import com.dcs.service.DVService;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author ASUS
 */
@Service
public class DVServiceImpl implements DVService {

    @Autowired
    private DVRepository dvRepository;

    @Override
    public List<com.dcs.pojos.Service> getAllService(Map<String, String> params) {
        return this.dvRepository.getAllService(params);
    }

    @Override
    public com.dcs.pojos.Service getServiceById(int serviceID) {
        return this.dvRepository.getServiceById(serviceID);
    }

    @Override
    public boolean addOrUpdateService(com.dcs.pojos.Service serivce) {
        return this.dvRepository.addOrUpdateService(serivce);
    }

    @Override
    public Long countService() {
        return this.dvRepository.countService();
    }

    @Override
    public boolean deleteService(int id) {
        return this.dvRepository.deleteService(id);
    }

}
