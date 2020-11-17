package com.codeup.adlister.dao;

import com.codeup.adlister.models.Listing;
import com.mysql.cj.jdbc.Driver;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
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
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all listings.", e);
        }
    }

    public List<Listing> allDogs() {
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT * FROM listings WHERE type = 'dog';");
            ResultSet rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all dog listings.", e);
        }
    }

    @Override
    public Long insert(Listing listing) {
        try {
            String insertQuery = "INSERT INTO listings (user_id, title, description) VALUES (?, ?, ?)";
            PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setLong(1, listing.getUserId());
            stmt.setString(2, listing.getTitle());
            stmt.setString(3, listing.getDescription());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            return rs.getLong(1);
        } catch (SQLException e) {
            throw new RuntimeException("Error creating a new ad.", e);
        }
    }

    private Listing extractAd(ResultSet rs) throws SQLException {
        return new Listing(
            rs.getLong("id"),
            rs.getLong("user_id"),
            rs.getString("title"),
            rs.getString("description")
        );
    }

    private List<Listing> createAdsFromResults(ResultSet rs) throws SQLException {
        List<Listing> listings = new ArrayList<>();
        while (rs.next()) {
            listings.add(extractAd(rs));
        }
        return listings;
    }
}
