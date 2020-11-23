package com.codeup.adlister.controllers;
import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Listing;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


@WebServlet(name="controllers.DogsServlet", urlPatterns = "/dogs")
public class DogsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Foster/Adoption Selector
//        if (request.getParameter("choiceFA") == null) {

        // Breed Selector Query parameter
//        if (request.getParameter("choiceB") == null) {

        // Gender Selector Query parameter
        if (request.getParameter("choiceG") == null) {
//            request.setAttribute("listings", listings);
            request.getSession().setAttribute("listings", DaoFactory.getListingsDao().allDogs());
            request.setAttribute("viewListingType", "dogs");
            request.getRequestDispatcher("/WEB-INF/ads/pet-listings.jsp").forward(request, response);
        } else {
            // Foster/Adoption conditional
//            if (request.getParameter("choiceFA").equals("foster")) {
//                List<Listing> listing;
//                listing = (List<Listing>) request.getSession().getAttribute("listings");
//                listing.removeIf(item -> item.getRoleId() != 2);
//                request.getSession().setAttribute("listings", listing);
//            } else if (request.getParameter("choiceFA").equals("adoption")){
//                List<Listing> listing = (List<Listing>) request.getSession().getAttribute("listings");
//                listing.removeIf(item -> item.getRoleId() != 1);
//                request.getSession().setAttribute("listings", listing);
//            }

            // Breed conditional

            // Gender conditional
            if (request.getParameter("choiceG").equals("M")) {
                List<Listing> listing;
                listing = (List<Listing>) request.getSession().getAttribute("listings");
                listing.removeIf(item -> item.getGender().toString().equals("F"));
                request.getSession().setAttribute("listings", listing);
            } else if (request.getParameter("choiceG").equals("F")){
                List<Listing> listing = (List<Listing>) request.getSession().getAttribute("listings");
                listing.removeIf(item -> item.getGender().toString().equals("M"));
                request.getSession().setAttribute("listings", listing);
            }

            request.setAttribute("viewListingType", "dogs");
            request.getRequestDispatcher("/WEB-INF/ads/pet-listings.jsp").forward(request, response);
        }
    }
}
