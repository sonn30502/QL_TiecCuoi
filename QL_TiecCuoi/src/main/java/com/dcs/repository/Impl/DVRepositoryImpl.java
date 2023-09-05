/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dcs.repository.Impl;

import com.dcs.pojos.Service;
import com.dcs.repository.DVRepository;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Expression;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author ASUS
 */
@Repository
@Transactional
@PropertySource("classpath:configs.properties")
public class DVRepositoryImpl implements DVRepository {

    @Autowired
    private LocalSessionFactoryBean factory;

    @Autowired
    private Environment env;

    @Override
    public List<Service> getAllService(Map<String, String> params) {
        Session session = this.factory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Service> criteriaQuery = builder.createQuery(Service.class);
        Root<Service> root = criteriaQuery.from(Service.class);
        criteriaQuery.select(root);

        // Áp dụng các tham số để tạo các điều kiện tìm kiếm (nếu có)
        List<Predicate> predicates = new ArrayList<>();

        if (params != null && !params.isEmpty()) {
            // Xử lý các tham số tìm kiếm
            if (params.containsKey("kw")) {
                String name = params.get("kw");
                Expression<String> serviceNameExpression = root.get("serviceName");
                predicates.add(builder.like(builder.lower(serviceNameExpression), "%" + name.toLowerCase() + "%"));
            }
        }

        // Áp dụng điều kiện tìm kiếm (nếu có)
        if (!predicates.isEmpty()) {
            criteriaQuery.where(predicates.toArray(new Predicate[0]));
        }

        TypedQuery<Service> query = session.createQuery(criteriaQuery);

        // Áp dụng phân trang (nếu có)
        if (params != null) {
            String page = params.get("page");
            if (page != null && !page.isEmpty()) {
                int pageNumber = Integer.parseInt(page);
                int pageSize = Integer.parseInt(this.env.getProperty("PAGE_SIZE"));

                query.setMaxResults(pageSize);
                query.setFirstResult((pageNumber - 1) * pageSize);
            }
        }

        return query.getResultList();
    }

    @Override
    public Service getServiceById(int serviceID) {
        Session s = this.factory.getObject().getCurrentSession();
        return s.get(Service.class, serviceID);
    }

    @Override
    public boolean addOrUpdateService(Service s) {
        Session session = this.factory.getObject().getCurrentSession();
        try {
            if (s.getServiceID() == null) {
                // Kiểm tra xem dịch vụ đã tồn tại hay chưa
                if (isServiceNameExists(s.getServiceName())) {
                    // Tên dịch vụ đã tồn tại, không thể thêm mới
                    return false;
                }
                session.save(s);
            } else {
                Service existingService = session.get(Service.class, s.getServiceID());
                if (existingService == null) {
                    // Dịch vụ không tồn tại, không thể cập nhật
                    return false;
                }
                // Kiểm tra xem tên dịch vụ đã tồn tại cho dịch vụ khác hay chưa
                if (isServiceNameExistsForOtherService(s.getServiceName(), s.getServiceID())) {
                    // Tên dịch vụ đã tồn tại cho dịch vụ khác, không thể cập nhật
                    return false;
                }
                existingService.setServiceName(s.getServiceName());
                existingService.setDescription(s.getDescription());
                session.update(existingService);
            }
            return true;
        } catch (HibernateException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    @Override
    public Long countService() {
        Session s = this.factory.getObject().getCurrentSession();
        Query q = s.createQuery("SELECT Count(*) FROM Service");

        // lấy kq đếm được và chuyển đổi thành kiểu long
        return Long.parseLong(q.getSingleResult().toString());
    }

    @Override
    public boolean deleteService(int id) {
        Session session = this.factory.getObject().getCurrentSession();
        Service s = session.get(Service.class, id);
        if (s != null) {
            session.delete(s);
            return true;
        }
        return false;
    }

    // Kiểm tra xem tên dịch vụ đã tồn tại hay chưa (cho thao tác thêm mới dịch vụ)
    @Override
    public boolean isServiceNameExists(String serviceName) {
        Session session = this.factory.getObject().getCurrentSession();
        Query<Service> query = session.createQuery("SELECT s FROM Service s WHERE s.serviceName = :serviceName", Service.class);
        query.setParameter("serviceName", serviceName);
        return query.uniqueResult() != null;
    }

    // Kiểm tra xem tên dịch vụ đã tồn tại cho dịch vụ khác hay chưa (cho thao tác cập nhật dịch vụ)
    @Override
    public boolean isServiceNameExistsForOtherService(String serviceName, Integer id) {
        Session session = this.factory.getObject().getCurrentSession();
        Query<Service> query = session.createQuery("SELECT s FROM Service s WHERE s.serviceName = :serviceName AND s.serviceID != :id", Service.class);
        query.setParameter("serviceName", serviceName);
        query.setParameter("serviceID", id);
        return query.uniqueResult() != null;
    }

}
