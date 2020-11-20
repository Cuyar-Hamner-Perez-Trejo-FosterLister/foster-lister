package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Listing;
import com.codeup.adlister.models.User;
import com.codeup.adlister.models.Volunteer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.CreateListingServlet", urlPatterns = "/listings/create")
public class CreateListingServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
            return;
        }
        if(request.getParameter("choice") == null) {
            request.getRequestDispatcher("/WEB-INF/ads/create.jsp")
                    .forward(request, response);

        } else if (request.getParameter("choice").equals("adoption")){
            request.getSession().setAttribute("choice", "adoption");
            request.getRequestDispatcher("/WEB-INF/ads/create.jsp")
                    .forward(request, response);
        } else if (request.getParameter("choice").equals("foster")){
            request.getSession().setAttribute("choice", "foster");
            request.getRequestDispatcher("/WEB-INF/ads/create.jsp")
                    .forward(request, response);
        } else if (request.getParameter("choice").equals("volunteer")){
        request.getSession().setAttribute("choice", "volunteer");
        request.getRequestDispatcher("/WEB-INF/ads/create.jsp")
                .forward(request, response);
    }

    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        User user = (User) request.getSession().getAttribute("user");
        String type = (String) request.getSession().getAttribute("choice");
        Listing insertListing;


        if (type.equals("volunteer")) {
            Volunteer volunteer = new Volunteer(
                    user.getId(),
                    request.getParameter("date"),
                    request.getParameter("title"),
                    request.getParameter("descriptionVolunteer"),
                    request.getParameter("contact")
            );
            DaoFactory.getVolunteersDao().insert(volunteer);
            response.sendRedirect("/ads");
        } else {
            char gender = request.getParameter("gender").charAt(0);
            String name = request.getParameter("name");
            String strType = request.getParameter("type");
            String breed = request.getParameter("breed");
            String dob = request.getParameter("dob");
            String condition = request.getParameter("conditions");
            String description = request.getParameter("description");
            String size = request.getParameter("size");
            if (type.equals("foster")) {
                int litterSize = Integer.parseInt(request.getParameter("litter_size"));
                String fosterDuration = request.getParameter("foster_duration");
                insertListing = new Listing(
                        user.getId(),
                        "",
                        name,
                        strType,
                        breed,
                        dob,
                        gender,
                        condition,
                        description,
                        size,
                        litterSize,
                        fosterDuration,
                        2
                );
            } else {
                insertListing = new Listing(
                        user.getId(),
                        "",
                        name,
                        strType,
                        breed,
                        dob,
                        gender,
                        condition,
                        description,
                        size,
                        0,
                        "N/A",
                        1
                );
            }
            DaoFactory.getListingsDao().insert(insertListing);
            response.sendRedirect("/ads");
        }

    }
}
