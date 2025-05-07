<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Account Management - Online Banking System</title>
  <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
  <script src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js" defer></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f4f9;
            margin: 0;
            padding: 0;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }
        main {
            flex: 1;
            max-width: 1050px;
            margin: 30px auto 20px auto;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.08);
            padding: 32px;
        }
        h2 {
            color: #003366;
            margin-bottom: 16px;
        }
        .search-bar {
            margin-bottom: 16px;
            display: flex;
            align-items: center;
        }
        .search-bar input[type="text"] {
            width: 250px;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px 0 0 4px;
            outline: none;
        }
        .search-bar button {
            padding: 8px 14px;
            border: none;
            background: #0055a5;
            color: white;
            border-radius: 0 4px 4px 0;
            cursor: pointer;
            font-weight: bold;
        }
        .add-account-btn {
            background: #28a745;
            color: white;
            border: none;
            padding: 8px 18px;
            border-radius: 4px;
            font-size: 16px;
            margin-bottom: 18px;
            cursor: pointer;
            float: right;
        }
        .add-account-btn:hover {
            background: #218838;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
        }
        th, td {
            padding: 10px 8px;
            border-bottom: 1px solid #e0e0e0;
            text-align: left;
        }
        th {
            background: #e5ecfa;
            color: #003366;
        }
        .action-btn {
            margin-right: 6px;
            padding: 5px 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
        }
        .view-btn { background: #17a2b8; color: white; }
        .edit-btn { background: #ffc107; color: #333; }
        .delete-btn { background: #dc3545; color: white; }
        .action-btn:hover { opacity: 0.85; }
        /* Modal styles */
        .modal {
            display: none;
            position: fixed;
            z-index: 1000;
            left: 0; top: 0;
            width: 100%; height: 100%;
            overflow: auto;
            background-color: rgba(0,0,0,0.3);
        }
        .modal-content {
            background: #fff;
            margin: 60px auto;
            padding: 24px 32px;
            border-radius: 8px;
            max-width: 450px;
            box-shadow: 0 0 10px rgba(0,0,0,0.2);
            position: relative;
        }
        .close {
            color: #aaa;
            position: absolute;
            top: 10px; right: 18px;
            font-size: 28px;
            font-weight: bold;
            cursor: pointer;
        }
        .close:hover { color: #333; }
        .form-group { margin-bottom: 14px; }
        .form-group label { display: block; margin-bottom: 4px; font-weight: bold; }
        .form-group input, .form-group select {
            width: 100%; padding: 8px;
            border: 1px solid #ccc; border-radius: 4px;
        }
        .modal-footer {
            text-align: right;
        }
        .error-message {
            color: #dc3545;
            font-size: 14px;
            margin-bottom: 8px;
        }
        @media (max-width: 700px) {
            main { padding: 10px; }
            .modal-content { padding: 12px 8px; }
        }
    </style>
</head>
<body>
    <!-- Header / Navigation Bar -->
   <header class="bg-gradient-to-r from-blue-900 to-blue-700 shadow-lg">
    <nav class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
      <div class="flex items-center justify-between h-20">
        <!-- Logo and Site Name -->
        <div class="flex items-center space-x-3">
          <span class="text-3xl text-yellow-400"><i class="fas fa-university"></i></span>
          <span class="text-white font-bold text-2xl tracking-wide">E-Bank</span>
        </div>
        <!-- Navigation Links -->
        <div class="hidden md:flex space-x-6">
          <a href="#" class="flex items-center text-white hover:text-yellow-300 font-medium transition">
            <i class="fas fa-home mr-1"></i> Home
          </a>
          <a href="#" class="flex items-center text-white hover:text-yellow-300 font-medium transition">
            <i class="fas fa-info-circle mr-1"></i> About Us
          </a>
          <a href="#" class="flex items-center text-white hover:text-yellow-300 font-medium transition">
            <i class="fas fa-wallet mr-1"></i> Accounts
          </a>
          <a href="#" class="flex items-center text-white hover:text-yellow-300 font-medium transition">
            <i class="fas fa-cogs mr-1"></i> Services
          </a>
          <a href="#" class="flex items-center text-white hover:text-yellow-300 font-medium transition">
            <i class="fas fa-sign-in-alt mr-1"></i> Login
          </a>
          <a href="#" class="flex items-center text-white hover:text-yellow-300 font-medium transition">
            <i class="fas fa-user-plus mr-1"></i> Register
          </a>
          <a href="#" class="flex items-center text-white hover:text-yellow-300 font-medium transition">
            <i class="fas fa-envelope mr-1"></i> Contact Us
          </a>
        </div>
        <!-- Mobile Menu Button -->
        <div class="md:hidden">
          <button id="mobile-menu-btn" class="text-white focus:outline-none text-2xl">
            <i class="fas fa-bars"></i>
          </button>
        </div>
      </div>
      <!-- Mobile Menu -->
      <div id="mobile-menu" class="md:hidden hidden flex-col space-y-2 mt-3 pb-4">
        <a href="#" class="flex items-center text-white hover:text-yellow-300 font-medium transition px-2">
          <i class="fas fa-home mr-1"></i> Home
        </a>
        <a href="#" class="flex items-center text-white hover:text-yellow-300 font-medium transition px-2">
          <i class="fas fa-info-circle mr-1"></i> About Us
        </a>
        <a href="#" class="flex items-center text-white hover:text-yellow-300 font-medium transition px-2">
          <i class="fas fa-wallet mr-1"></i> Accounts
        </a>
        <a href="#" class="flex items-center text-white hover:text-yellow-300 font-medium transition px-2">
          <i class="fas fa-cogs mr-1"></i> Services
        </a>
        <a href="#" class="flex items-center text-white hover:text-yellow-300 font-medium transition px-2">
          <i class="fas fa-sign-in-alt mr-1"></i> Login
        </a>
        <a href="#" class="flex items-center text-white hover:text-yellow-300 font-medium transition px-2">
          <i class="fas fa-user-plus mr-1"></i> Register
        </a>
        <a href="#" class="flex items-center text-white hover:text-yellow-300 font-medium transition px-2">
          <i class="fas fa-envelope mr-1"></i> Contact Us
        </a>
      </div>
    </nav>
  </header>
    <main>
        <h2>Account Management</h2>
        <button class="add-account-btn" onclick="openAddModal()">+ Add New Account</button>
        <div class="search-bar">
            <input type="text" id="search-input" placeholder="Search by Account Number, Type, or Status...">
            <button onclick="searchAccounts()">Search</button>
        </div>
        <table id="accounts-table">
            <thead>
                <tr>
                    <th>Account Number</th>
                    <th>Type</th>
                    <th>Balance (Rs.)</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
  <c:forEach var="account" items="${accounts}">
      <tr>
          <td>${account.accountNumber}</td>
          <td>${account.accountType}</td>
          <td>Rs${account.balance}</td>
          <td>${account.status}</td>
          <td>
              <button class="action-btn view-btn">View Details</button>
              <button class="action-btn edit-btn">Edit</button>
              <button class="action-btn delete-btn">Delete</button>
          </td>
      </tr>
  </c:forEach>
</tbody>

        </table>
    </main>
    
    <footer class="bg-gradient-to-r from-blue-900 to-blue-700 text-white py-8 mt-12">
      <div class="max-w-7xl mx-auto px-4 flex flex-col md:flex-row items-center justify-between">
        <!-- Logo and Site Name -->
        <div class="flex items-center space-x-3 mb-6 md:mb-0">
          <span class="text-3xl text-yellow-400"><i class="fas fa-university"></i></span>
          <span class="font-bold text-2xl tracking-wide">E-Bank</span>
        </div>
        <!-- Footer Links -->
        <div class="flex flex-col md:flex-row items-center space-y-3 md:space-y-0 md:space-x-6 mb-6 md:mb-0">
          <a href="#" class="hover:text-yellow-300 transition">Privacy Policy</a>
          <a href="#" class="hover:text-yellow-300 transition">Terms & Conditions</a>
          <a href="#" class="hover:text-yellow-300 transition">Contact Us</a>
        </div>
        <!-- Social Icons -->
        <div class="flex space-x-4">
          <a href="#" aria-label="Facebook" class="text-xl hover:text-yellow-300 transition"><i class="fab fa-facebook-f"></i></a>
          <a href="#" aria-label="Twitter" class="text-xl hover:text-yellow-300 transition"><i class="fab fa-twitter"></i></a>
          <a href="#" aria-label="LinkedIn" class="text-xl hover:text-yellow-300 transition"><i class="fab fa-linkedin-in"></i></a>
        </div>
      </div>
      <div class="mt-6 text-center text-blue-100 text-sm">
        © 2025 E-Bank. All rights reserved.
      </div>
    </footer>

    <!-- View Details Modal -->
    <div id="view-modal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal('view-modal')">&times;</span>
            <h3>Account Details</h3>
            <div id="view-details"></div>
        </div>
    </div>

    <!-- Edit Account Modal -->
    <div id="edit-modal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal('edit-modal')">&times;</span>
            <h3>Edit Account</h3>
            <div class="error-message" id="edit-error"></div>
            <form id="edit-form">
                <div class="form-group">
                    <label for="edit-account-number">Account Number</label>
                    <input type="text" id="edit-account-number" name="accountNumber" readonly>
                </div>
                <div class="form-group">
                    <label for="edit-type">Account Type</label>
                    <select id="edit-type" name="type" required>
                        <option value="Savings">Savings</option>
                        <option value="Current">Current</option>
                        <option value="Salary">Salary</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="edit-status">Status</label>
                    <select id="edit-status" name="status" required>
                        <option value="Active">Active</option>
                        <option value="Inactive">Inactive</option>
                        <option value="Closed">Closed</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="edit-nickname">Nickname</label>
                    <input type="text" id="edit-nickname" name="nickname" maxlength="20">
                </div>
                <div class="modal-footer">
                    <button type="submit" class="edit-btn action-btn">Save Changes</button>
                </div>
            </form>
        </div>
    </div>

    <!-- Add Account Modal -->
    <div id="add-modal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal('add-modal')">&times;</span>
            <h3>Add New Account</h3>
            <div class="error-message" id="add-error"></div>
            <form id="add-form" action="accounts" method="post">
    <div class="form-group">
        <label for="add-account-number">Account Number</label>
        <input type="text" id="add-account-number" name="accountNumber" maxlength="12" required>
    </div>
    <div class="form-group">
        <label for="add-type">Account Type</label>
        <select id="add-type" name="accountType" required>
            <option value="">--Select--</option>
            <option value="Savings">Savings</option>
            <option value="Current">Current</option>
            <option value="Salary">Salary</option>
        </select>
    </div>
    <div class="form-group">
        <label for="add-balance">Initial Balance (₹)</label>
        <input type="number" id="add-balance" name="balance" min="0" required>
    </div>
    <div class="form-group">
        <label for="add-status">Status</label>
        <select id="add-status" name="status" required>
            <option value="Active">Active</option>
            <option value="Inactive">Inactive</option>
            <option value="Closed">Closed</option>
        </select>
    </div>
    <div class="form-group">
        <label for="add-nickname">Nickname</label>
        <input type="text" id="add-nickname" name="nickname" maxlength="20">
    </div>
    <div class="modal-footer">
        <button type="submit" class="add-account-btn">Add Account</button>
    </div>
</form>

        </div>
    </div>

    <!-- Delete Confirmation Modal -->
    <div id="delete-modal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal('delete-modal')">&times;</span>
            <h3>Confirm Delete</h3>
            <p id="delete-confirm-msg"></p>
            <div class="modal-footer">
                <button class="delete-btn action-btn" onclick="confirmDelete()">Delete</button>
                <button class="action-btn" onclick="closeModal('delete-modal')">Cancel</button>
            </div>
        </div>
    </div>
    

    <script>
        // Simulated account data
//         let accounts = [
//             {accountNumber: "1234567890", type: "Savings", balance: 52400.75, status: "Active", nickname: "Main Savings"},
//             {accountNumber: "9876543210", type: "Current", balance: 12000.00, status: "Active", nickname: "Business"},
//             {accountNumber: "1122334455", type: "Salary", balance: 3000.50, status: "Inactive", nickname: "Salary"},
//             {accountNumber: "9988776655", type: "Savings", balance: 1500.00, status: "Closed", nickname: "Old Account"}
//         ];

        let deleteAccountNumber = null;

        // Render account table
        function renderAccounts(accountList = accounts) {
            const tbody = document.querySelector('#accounts-table tbody');
            tbody.innerHTML = '';
            if (accountList.length === 0) {
                tbody.innerHTML = `<tr><td colspan="5" style="text-align:center;">No accounts found.</td></tr>`;
                return;
            }
            accountList.forEach(acc => {
                const row = document.createElement('tr');
                row.innerHTML = `
                    <td>${acc.accountNumber}</td>
                    <td>${acc.type}</td>
                    <td>₹${acc.balance.toLocaleString('en-IN', {minimumFractionDigits:2})}</td>
                    <td>${acc.status}</td>
                    <td>
                        <button class="action-btn view-btn" onclick="viewAccount('${acc.accountNumber}')">View Details</button>
                        <button class="action-btn edit-btn" onclick="editAccount('${acc.accountNumber}')">Edit</button>
                        <button class="action-btn delete-btn" onclick="deleteAccount('${acc.accountNumber}')">Delete</button>
                    </td>
                `;
                tbody.appendChild(row);
            });
        }
        renderAccounts();

        // Search/filter accounts
        function searchAccounts() {
            const query = document.getElementById('search-input').value.toLowerCase();
            const filtered = accounts.filter(acc =>
                acc.accountNumber.includes(query) ||
                acc.type.toLowerCase().includes(query) ||
                acc.status.toLowerCase().includes(query)
            );
            renderAccounts(filtered);
        }

        // View account details
        function viewAccount(accountNumber) {
            const acc = accounts.find(a => a.accountNumber === accountNumber);
            if (!acc) return;
            document.getElementById('view-details').innerHTML = `
                <strong>Account Number:</strong> ${acc.accountNumber}<br>
                <strong>Type:</strong> ${acc.type}<br>
                <strong>Balance:</strong> ₹${acc.balance.toLocaleString('en-IN', {minimumFractionDigits:2})}<br>
                <strong>Status:</strong> ${acc.status}<br>
                <strong>Nickname:</strong> ${acc.nickname || '-'}<br>
            `;
            openModal('view-modal');
        }

        // Edit account
        function editAccount(accountNumber) {
            const acc = accounts.find(a => a.accountNumber === accountNumber);
            if (!acc) return;
            document.getElementById('edit-account-number').value = acc.accountNumber;
            document.getElementById('edit-type').value = acc.type;
            document.getElementById('edit-status').value = acc.status;
            document.getElementById('edit-nickname').value = acc.nickname || '';
            document.getElementById('edit-error').textContent = '';
            openModal('edit-modal');
        }

        document.getElementById('edit-form').onsubmit = function(e) {
            e.preventDefault();
            const accountNumber = document.getElementById('edit-account-number').value;
            const type = document.getElementById('edit-type').value;
            const status = document.getElementById('edit-status').value;
            const nickname = document.getElementById('edit-nickname').value.trim();

            // Validation
            if (!type || !status) {
                document.getElementById('edit-error').textContent = "Please fill in all required fields.";
                return;
            }
            // Update
            const acc = accounts.find(a => a.accountNumber === accountNumber);
            acc.type = type;
            acc.status = status;
            acc.nickname = nickname;
            closeModal('edit-modal');
            renderAccounts();
        };

        // Delete account
        function deleteAccount(accountNumber) {
            deleteAccountNumber = accountNumber;
            const acc = accounts.find(a => a.accountNumber === accountNumber);
            document.getElementById('delete-confirm-msg').textContent = 
                `Are you sure you want to delete/close account "${acc.accountNumber}" (${acc.type})? This action cannot be undone.`;
            openModal('delete-modal');
        }
        function confirmDelete() {
            accounts = accounts.filter(a => a.accountNumber !== deleteAccountNumber);
            closeModal('delete-modal');
            renderAccounts();
        }

        // Add new account
        function openAddModal() {
            document.getElementById('add-form').reset();
            document.getElementById('add-error').textContent = '';
            openModal('add-modal');
        }
        document.getElementById('add-form').onsubmit = function(e) {
            e.preventDefault();
            const accountNumber = document.getElementById('add-account-number').value.trim();
            const type = document.getElementById('add-type').value;
            const balance = parseFloat(document.getElementById('add-balance').value);
            const status = document.getElementById('add-status').value;
            const nickname = document.getElementById('add-nickname').value.trim();

            // Validation
            if (!accountNumber || !type || isNaN(balance) || !status) {
                document.getElementById('add-error').textContent = "Please fill in all required fields.";
                return;
            }
            if (accounts.some(a => a.accountNumber === accountNumber)) {
                document.getElementById('add-error').textContent = "Account number must be unique.";
                return;
            }
            if (!/^\d{8,12}$/.test(accountNumber)) {
                document.getElementById('add-error').textContent = "Account number must be 8-12 digits.";
                return;
            }
            // Add
            accounts.push({
                accountNumber, type, balance, status, nickname
            });
            closeModal('add-modal');
            renderAccounts();
        };

        // Modal helpers
        function openModal(id) {
            document.getElementById(id).style.display = 'block';
        }
        function closeModal(id) {
            document.getElementById(id).style.display = 'none';
        }
        // Close modal on outside click
        window.onclick = function(event) {
            ['view-modal','edit-modal','add-modal','delete-modal'].forEach(id => {
                const modal = document.getElementById(id);
                if (event.target === modal) modal.style.display = "none";
            });
        };
     // For the add-account button
//         function openAddModal() {
//             document.getElementById('add-form').reset();
//             document.getElementById('add-error').textContent = '';
//             openModal('add-modal');
//         }

        
    </script>
</body>
</html>
