package com.codeup.adlister.dao;

import com.codeup.adlister.models.Listing;

import java.util.List;

public interface Listings {
    // get a list of all the ads
    List<Listing> all();
    // insert a new ad and return the new ad's id
    Long insert(Listing listing);
}
