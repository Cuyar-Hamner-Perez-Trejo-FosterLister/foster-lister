package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Listing;
import com.codeup.adlister.models.User;

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


//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
//        User user = (User) request.getSession().getAttribute("user");
//        Listing listing = new Listing(
//            user.getId(),
//            request.getParameter("name"),
//            request.getParameter("age"),
//            request.getParameter("breed")
//        );
//        DaoFactory.getListingsDao().insert(ad);
//        response.sendRedirect("/ads");
//    }

   
}
