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
        List<Listing> listings = DaoFactory.getListingsDao().allDogs();
        if (request.getSession().getAttribute("listings-session") == null){
            request.getSession().setAttribute("listings-session", listings);
        }


        if (request.getParameter("choiceFA") == null){
            request.setAttribute("listings", listings);
            request.setAttribute("viewListingType", "dogs");
            request.getRequestDispatcher("/WEB-INF/ads/pet-listings.jsp").forward(request, response);
            return;
        } else {
            if (request.getParameter("choiceFA").equals("foster")){
                System.out.println("request.getParameter(\"choiceFA\") = " + request.getParameter("choiceFA"));
                List<Listing> resultList = listings;
                for (Listing listing: resultList){
                    System.out.println("listing.getRoleId() = " + listing.getRoleId());
                    System.out.println("listing.getName() = " + listing.getName());
                    if(listing.getRoleId() != 2){
                        resultList.remove(listing);
                    }
                for (Listing listing1: resultList){
                    System.out.println("listing.getRoleId() = " + listing1.getRoleId());
                    System.out.println("listing.getName() = " + listing1.getName());
                }
                }
                request.setAttribute("listings", resultList);
                request.setAttribute("viewListingType", "dogs");
                request.getRequestDispatcher("/WEB-INF/ads/pet-listings.jsp").forward(request, response);
            }
        }
    }
}
