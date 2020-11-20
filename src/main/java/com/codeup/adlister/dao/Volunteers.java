package com.codeup.adlister.dao;

import com.codeup.adlister.models.Volunteer;
import java.util.List;
public interface Volunteers {
    //get a list of all volunteer adds
    List<Volunteer> all();

    //gets the 4 most recently created volunteer listings
    List<Volunteer> fourMostRecentVolunteer();

    //insert a new volunteer ad
    Long insert(Volunteer volunteer);

    //search for one listing and return it
    Volunteer searchVolunteer(Long volunteerID);


    void update(Volunteer volunteer);

    void destroyVolunteer(long id);

}
