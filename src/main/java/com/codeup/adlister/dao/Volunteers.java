package com.codeup.adlister.dao;

import com.codeup.adlister.models.Volunteer;
import java.util.List;
public interface Volunteers {
    //get a list of all volunteer adds
    List<Volunteer> all();

    //insert a new volunteer ad
    Long insert(Volunteer volunteer);

    //search for one listing and return it
    Volunteer searchVolunteer(Long volunteerID);
}
