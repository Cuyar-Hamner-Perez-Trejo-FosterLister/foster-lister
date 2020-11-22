package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet(name = "controllers.UpdateUserServlet", urlPatterns = "/update-user")
    public class UpdateUserServlet extends HttpServlet {
        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            if (request.getSession().getAttribute("user") == null) {
                response.sendRedirect("/login");
                return;
            }

            request.getRequestDispatcher("/WEB-INF/editprofile.jsp").forward(request, response);
        }

        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
            User user = (User) request.getSession().getAttribute("user");
            String firstname = user.getFirstName();
            String lastname = user.getLastName();
            String address = request.getParameter("address");
            String phonenumber = request.getParameter("phonenumber");
            int pets = Integer.parseInt(request.getParameter("pets"));
            String email = user.getEmail();
//        String imageUrl = request.getParameter("image");
            String password = request.getParameter("password");
            String passwordConfirmation = request.getParameter("confirm_password");

            // validate input
            boolean inputHasErrors = address.isEmpty()
                    || phonenumber.isEmpty()
                    || pets < 0
                    || password.isEmpty()
                    || (! password.equals(passwordConfirmation));

            if (inputHasErrors) {
                response.sendRedirect("/update-user");
                return;
            }

            // create and edit a current user
            User editUser = new User(user.getId(), email, password, firstname, lastname, address, phonenumber, pets, "");
            DaoFactory.getUsersDao().update(editUser);
            request.getSession().setAttribute("user", editUser);
            response.sendRedirect("/");
        }
    }


