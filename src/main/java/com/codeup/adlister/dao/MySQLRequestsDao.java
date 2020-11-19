package com.codeup.adlister.dao;

import com.codeup.adlister.Config;
import com.codeup.adlister.models.Request;
import com.mysql.cj.jdbc.Driver;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MySQLRequestsDao implements Requests{
    private Connection connection = null;
    private PreparedStatement stmt = null;

    public MySQLRequestsDao(Config config) {
        try {
            DriverManager.registerDriver((new Driver()));
            connection = DriverManager.getConnection(
                    config.getUrl(),
                    config.getUser(),
                    config.getPassword()
            );
        }
        catch (SQLException e) {
            throw new RuntimeException("Error connecting to the database!", e);
        }
    }

    @Override
    public List<Request> all() {
        try {
            stmt = connection.prepareStatement("SELECT * FROM requests");
            ResultSet rs = stmt.executeQuery();
            return createRequestsFromResults(rs);
        }
        catch (SQLException e) {
            throw new RuntimeException("Error retrieving all requests.", e);
        }
    }

    @Override
    public List<Request> allVolunteers() {
        String selectQuery = "SELECT requests.id, requests.user_id, requests.listing_id, requests.request_date FROM requests\n" +
                "INNER JOIN listings l on requests.listing_id = l.id\n" +
                "INNER JOIN roles r on l.role_id = r.id\n" +
                "WHERE r.name = 'Volunteer';";
        try {
            stmt = connection.prepareStatement(selectQuery);
            ResultSet rs = stmt.executeQuery();
            return createRequestsFromResults(rs);
        }
        catch (SQLException e) {
            throw new RuntimeException("Error retrieving all volunteer requests.", e);
        }
    }

    @Override
    public List<Request> allFosters() {
        String selectQuery = "SELECT requests.id, requests.user_id, requests.listing_id, requests.request_date FROM requests\n" +
                "INNER JOIN listings l on requests.listing_id = l.id\n" +
                "INNER JOIN roles r on l.role_id = r.id\n" +
                "WHERE r.name = 'Foster';";
        try {
            stmt = connection.prepareStatement(selectQuery);
            ResultSet rs = stmt.executeQuery();
            return createRequestsFromResults(rs);
        }
        catch (SQLException e) {
            throw new RuntimeException("Error retrieving all foster requests.", e);
        }
    }

    @Override
    public List<Request> allAdoptions() {
        String selectQuery = "SELECT requests.id, requests.user_id, requests.listing_id, requests.request_date FROM requests\n" +
                "INNER JOIN listings l on requests.listing_id = l.id\n" +
                "INNER JOIN roles r on l.role_id = r.id\n" +
                "WHERE r.name = 'Adoption';";
        try {
            stmt = connection.prepareStatement(selectQuery);
            ResultSet rs = stmt.executeQuery();
            return createRequestsFromResults(rs);
        }
        catch (SQLException e) {
            throw new RuntimeException("Error retrieving all adoption requests.", e);
        }
    }

    @Override
    public Long insert(Request request) {
        try {
            String insertQuery = "INSERT INTO requests (user_id, listing_id, request_date) VALUES (?, ?, ?)";
            stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setLong(1, request.getUserId());
            stmt.setLong(2, request.getListingId());
            stmt.setString(3, request.getRequestDate());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            return rs.getLong(1);
        }
        catch (SQLException e) {
            throw new RuntimeException("Error creating a new request.", e);
        }
    }

    @Override
    public void update(Request request) {
        try {
            String updateQuery = "UPDATE requests SET user_id = ?, listing_id = ?, request_date = ? WHERE id = ?";
            stmt = connection.prepareStatement(updateQuery);
            stmt.setLong(1, request.getUserId());
            stmt.setLong(2, request.getListingId());
            stmt.setString(3, request.getRequestDate());
            stmt.setLong(4, request.getId());
            stmt.executeUpdate();
        }
        catch (SQLException e) {
            throw new RuntimeException("Error updating request", e);
        }
    }

    @Override
    public void delete(Request request) {
        try {
            String deleteQuery = "DELETE FROM requests WHERE id = ?";
            stmt = connection.prepareStatement(deleteQuery);
            stmt.setLong(1, request.getId());
            stmt.executeUpdate();
        }
        catch (SQLException e) {
            e.printStackTrace();
        }

    }

    private Request extractRequest(ResultSet rs) throws SQLException {
        return new Request(
                rs.getLong("id"),
                rs.getLong("user_id"),
                rs.getLong("listing_id"),
                rs.getString("request_date")
        );
    }

    private List<Request> createRequestsFromResults(ResultSet rs) throws SQLException {
        List<Request> requests = new ArrayList<>();
        while (rs.next()) {
            requests.add(extractRequest(rs));
        }
        return requests;
    }
}
