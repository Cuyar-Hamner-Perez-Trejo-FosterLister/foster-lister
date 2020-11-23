package com.codeup.adlister.dao;

import com.codeup.adlister.Config;
import com.codeup.adlister.models.User;
import com.mysql.cj.jdbc.Driver;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MySQLUsersDao implements Users {
    private Connection connection;

    public MySQLUsersDao(Config config) {
        try {
            DriverManager.registerDriver(new Driver());
            connection = DriverManager.getConnection(
                config.getUrl(),
                config.getUser(),
                config.getPassword()
            );
        } catch (SQLException e) {
            throw new RuntimeException("Error connecting to the database!", e);
        }
    }

    @Override
    public List<User> all() {
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT * FROM users");
            ResultSet rs = stmt.executeQuery();
            return createUserFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("error retrieving all users");
        }
    }
    @Override
    public User findByEmail(String email) {
        String query = "SELECT * FROM users WHERE email = ? LIMIT 1";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();
            rs.next();
            return extractUser(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error finding a user by email", e);
        }
    }

    @Override
    public Long insert(User user) {
        String query = "INSERT INTO users(email, password, first_name, last_name, address, number_pets, phone, image_url, is_admin) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement stmt = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, user.getEmail());
            stmt.setString(2, user.getPassword());
            stmt.setString(3, user.getFirstName());
            stmt.setString(4, user.getLastName());
            stmt.setString(5, user.getAddress());
            stmt.setInt(6, user.getNumberOfPets());
            stmt.setString(7, user.getPhoneNumber());
            stmt.setString(8, user.getImgURL());
            stmt.setBoolean(9, user.isAdmin());

            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            return rs.getLong(1);
        } catch (SQLException e) {
            throw new RuntimeException("Error creating new user", e);
        }
    }
    @Override
    public void update(User user){
        String query = "UPDATE users SET email = ?, first_name = ?, last_name = ?, password = ?, address = ?, number_pets = ?, phone = ?, image_url = ? WHERE id = ?";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setString(1, user.getEmail());
            stmt.setString(2, user.getFirstName());
            stmt.setString(3,user.getLastName());
            stmt.setString(4,user.getPassword());
            stmt.setString(5,user.getAddress());
            stmt.setInt(6,user.getNumberOfPets());
            stmt.setString(7,user.getPhoneNumber());
            stmt.setString(8, user.getImgURL());
            stmt.setLong(9, user.getId());
            stmt.execute();

        } catch (SQLException e){
            System.out.println(e.getErrorCode());
            System.out.println(e.getSQLState());
            throw new RuntimeException("Error updating user", e);

        }

    }

    @Override
    public void destroy(long id) {
        String query = "DELETE FROM users WHERE id = ? LIMIT 1";
        PreparedStatement stmt;
        try {
            stmt = connection.prepareStatement(query);
            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Error deleting user");
        }
    }

    private User extractUser(ResultSet rs) throws SQLException {
        return new User(
            rs.getLong("id"),
            rs.getString("email"),
            rs.getString("password"),
                rs.getString("first_name"),
                rs.getString("last_name"),
                rs.getString("address"),
                rs.getString("phone"),
                rs.getInt("number_pets"),
                rs.getString("image_url"),
                rs.getBoolean("is_admin")
        );
    }

    private List<User> createUserFromResults(ResultSet rs) throws SQLException {
        List<User> users = new ArrayList<>();
        while (rs.next()) {
            users.add(extractUser(rs));
        }
        return users;
    }

}
