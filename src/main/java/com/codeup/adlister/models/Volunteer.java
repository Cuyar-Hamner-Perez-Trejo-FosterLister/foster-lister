package com.codeup.adlister.models;

public class Volunteer {
    private long id;
    private long userId;
    private String date;
    private String title;
    private String description;
    private String contact;
    private String imageUrl;

    public Volunteer(long id, long userId, String date, String title, String description, String contact, String imageUrl) {
        this.id = id;
        this.userId = userId;
        this.date = date;
        this.title = title;
        this.description = description;
        this.contact = contact;
        this.imageUrl = imageUrl;
    }

    public Volunteer(long userId, String date, String title, String description, String contact, String imageUrl) {
        this.userId = userId;
        this.date = date;
        this.title = title;
        this.description = description;
        this.contact = contact;
        this.imageUrl = imageUrl;
    }


    public void setId(long id) {
        this.id = id;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public void setImageUrl(String imageUrl) { this.imageUrl = imageUrl; }

    public long getId() {
        return id;
    }

    public long getUserId() {
        return userId;
    }

    public String getDate() {
        return date;
    }

    public String getTitle() {
        return title;
    }

    public String getDescription() {
        return description;
    }

    public String getContact() {
        return contact;
    }

    public String getImageUrl() { return imageUrl; }
}
