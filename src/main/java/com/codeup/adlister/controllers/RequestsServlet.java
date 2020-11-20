package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Request;
import com.codeup.adlister.models.User;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

@WebServlet(name = "RequestsServlet", urlPatterns = "/requests")
public class RequestsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
            return;
        }

        Long listingId = Long.parseLong(request.getParameter("listing"));
        User user = (User) request.getSession().getAttribute("user");
        Long userId = user.getId();
        Date currentDate = new Date();
        java.text.SimpleDateFormat sdf =
                new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String mysqlDate = sdf.format(currentDate);
        Request userRequest = new Request(userId, listingId, mysqlDate);
        DaoFactory.getRequestsDao().insert(userRequest);
        request.setAttribute("request", userRequest);
        response.sendRedirect("/listing-info?listing=" + listingId);
    }
}
