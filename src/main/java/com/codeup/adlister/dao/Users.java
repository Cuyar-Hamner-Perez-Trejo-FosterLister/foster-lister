package com.codeup.adlister.dao;


import com.codeup.adlister.models.User;
import com.codeup.adlister.models.Volunteer;

import java.util.List;

public interface Users {
    User findByEmail(String email);
    List<User> all();
    Long insert(User user);
    void update(User user);
    void destroy(long id);

}
