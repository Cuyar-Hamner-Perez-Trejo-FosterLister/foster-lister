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
            User user = (User) request.getSession().getAttribute("user");

            switch(listingType){
                case "volunteer":
                    Volunteer volunteer = (Volunteer) request.getSession().getAttribute("listingEdit");
                    String date = request.getParameter("date");
                    String title = request.getParameter("title");
                    String descriptionVolunteer = request.getParameter("descriptionVolunteer");
                    String contact = request.getParameter("contact");
                    long id = volunteer.getId();
                    long userId = volunteer.getUserId();
              Volunteer editVolunteer= new Volunteer(
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
              break;
            }

//            String firstname = user.getFirstName();
//            String lastname = user.getLastName();
//            String address = request.getParameter("address");
//            String phonenumber = request.getParameter("phonenumber");
//            int pets = Integer.parseInt(request.getParameter("pets"));
//            String email = user.getEmail();
////        String imageUrl = request.getParameter("image");
//            String password = request.getParameter("password");
//            String passwordConfirmation = request.getParameter("confirm_password");
//
//
//
//
//
//
//            // create and edit a current user
//            User editUser = new User(user.getId(), email, password, firstname, lastname, address, phonenumber, pets, "");
//            System.out.println(editUser.getId());
//            DaoFactory.getUsersDao().update(editUser);
//            request.getSession().setAttribute("user", editUser);
//            response.sendRedirect("/ads");
        }
    }

