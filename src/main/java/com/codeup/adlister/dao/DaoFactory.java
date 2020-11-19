package com.codeup.adlister.dao;

import com.codeup.adlister.Config;

public class DaoFactory {
    private static Listings listingsDao;
    private static Users usersDao;
    private static Volunteers volunteersDao;
    private static Requests requestsDao;

    private static Config config = new Config();

    public static Listings getListingsDao() {
        if (listingsDao == null) {
            listingsDao = new MySQLListingsDao(config);
        }
        return listingsDao;
    }

    public static Volunteers getVolunteersDao() {
        if(volunteersDao == null) {
            volunteersDao = new MySQLVolunteersDao(config);
        }
        return volunteersDao;
    }

    public static Users getUsersDao() {
        if (usersDao == null) {
            usersDao = new MySQLUsersDao(config);
        }
        return usersDao;
    }

    public static Requests getRequestsDao() {
        if (requestsDao == null) {
            requestsDao = new MySQLRequestsDao(config);
        }
        return requestsDao;
    }
}
