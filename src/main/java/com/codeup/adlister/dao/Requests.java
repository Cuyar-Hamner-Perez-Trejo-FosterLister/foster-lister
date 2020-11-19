package com.codeup.adlister.dao;

import com.codeup.adlister.models.Request;

import java.util.List;

public interface Requests {

    List<Request> all();

    List<Request> allVolunteers();

    List<Request> allFosters();

    List<Request> allAdoptions();

    Long insert(Request request);
}
