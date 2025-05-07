<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Online Banking System</title>
    <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
  <script src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js" defer></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }
        main {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }
        .login-container {
            background: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            width: 100%;
            max-width: 400px;
        }
        h2 {
            margin-bottom: 20px;
            color: #003366;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        button {
            width: 100%;
            padding: 10px;
            background-color: #0055a5;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
        }
        button:hover {
            background-color: #003366;
        }
        .forgot-password {
            display: block;
            margin-top: 10px;
            text-align: right;
            font-size: 14px;
        }
        .forgot-password a {
            color: #0055a5;
            text-decoration: none;
        }
        .forgot-password a:hover {
            text-decoration: underline;
        }
        .error-message {
            color: red;
            margin-bottom: 15px;
            display: none;
        }
        .security-notice {
            font-size: 12px;
            color: #666;
            margin-top: 15px;
            text-align: center;
        }
    </style>
</head>
<body>
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
        <div class="login-container">
            <h2>Login</h2>
            <div class="error-message" id="error-message">Invalid username or password.</div>
            <form id="login-form">
                <label for="username">Username or Email</label>
                <input type="text" id="username" name="username" placeholder="Enter your username or email" required>

                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="Enter your password" required>

                <button type="submit">Login</button>
            </form>
            <div class="forgot-password">
                <a href="#">Forgot Password?</a>
            </div>
            <div class="security-notice">
                Please ensure your credentials are kept secure.
            </div>
        </div>
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

    <script>
        document.getElementById('login-form').addEventListener('submit', function(event) {
            event.preventDefault();
            const username = document.getElementById('username').value.trim();
            const password = document.getElementById('password').value.trim();
            const errorMessage = document.getElementById('error-message');

            // Basic validation
            if (!username || !password) {
                errorMessage.textContent = 'Please fill in all required fields.';
                errorMessage.style.display = 'block';
                return;
            }

            // Simulate credential validation (replace with real validation logic)
            if (username === 'user' && password === 'password') {
                errorMessage.style.display = 'none';
                alert('Login successful! Redirecting to Dashboard...');
                // Redirect to dashboard page (replace with actual URL)
                window.location.href = '/dashboard.html';
            } else {
                errorMessage.textContent = 'Invalid username or password.';
                errorMessage.style.display = 'block';
            }
        });
    </script>
</body>
</html>
