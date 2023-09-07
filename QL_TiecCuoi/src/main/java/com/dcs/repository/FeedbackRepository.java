/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.dcs.repository;

import com.dcs.pojos.Feedback;
import java.util.List;

/**
 *
 * @author ASUS
 */
public interface FeedbackRepository {

    Feedback addFeedback(Feedback feedback);

    List<Feedback> getAllFeedbacks(int eventID);
}
