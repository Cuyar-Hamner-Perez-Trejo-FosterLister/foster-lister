package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Listing;
import com.codeup.adlister.models.User;
import com.codeup.adlister.models.Volunteer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

    @WebServlet(name = "controllers.UpdateListingServlet", urlPatterns = "/update-listing")
    public class UpdateListingServlet  extends HttpServlet {
        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            if(request.getParameter("listing").equals("volunteer")){
                Long id = Long.parseLong(request.getParameter("id"));
                Volunteer volunteer =DaoFactory.getVolunteersDao().searchVolunteer(id);
                request.getSession().setAttribute("listingEdit", volunteer);
                request.getSession().setAttribute("choiceEdit", "volunteer");
                request.getRequestDispatcher("/WEB-INF/ads/edit-listing.jsp").forward(request, response);
            } else {
                Long id = Long.parseLong(request.getParameter("listing"));
                Listing listing = DaoFactory.getListingsDao().searchListing(id);
                request.getSession().setAttribute("listingEdit", listing);
                if (listing.getRoleId() == 1) {
                    request.getSession().setAttribute("choiceEdit", "adoption");
                } else {
                    request.getSession().setAttribute("choiceEdit", "foster");
                }
                request.getRequestDispatcher("/WEB-INF/ads/edit-listing.jsp").forward(request, response);
            }
        }

        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
            String listingType = (String) request.getSession().getAttribute("choiceEdit");
            Listing editListing;


           if(listingType.equals("volunteer")) {
               Volunteer volunteer = (Volunteer) request.getSession().getAttribute("listingEdit");
               String date = request.getParameter("date");
               String title = request.getParameter("title");
               String descriptionVolunteer = request.getParameter("descriptionVolunteer");
               String contact = request.getParameter("contact");
               long id = volunteer.getId();
               long userId = volunteer.getUserId();
               Volunteer editVolunteer = new Volunteer(
                       id,
                       userId,
                       date,
                       title,
                       descriptionVolunteer,
                       contact,
                       ""
               );
               DaoFactory.getVolunteersDao().update(editVolunteer);
               response.sendRedirect("/ads");
           } else {
                    Listing listing = (Listing) request.getSession().getAttribute("listingEdit");
                    char gender = request.getParameter("gender").charAt(0);
                    String name = request.getParameter("name");
                    String type = request.getParameter("type");
                    String breed = request.getParameter("breed");
                    String dob = request.getParameter("dob");
                    String conditions = request.getParameter("conditions");
                    String description = request.getParameter("description");
                    String size = request.getParameter("size");

                    if(listingType.equals("foster")){
                        int litterSize = Integer.parseInt(request.getParameter("litter_size"));
                        String fosterDuration = request.getParameter("foster_duration");
                    editListing = new Listing(
                            listing.getId(),
                            listing.getUserId(),
                            listing.getImageUrl(),
                            name,
                            type,
                            breed,
                            dob,
                            gender,
                            conditions,
                           description,
                            size,
                            litterSize,
                            fosterDuration,
                            listing.getCreatedTime(),
                            listing.getRoleId()
                    );
                    } else {
                        editListing = new Listing(
                                listing.getId(),
                                listing.getUserId(),
                                listing.getImageUrl(),
                                name,
                                type,
                                breed,
                                dob,
                                gender,
                                conditions,
                                description,
                                size,
                                listing.getLitterSize(),
                                listing.getFosterDuration(),
                                listing.getCreatedTime(),
                                listing.getRoleId()
                        );
                    }
               DaoFactory.getListingsDao().update(editListing);
               response.sendRedirect("/ads");

           }


            }

        }


