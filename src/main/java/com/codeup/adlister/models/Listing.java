package com.codeup.adlister.models;

public class Listing {
    private long id;
    private long userId;
    private String imageUrl;
    private String name;
    private String type;
    private String breed;
    private String dob;
    private Character gender;
    private String conditions;
    private String description;
    private String size;
    private int litterSize;
    private String fosterDuration;
    private String createdTime;
    private int roleId;

    // SELECT constructor
    public Listing(long id, long userId, String imageUrl, String name, String type, String breed, String dob, Character gender, String conditions, String description, String size, int litterSize, String fosterDuration, String createdTime, int roleId) {
        this.id = id;
        this.userId = userId;
        this.imageUrl = imageUrl;
        this.name = name;
        this.type = type;
        this.breed = breed;
        this.dob = dob;
        this.gender = gender;
        this.conditions = conditions;
        this.description = description;
        this.size = size;
        this.litterSize = litterSize;
        this.fosterDuration = fosterDuration;
        this.createdTime = createdTime;
        this.roleId = roleId;
    }

    // INSERT constructor
    public Listing(long userId, String imageUrl, String name, String type, String breed, String dob, Character gender, String conditions, String description, String size, int litterSize, String fosterDuration, int roleId) {
        this.userId = userId;
        this.imageUrl = imageUrl;
        this.name = name;
        this.type = type;
        this.breed = breed;
        this.dob = dob;
        this.gender = gender;
        this.conditions = conditions;
        this.description = description;
        this.size = size;
        this.litterSize = litterSize;
        this.fosterDuration = fosterDuration;
        this.roleId = roleId;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getBreed() {
        return breed;
    }

    public void setBreed(String breed) {
        this.breed = breed;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public Character getGender() {
        return gender;
    }

    public void setGender(Character gender) {
        this.gender = gender;
    }

    public String getConditions() {
        return conditions;
    }

    public void setConditions(String conditions) {
        this.conditions = conditions;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public int getLitterSize() {
        return litterSize;
    }

    public void setLitterSize(int litterSize) {
        this.litterSize = litterSize;
    }

    public String getFosterDuration() {
        return fosterDuration;
    }

    public void setFosterDuration(String fosterDuration) {
        this.fosterDuration = fosterDuration;
    }

    public String getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(String createdTime) {
        this.createdTime = createdTime;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }
}
