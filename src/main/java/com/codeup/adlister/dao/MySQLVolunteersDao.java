package com.codeup.adlister.dao;

import com.codeup.adlister.Config;
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

    @Override
    public Long insert(Volunteer volunteer) {
        try {
            String insertQuery = "INSERT INTO volunteers (?, ?, ?, ?, ?)";
            PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setLong(1, volunteer.getUserId());
            stmt.setString(2, volunteer.getDate());
            stmt.setString(3, volunteer.getTitle());
            stmt.setString(4, volunteer.getDescription());
            stmt.setString(5, volunteer.getContact());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            return rs.getLong(1);
        } catch (SQLException e) {
            throw new RuntimeException("Error creating a new volunteer listing", e);
        }
    }

    private Volunteer extractVolunteer(ResultSet rs) throws SQLException {
        return new Volunteer(
                rs.getLong("id"),
                rs.getLong("user_id"),
                rs.getString("date"),
                rs.getString("title"),
                rs.getString("description"),
                rs.getString("contact")
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
