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


@WebServlet(name="controllers.CatsServlet", urlPatterns = "/cats")
public class CatsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getParameter("choiceFA") == null &&
                request.getParameter("choiceB") == null &&
                request.getParameter("choiceG") == null
        ) {
            List<Listing> listing = DaoFactory.getListingsDao().allCats();
            request.getSession().setAttribute("listings", listing);
            request.getSession().setAttribute("lsize", listing.size());
            request.setAttribute("viewListingType", "cats");
            request.getRequestDispatcher("/WEB-INF/ads/pet-listings.jsp").forward(request, response);

        } else if (request.getParameter("choiceB") != null) {
            String breed = request.getParameter("choiceB");
            List<Listing> listing;
            listing = (List<Listing>) request.getSession().getAttribute("listings");
            listing.removeIf(item -> !item.getBreed().equals(breed));
            request.getSession().setAttribute("listings", listing);
            request.getSession().setAttribute("lsize", listing.size());
            request.setAttribute("viewListingType", "cats");
            request.getRequestDispatcher("/WEB-INF/ads/pet-listings.jsp").forward(request, response);

        } else if (request.getParameter("choiceFA") != null) {
            if (request.getParameter("choiceFA").equals("foster")) {
                List<Listing> listing;
                listing = (List<Listing>) request.getSession().getAttribute("listings");
                listing.removeIf(item -> item.getRoleId() != 2);
                request.getSession().setAttribute("listings", listing);
                request.getSession().setAttribute("lsize", listing.size());
            } else if (request.getParameter("choiceFA").equals("adoption")){
                List<Listing> listing = (List<Listing>) request.getSession().getAttribute("listings");
                listing.removeIf(item -> item.getRoleId() != 1);
                request.getSession().setAttribute("listings", listing);
                request.getSession().setAttribute("lsize", listing.size());
            }
            request.setAttribute("viewListingType", "cats");
            request.getRequestDispatcher("/WEB-INF/ads/pet-listings.jsp").forward(request, response);

        } else if (request.getParameter("choiceG") != null) {
            if (request.getParameter("choiceG").equals("M")) {
                List<Listing> listing;
                listing = (List<Listing>) request.getSession().getAttribute("listings");
                listing.removeIf(item -> item.getGender().toString().equals("F"));
                request.getSession().setAttribute("listings", listing);
                request.getSession().setAttribute("lsize", listing.size());
            } else if (request.getParameter("choiceG").equals("F")){
                List<Listing> listing = (List<Listing>) request.getSession().getAttribute("listings");
                listing.removeIf(item -> item.getGender().toString().equals("M"));
                request.getSession().setAttribute("listings", listing);
                request.getSession().setAttribute("lsize", listing.size());
            }
            request.setAttribute("viewListingType", "cats");
            request.getRequestDispatcher("/WEB-INF/ads/pet-listings.jsp").forward(request, response);
        }
    }
}
