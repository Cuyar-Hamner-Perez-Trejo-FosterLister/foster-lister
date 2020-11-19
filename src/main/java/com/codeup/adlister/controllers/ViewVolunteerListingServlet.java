package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Listing;
import com.codeup.adlister.models.Volunteer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.ViewVolunteerListingServlet", urlPatterns = "/volunteer-info")
public class ViewVolunteerListingServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("volunteer"));
        Volunteer volunteer = DaoFactory.getVolunteersDao().searchVolunteer(id);
            request.setAttribute("volunteer", volunteer);
            request.getRequestDispatcher("/WEB-INF/ads/volunteer-listing.jsp").forward(request, response);
    }
}