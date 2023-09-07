/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dcs.service.Impl;

import com.dcs.pojos.Feedback;
import com.dcs.pojos.User;
import com.dcs.repository.FeedbackRepository;
import com.dcs.repository.UserRepository;
import com.dcs.service.FeedbackService;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

/**
 *
 * @author ASUS
 */
@Service
public class FeedbackServiceImpl implements FeedbackService {

    @Autowired
    private FeedbackRepository feedbackRepository;
    
    @Autowired 
    private UserRepository userRepository;

    @Override
    public Feedback addFeedback(Feedback feedback) {
        feedback.setFeedbackDate(new Date());
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        User u = this.userRepository.getUserByUsername(authentication.getName());
        feedback.setUserID(u);
        return this.feedbackRepository.addFeedback(feedback);
    }

    @Override
    public List<Feedback> getAllFeedbacks(int eventID) {
        return this.feedbackRepository.getAllFeedbacks(eventID);
    }

}
