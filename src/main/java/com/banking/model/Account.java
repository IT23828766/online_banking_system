package com.banking.model;

public class Account {
    private int accountId;
    private String accountNumber;
    private String accountType;
    private double balance;
    private String status;
    private java.sql.Date dateOpened;
    private java.sql.Date dateClosed; // can be null
    private String nickname;
    private int customerId; // Foreign key to Customer table

    // Default constructor
    public Account() {}

    /*// Parameterized constructor
    public Account(int accountId, String accountNumber, String accountType, double balance, String status,
                   java.sql.Date dateOpened, java.sql.Date dateClosed, String nickname, int customerId) {
        this.accountId = accountId;
        this.accountNumber = accountNumber;
        this.accountType = accountType;
        this.balance = balance;
        this.status = status;
        this.dateOpened = dateOpened;
        this.dateClosed = dateClosed;
        this.nickname = nickname;
        this.customerId = customerId;
    }*/

    // Getters and Setters
    public int getAccountId() {
        return accountId;
    }
    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }
    public String getAccountNumber() {
        return accountNumber;
    }
    public void setAccountNumber(String accountNumber) {
        this.accountNumber = accountNumber;
    }
    public String getAccountType() {
        return accountType;
    }
    public void setAccountType(String accountType) {
        this.accountType = accountType;
    }
    public double getBalance() {
        return balance;
    }
    public void setBalance(double balance) {
        this.balance = balance;
    }
    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }
    public java.sql.Date getDateOpened() {
        return dateOpened;
    }
    public void setDateOpened(java.sql.Date dateOpened) {
        this.dateOpened = dateOpened;
    }
    public java.sql.Date getDateClosed() {
        return dateClosed;
    }
    public void setDateClosed(java.sql.Date dateClosed) {
        this.dateClosed = dateClosed;
    }
    public String getNickname() {
        return nickname;
    }
    public void setNickname(String nickname) {
        this.nickname = nickname;
    }
    public int getCustomerId() {
        return customerId;
    }
    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }
}
