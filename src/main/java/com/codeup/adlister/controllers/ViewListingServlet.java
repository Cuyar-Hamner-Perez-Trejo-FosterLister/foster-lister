package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.ViewListingServlet", urlPatterns = "/listing-info")
public class ViewListingServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("listing"));
        request.setAttribute("name", id);
        request.setAttribute("listing", DaoFactory.getListingsDao().searchListing(id));
        request.getRequestDispatcher("/WEB-INF/ads/adoption-listing.jsp").forward(request, response);
    }
}