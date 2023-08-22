/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.dcs.repository;

import com.dcs.pojos.User;
import java.util.List;

/**
 *
 * @author ASUS
 */

public interface UserRepository {
    boolean addUser(User user);
    List<User> getUsers(String username);
}
