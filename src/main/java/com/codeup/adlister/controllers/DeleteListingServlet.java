package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.dao.MySQLListingsDao;
import com.codeup.adlister.models.Volunteer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DeleteListingServlet", urlPatterns = "/delete-listing")
public class DeleteListingServlet extends HttpServlet{
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
            return;
        }

        if(request.getParameter("listing").equals("volunteer")) {
            long id = Long.parseLong(request.getParameter("id"));
            DaoFactory.getVolunteersDao().destroyVolunteer(id);
            response.sendRedirect("/volunteer-listings");
        }else {
            long id = Long.parseLong(request.getParameter("listing"));
            DaoFactory.getListingsDao().destroyListing(id);
            response.sendRedirect("/");
        }
    }


}
