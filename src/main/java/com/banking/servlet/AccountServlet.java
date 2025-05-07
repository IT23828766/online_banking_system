package com.banking.servlet;

import com.banking.model.Account;
import com.banking.service.AccountService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/accounts")
public class AccountServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private AccountService accountService;

    @Override
    public void init() throws ServletException {
        accountService = new AccountService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Account> accounts = accountService.getAllAccounts();
        request.setAttribute("accounts", accounts);
        request.getRequestDispatcher("AccountManagement.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accountNumber = request.getParameter("accountNumber");
        String accountType = request.getParameter("accountType");
        String balanceStr = request.getParameter("balance");
        String status = request.getParameter("status");
        String nickname = request.getParameter("nickname");

        double balance = 0.0;
        if (balanceStr != null && !balanceStr.isEmpty()) {
            balance = Double.parseDouble(balanceStr);
        }

        java.sql.Date dateOpened = new java.sql.Date(System.currentTimeMillis());

        Account account = new Account();
        account.setAccountNumber(accountNumber);
        account.setAccountType(accountType);
        account.setBalance(balance);
        account.setStatus(status);
        account.setDateOpened(dateOpened);
        account.setDateClosed(null);
        account.setNickname(nickname);

        boolean success = accountService.createAccount(account);

        // Show updated list
        List<Account> accounts = accountService.getAllAccounts();
        request.setAttribute("accounts", accounts);
        request.getRequestDispatcher("AccountManagement.jsp").forward(request, response);
    }

}
