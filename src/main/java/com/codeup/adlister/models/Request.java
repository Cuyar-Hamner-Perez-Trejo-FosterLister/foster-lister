package com.codeup.adlister.models;

public class Request {
    private long id;
    private long userId;
    private long roleId;
    private String requestDate;

    public Request(long id, long userId, long roleId, String requestDate){
        this.id = id;
        this.userId = userId;
        this.roleId = roleId;
        this.requestDate = requestDate;
    }

    public Request(long userId, long roleId, String requestDate){
        this.userId = userId;
        this.roleId = roleId;
        this.requestDate = requestDate;
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

    public long getRoleId() {
        return roleId;
    }

    public void setRoleId(long roleId) {
        this.roleId = roleId;
    }

    public String getRequestDate() {
        return requestDate;
    }

    public void setRequestDate(String requestDate) {
        this.requestDate = requestDate;
    }
}
