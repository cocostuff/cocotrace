package com.coco.cocotrace.service;

import com.coco.cocotrace.models.User;

public interface UserService {
    void save(User user);
    User findByUsername(String username);
}
