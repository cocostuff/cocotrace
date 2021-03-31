package com.coco.cocotrace.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.coco.cocotrace.models.Role;

public interface RoleDao extends JpaRepository<Role, Integer> {

}
