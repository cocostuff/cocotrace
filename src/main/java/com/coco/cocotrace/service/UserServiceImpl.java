package com.coco.cocotrace.service;

import com.coco.cocotrace.dao.UserDao;
import com.coco.cocotrace.models.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserDao userDao;

    @Autowired
    BCryptPasswordEncoder bCryptEncoder;

    @Override
    public void save(User user) {
        String hashedPassword = bCryptEncoder.encode(user.getPassword());
        user.setPassword(hashedPassword);
        user.setActive(true);
        userDao.save(user);
    }

    @Override
    public User findByUsername(String username) {
        return userDao.findByUsername(username);
    }
}
