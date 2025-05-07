package com.banking.service;

import com.banking.model.Account;
import com.banking.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AccountService {

    // Create Account
    public boolean createAccount(Account account) {
        String query = "INSERT INTO Account (account_number, account_type, balance, status, date_opened, date_closed, nickname, customer_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, account.getAccountNumber());
            stmt.setString(2, account.getAccountType());
            stmt.setDouble(3, account.getBalance());
            stmt.setString(4, account.getStatus());
            stmt.setDate(5, account.getDateOpened());
            stmt.setDate(6, account.getDateClosed()); // can be null
            stmt.setString(7, account.getNickname());
            stmt.setInt(8, account.getCustomerId());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Get Account by ID
    public Account getAccount(int accountId) {
        String query = "SELECT * FROM Account WHERE account_id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, accountId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Account account = new Account();
                account.setAccountId(rs.getInt("account_id"));
                account.setAccountNumber(rs.getString("account_number"));
                account.setAccountType(rs.getString("account_type"));
                account.setBalance(rs.getDouble("balance"));
                account.setStatus(rs.getString("status"));
                account.setDateOpened(rs.getDate("date_opened"));
                account.setDateClosed(rs.getDate("date_closed"));
                account.setNickname(rs.getString("nickname"));
                account.setCustomerId(rs.getInt("customer_id"));
                return account;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Get All Accounts
    public List<Account> getAllAccounts() {
        List<Account> accounts = new ArrayList<>();
        String query = "SELECT * FROM Account";
        try (Connection connection = DBConnection.getConnection();
             Statement stmt = connection.createStatement()) {
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                Account account = new Account();
                account.setAccountId(rs.getInt("account_id"));
                account.setAccountNumber(rs.getString("account_number"));
                account.setAccountType(rs.getString("account_type"));
                account.setBalance(rs.getDouble("balance"));
                account.setStatus(rs.getString("status"));
                account.setDateOpened(rs.getDate("date_opened"));
                account.setDateClosed(rs.getDate("date_closed"));
                account.setNickname(rs.getString("nickname"));
                account.setCustomerId(rs.getInt("customer_id"));
                accounts.add(account);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return accounts;
    }

    // Update Account
    public boolean updateAccount(Account account) {
        String query = "UPDATE Account SET account_number = ?, account_type = ?, balance = ?, status = ?, date_opened = ?, date_closed = ?, nickname = ?, customer_id = ? WHERE account_id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, account.getAccountNumber());
            stmt.setString(2, account.getAccountType());
            stmt.setDouble(3, account.getBalance());
            stmt.setString(4, account.getStatus());
            stmt.setDate(5, account.getDateOpened());
            stmt.setDate(6, account.getDateClosed());
            stmt.setString(7, account.getNickname());
            stmt.setInt(8, account.getCustomerId());
            stmt.setInt(9, account.getAccountId());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Delete Account
    public boolean deleteAccount(int accountId) {
        String query = "DELETE FROM Account WHERE account_id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, accountId);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
