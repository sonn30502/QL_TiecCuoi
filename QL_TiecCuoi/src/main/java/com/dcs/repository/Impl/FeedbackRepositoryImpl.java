/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dcs.repository.Impl;

import com.dcs.pojos.Feedback;
import com.dcs.repository.FeedbackRepository;
import java.text.SimpleDateFormat;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author ASUS
 */
@Repository
@Transactional
public class FeedbackRepositoryImpl implements FeedbackRepository {

    @Autowired
    private LocalSessionFactoryBean factory;

    @Autowired
    private SimpleDateFormat simpleDateFormat;

    @Override
    public Feedback addFeedback(Feedback feedback) {
        Session s = this.factory.getObject().getCurrentSession();
        try {
            s.save(feedback);
            return feedback;
        } catch (HibernateException ex) {
            ex.printStackTrace();
            return null;
        }
//        try {
//            feedback.setFeedbackDate(simpleDateFormat.parse(simpleDateFormat.format(new Date())));
//            if (feedback.getFeedbackID() == null) {
//                s.save(feedback);
//            } else {
//                s.update(feedback);
//            }
//        } catch (ParseException ex) {
//            Logger.getLogger(FeedbackRepositoryImpl.class.getName()).log(Level.SEVERE, null, ex);
//        }
    }

    @Override
    public List<Feedback> getAllFeedbacks(int eventID) {
        Session session = this.factory.getObject().getCurrentSession();
        Query query = session.createQuery("FROM Feedback f WHERE f.eventID.eventID = :eventID");
        query.setParameter("eventID", eventID);

        return query.getResultList();
    }

}
