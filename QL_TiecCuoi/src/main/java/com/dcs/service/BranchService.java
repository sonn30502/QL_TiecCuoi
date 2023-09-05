/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.dcs.service;

import com.dcs.pojos.Branch;
import java.util.List;

/**
 *
 * @author ASUS
 */
public interface BranchService {

    List<Branch> getAllBranch();

    Branch getBranchById(int branchID);

    boolean addOrUpdateBranch(Branch branch);
    
    boolean deleteBranch(int id);
    
    Long countBranch();

  
}
