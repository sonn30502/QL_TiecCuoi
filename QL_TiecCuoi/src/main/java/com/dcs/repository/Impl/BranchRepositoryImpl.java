/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dcs.repository.Impl;

import com.dcs.pojos.Branch;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.dcs.repository.BranchRepository;
import java.util.Map;

/**
 *
 * @author ASUS
 */
@Repository
@Transactional
@PropertySource("classpath:configs.properties")
public class BranchRepositoryImpl implements BranchRepository {

    @Autowired
    private LocalSessionFactoryBean factory;

    @Override
    public List<Branch> getAllBranch() {
        Session s = this.factory.getObject().getCurrentSession();
        Query q = s.createQuery("FROM Branch");
        return q.getResultList();
    }

    @Override
    public Branch getBranchById(int branchID) {
        Session s = this.factory.getObject().getCurrentSession();
        return s.get(Branch.class, branchID);
    }

    @Override
    public boolean addOrUpdateBranch(Branch branch) {
        Session s = this.factory.getObject().getCurrentSession();
        try {
            if (branch.getBranchID() == null) {
                s.save(branch);
            } else {
                s.update(branch);
            }

            return true;
        } catch (HibernateException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean deleteBranch(int id) {
        Session session = this.factory.getObject().getCurrentSession();
        Query q = session.createQuery("DELETE FROM Branch WHERE branchID = :id");
        q.setParameter("id", id);
        int result = q.executeUpdate();
        return result > 0;
    }

    @Override
    public Long countBranch() {
        Session s = this.factory.getObject().getCurrentSession();
        Query q = s.createQuery("SELECT Count(*) FROM Branch");

        return Long.parseLong(q.getSingleResult().toString());
    }

}
