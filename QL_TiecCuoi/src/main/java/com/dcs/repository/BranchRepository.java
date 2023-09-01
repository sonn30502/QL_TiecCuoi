/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.dcs.repository;

import com.dcs.pojos.Branch;
import java.util.List;

/**
 *
 * @author ASUS
 */
public interface BranchRepository {

    List<Branch> getAllBranch();

    Branch getBranchById(int branchID);

    boolean addOrUpdateBranch(Branch branch);

}
