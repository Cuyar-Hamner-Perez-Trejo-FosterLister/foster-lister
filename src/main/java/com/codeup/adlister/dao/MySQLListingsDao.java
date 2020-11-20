package com.codeup.adlister.dao;

import com.codeup.adlister.Config;
import com.codeup.adlister.models.Listing;
import com.mysql.cj.jdbc.Driver;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MySQLListingsDao implements Listings {
    private Connection connection = null;

    public MySQLListingsDao(Config config) {
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
    public List<Listing> all() {
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT * FROM listings");
            ResultSet rs = stmt.executeQuery();
            return createListingsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all listings.", e);
        }
    }

    public List<Listing> allDogs() {
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT * FROM listings WHERE type = 'dog';");
            ResultSet rs = stmt.executeQuery();
            return createListingsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all dog listings.", e);
        }
    }

    public List<Listing> allCats() {
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT * FROM listings WHERE type = 'cat';");
            ResultSet rs = stmt.executeQuery();
            return createListingsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all cat listings.", e);
        }
    }

    public Listing searchListing(Long listingID) {
        PreparedStatement stmt = null;
        try {
            String query = "SELECT * FROM listings WHERE id = ?";
            stmt = connection.prepareStatement(query);
            stmt.setLong(1, listingID);
            ResultSet rs = stmt.executeQuery();
            rs.next();
            return extractListing(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving listing.", e);
        }
    }

    @Override
    public Long insert(Listing listing) {
        try {
            java.util.Date dt = new java.util.Date();

            java.text.SimpleDateFormat sdf =
                    new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

            String currentTime = sdf.format(dt);
            String insertQuery = "INSERT INTO listings (user_id, image_url, name, type, breed, dob, gender, conditions, description, size, litter_size, foster_duration, created_time, role_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setLong(1, listing.getUserId());
            stmt.setString(2, listing.getImageUrl());
            stmt.setString(3, listing.getName());
            stmt.setString(4, listing.getType());
            stmt.setString(5, listing.getBreed());
            stmt.setString(6, listing.getDob());
            stmt.setString(7, listing.getGender().toString());
            stmt.setString(8, listing.getConditions());
            stmt.setString(9, listing.getDescription());
            stmt.setString(10, listing.getSize());
            stmt.setInt(11, listing.getLitterSize());
            stmt.setString(12, listing.getFosterDuration());
            stmt.setString(13, currentTime);
            stmt.setInt(14, listing.getRoleId());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            return rs.getLong(1);
        } catch (SQLException e) {
            throw new RuntimeException("Error creating a new listing.", e);
        }
    }
    private void update(Listing listing){
        String query = "UPDATE listings SET name = ?, type = ?, breed = ?, dob = ?, gender = ?, conditions = ?, description = ?, size = ?, litter_size = ?, foster_duration = ?, role_id = ? WHERE id = ?";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setString(1, listing.getName());
            stmt.setString(2, listing.getType());
            stmt.setString(3, listing.getBreed());
            stmt.setString(4, listing.getDob());
            stmt.setString(5, listing.getGender().toString());
            stmt.setString(6,listing.getConditions());
            stmt.setString(7, listing.getDescription());
            stmt.setString(8, listing.getSize());
            stmt.setInt(9, listing.getLitterSize());
            stmt.setString(10, listing.getFosterDuration());
            stmt.setInt(11, listing.getRoleId());
            stmt.setLong(12, listing.getId());
            stmt.execute();
        } catch(SQLException e){
            throw new RuntimeException("Error updating listing", e);
        }

    }
    private Listing extractListing(ResultSet rs) throws SQLException {
        return new Listing(
            rs.getLong("id"),
            rs.getLong("user_id"),
            rs.getString("image_url"),
            rs.getString("name"),
            rs.getString("type"),
            rs.getString("breed"),
            rs.getString("dob"),
            rs.getString("gender").charAt(0),
            rs.getString("conditions"),
            rs.getString("description"),
            rs.getString("size"),
            rs.getInt("litter_size"),
            rs.getString("foster_duration"),
            rs.getString("created_time"),
            rs.getInt("role_id")
        );
    }

    private List<Listing> createListingsFromResults(ResultSet rs) throws SQLException {
        List<Listing> listings = new ArrayList<>();
        while (rs.next()) {
            listings.add(extractListing(rs));
        }
        return listings;
    }
}
