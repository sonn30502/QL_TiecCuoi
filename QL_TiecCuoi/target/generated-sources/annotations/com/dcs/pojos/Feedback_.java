package com.dcs.pojos;

import com.dcs.pojos.Event;
import com.dcs.pojos.User;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.12.v20230209-rNA", date="2023-09-08T00:57:54")
@StaticMetamodel(Feedback.class)
public class Feedback_ { 

    public static volatile SingularAttribute<Feedback, Event> eventID;
    public static volatile SingularAttribute<Feedback, String> feedbackContent;
    public static volatile SingularAttribute<Feedback, Date> feedbackDate;
    public static volatile SingularAttribute<Feedback, Integer> rating;
    public static volatile SingularAttribute<Feedback, Integer> feedbackID;
    public static volatile SingularAttribute<Feedback, User> userID;

}