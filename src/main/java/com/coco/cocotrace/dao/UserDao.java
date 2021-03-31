package com.coco.cocotrace.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import com.coco.cocotrace.models.User;


@RepositoryRestResource(collectionResourceRel = "users", path = "users")
public interface UserDao extends JpaRepository<User, Integer> {
	User findByUsername(String username);
}
