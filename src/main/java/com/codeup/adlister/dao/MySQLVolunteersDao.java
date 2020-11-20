package com.codeup.adlister.dao;

import com.codeup.adlister.Config;
import com.codeup.adlister.models.Listing;
import com.codeup.adlister.models.Volunteer;
import com.mysql.cj.jdbc.Driver;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MySQLVolunteersDao implements Volunteers {
    private Connection connection = null;

    public MySQLVolunteersDao(Config config) {
        try {
            DriverManager.registerDriver(new Driver());
            connection = DriverManager.getConnection(
                    config.getUrl(),
                    config.getUser(),
                    config.getPassword()
            );
        } catch (SQLException e) {
            throw new RuntimeException("Error connecting to the database", e);
        }

    }

    @Override
    public  List<Volunteer> all() {
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT * FROM volunteers");
            ResultSet rs = stmt.executeQuery();
            return createVolunteerFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all volunteer ads");
        }
    }

    public List<Volunteer> fourMostRecentVolunteer() {
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT * FROM volunteers ORDER BY id DESC LIMIT 4;");
            ResultSet rs = stmt.executeQuery();
            return createVolunteerFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving listings");
        }
    }
    
    public Volunteer searchVolunteer(Long volunteerID) {
        PreparedStatement stmt = null;
        try {
            String query = "SELECT * FROM volunteers WHERE id = ?";
            stmt = connection.prepareStatement(query);
            stmt.setLong(1, volunteerID);
            ResultSet rs = stmt.executeQuery();
            rs.next();
            return extractVolunteer(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving listing.", e);
        }
    }

    @Override
    public Long insert(Volunteer volunteer) {
        try {

            String insertQuery = "INSERT INTO volunteers (user_id, date, title, description, contact, image_url) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setLong(1, volunteer.getUserId());
            stmt.setString(2, volunteer.getDate());
            stmt.setString(3, volunteer.getTitle());
            stmt.setString(4, volunteer.getDescription());
            stmt.setString(5, volunteer.getContact());
            stmt.setString(6, volunteer.getImageUrl());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            return rs.getLong(1);
        } catch (SQLException e) {
            throw new RuntimeException("Error creating a new volunteer listing", e);
        }
    }
    @Override
    public void update(Volunteer volunteer){
        String query = "UPDATE volunteers SET date = ?, title = ?, description = ?, contact = ? WHERE id = ?";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setString(1, volunteer.getDate());
            stmt.setString(2, volunteer.getTitle());
            stmt.setString(3, volunteer.getDescription());
            stmt.setString(4, volunteer.getContact());
            stmt.setLong(5,volunteer.getId());
            stmt.execute();
        } catch(SQLException e) {
            throw new RuntimeException("Error updating volunteer listing", e);
        }
    }
    @Override
    public void destroyVolunteer(long id) {
        String query = "DELETE FROM volunteers WHERE id = ?";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setLong(1, id);
            stmt.execute();
        } catch (SQLException e){
            throw new RuntimeException("Error deleting volunteer listing");
        }
    }


    private Volunteer extractVolunteer(ResultSet rs) throws SQLException {
        return new Volunteer(
                rs.getLong("id"),
                rs.getLong("user_id"),
                rs.getString("date"),
                rs.getString("title"),
                rs.getString("description"),
                rs.getString("contact"),
                rs.getString("image_url")
        );
    }

    private List<Volunteer> createVolunteerFromResults(ResultSet rs) throws SQLException {
        List<Volunteer> Volunteers = new ArrayList<>();
        while (rs.next()) {
            Volunteers.add(extractVolunteer(rs));
        }
        return Volunteers;
    }
}
