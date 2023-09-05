/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.dcs.repository;

import com.dcs.pojos.Service;
import java.util.List;
import java.util.Map;

/**
 *
 * @author ASUS
 */
public interface DVRepository {

    List<Service> getAllService(Map<String, String> params);

    Service getServiceById(int serviceID);

    boolean addOrUpdateService(Service serivce);

    Long countService();

    boolean deleteService(int id);

    // Kiểm tra xem tên dịch vụ đã tồn tại hay chưa (cho thao tác thêm mới dịch vụ)
    boolean isServiceNameExists(String serviceName);

    // Kiểm tra xem tên dịch vụ đã tồn tại cho dịch vụ khác hay chưa (cho thao tác cập nhật dịch vụ)
    boolean isServiceNameExistsForOtherService(String serviceName, Integer id);
}
