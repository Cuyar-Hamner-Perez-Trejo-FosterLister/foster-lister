package com.codeup.adlister.models;

public class Volunteer {
    private long id;
    private long userId;
    private String date;
    private String title;
    private String description;
    private String contact;

    public Volunteer(long id, long userId, String date, String title, String description, String contact) {
        this.id = id;
        this.userId = userId;
        this.date = date;
        this.title = title;
        this.description = description;
        this.contact = contact;
    }

    public Volunteer(long userId, String date, String title, String description, String contact) {
        this.userId = userId;
        this.date = date;
        this.title = title;
        this.description = description;
        this.contact = contact;
    }


}
