package com.codeup.adlister.dao;

public class DaoFactory {
    private static Listings listingsDao;
    private static Users usersDao;
    private static Config config = new Config();

    public static Listings getListingsDao() {
        if (listingsDao == null) {
            listingsDao = new MySQLListingsDao(config);
        }
        return listingsDao;
    }

    public static Users getUsersDao() {
        if (usersDao == null) {
            usersDao = new MySQLUsersDao(config);
        }
        return usersDao;
    }
}
