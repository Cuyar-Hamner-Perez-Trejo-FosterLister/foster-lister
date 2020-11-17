package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.RegisterServlet", urlPatterns = "/register")
public class RegisterServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String address = request.getParameter("address");
        String phonenumber = request.getParameter("phonenumber");
        int pets = Integer.parseInt(request.getParameter("pets"));
        String email = request.getParameter("email");
//        String imageUrl = request.getParameter("image");
        String password = request.getParameter("password");
        String passwordConfirmation = request.getParameter("confirm_password");

        // validate input
        boolean inputHasErrors = firstname.isEmpty()
                || lastname.isEmpty()
                || address.isEmpty()
                || phonenumber.isEmpty()
                || pets < 0
                || email.isEmpty()
                || password.isEmpty()
                || (! password.equals(passwordConfirmation));

        if (inputHasErrors) {
            response.sendRedirect("/register");
            return;
        }

        // create and save a new user
        User user = new User(email, password, firstname, lastname, address, phonenumber, pets, "");
        DaoFactory.getUsersDao().insert(user);
        response.sendRedirect("/login");
    }
}
