<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>E-Bank</title>i 
  <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
  <script src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js" defer></script>
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
  <!-- Hero Section Start -->
  
<section x-data="{
  slides: [
      {
          image : src='./images/OnlineBanking.jpg',
          headline: 'Welcome to E-Bank',
          subtext: 'Your Trusted Sri Lankan Online Banking Partner',
          cta: { text: 'Open an Account', icon: 'fa-user-plus', href: '#' }
      },
      {
          image:  'images/Secure.jpg',
          headline: 'Bank Anytime, Anywhere',
          subtext: 'Experience secure digital banking at your fingertips.',
          cta: { text: 'Login', icon: 'fa-sign-in-alt', href: '#' }
      },
      {
          image: 'images/Onlinebanking2.jpg',
          headline: 'Fast Payments & Bill Settlements',
          subtext: 'Pay bills and transfer funds instantly with E-Bank.',
          cta: { text: 'Learn More', icon: 'fa-info-circle', href: '#' }
      }
  ],
  active: 0,
  interval: null,
  startSlider() {
      this.interval = setInterval(() => {
          this.active = (this.active + 1) % this.slides.length;
      }, 5000);
  },
  stopSlider() { clearInterval(this.interval); }
}"
x-init="startSlider"
class="relative w-full h-[440px] md:h-[420px] overflow-hidden"
>
  <!-- Slides -->
  <template x-for="(slide, idx) in slides" :key="idx">
      <div x-show="active === idx" x-transition:enter="transition-opacity duration-700"
           x-transition:enter-start="opacity-0" x-transition:enter-end="opacity-100"
           class="absolute inset-0 w-full h-full">
          <img :src="slide.image" alt="" class="w-full h-full object-cover object-center brightness-75">
          <!-- Text overlay -->
          <div class="absolute top-0 left-0 h-full flex items-center"
               style="padding-left:24px; max-width: 600px;">
              <div class="bg-white bg-opacity-80 rounded-lg shadow-lg p-7 md:p-8">
                  <h1 class="text-3xl md:text-4xl font-bold text-blue-900 mb-2 flex items-center">
                      <i class="fas fa-university text-yellow-400 mr-3"></i>
                      <span x-text="slide.headline"></span>
                  </h1>
                  <p class="text-lg md:text-xl text-blue-800 mb-6" x-text="slide.subtext"></p>
                  <a :href="slide.cta.href"
                     class="inline-flex items-center px-5 py-2.5 bg-blue-700 hover:bg-blue-900 text-white font-semibold rounded shadow transition"
                  >
                      <i :class="'fas ' + slide.cta.icon + ' mr-2'"></i>
                      <span x-text="slide.cta.text"></span>
                  </a>
              </div>
          </div>
      </div>
  </template>
  <!-- Slide controls -->
  <div class="absolute bottom-6 left-8 flex space-x-2 z-10">
      <template x-for="(slide, idx) in slides" :key="idx">
          <button @click="active = idx"
              :class="active === idx ? 'bg-yellow-400' : 'bg-white bg-opacity-70'"
              class="w-3 h-3 rounded-full border border-blue-800 transition"></button>
      </template>
  </div>
  <!-- Prev/Next buttons -->
  <button @click="active = (active-1+slides.length)%slides.length" @mouseover="stopSlider" @mouseleave="startSlider"
      class="absolute left-4 top-1/2 -translate-y-1/2 bg-white bg-opacity-80 hover:bg-yellow-400 text-blue-900 rounded-full w-10 h-10 flex items-center justify-center shadow-md z-10 transition"
      aria-label="Previous">
      <i class="fas fa-chevron-left"></i>
  </button>
  <button @click="active = (active+1)%slides.length" @mouseover="stopSlider" @mouseleave="startSlider"
      class="absolute right-4 top-1/2 -translate-y-1/2 bg-white bg-opacity-80 hover:bg-yellow-400 text-blue-900 rounded-full w-10 h-10 flex items-center justify-center shadow-md z-10 transition"
      aria-label="Next">
      <i class="fas fa-chevron-right"></i>
  </button>
</section>
<!-- Hero Section End -->

<!--KEy feature-->
<section class="max-w-6xl mx-auto px-4 py-12">
  <h2 class="text-3xl font-bold text-blue-900 mb-10 text-center">Our Key Services</h2>
  <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-8">
    <!-- Account Management -->
    <div class="bg-white rounded-xl shadow-md hover:shadow-xl transition p-8 flex flex-col items-center text-center">
      <div class="text-blue-700 text-4xl mb-4">
        <i class="fas fa-user-cog"></i>
      </div>
      <h3 class="font-semibold text-xl mb-2">Account Management</h3>
      <p class="text-gray-600">Easily view, update, or manage all your bank accounts in one place.</p>
    </div>
    <!-- Money Transfer -->
    <div class="bg-white rounded-xl shadow-md hover:shadow-xl transition p-8 flex flex-col items-center text-center">
      <div class="text-green-600 text-4xl mb-4">
        <i class="fas fa-exchange-alt"></i>
      </div>
      <h3 class="font-semibold text-xl mb-2">Money Transfer</h3>
      <p class="text-gray-600">Transfer funds securely between your accounts or to others instantly.</p>
    </div>
    <!-- Bill Payments -->
    <div class="bg-white rounded-xl shadow-md hover:shadow-xl transition p-8 flex flex-col items-center text-center">
      <div class="text-yellow-500 text-4xl mb-4">
        <i class="fas fa-file-invoice-dollar"></i>
      </div>
      <h3 class="font-semibold text-xl mb-2">Bill Payments</h3>
      <p class="text-gray-600">Pay your utility and service bills quickly and conveniently online.</p>
    </div>
    <!-- Fixed Deposits -->
    <div class="bg-white rounded-xl shadow-md hover:shadow-xl transition p-8 flex flex-col items-center text-center">
      <div class="text-purple-600 text-4xl mb-4">
        <i class="fas fa-piggy-bank"></i>
      </div>
      <h3 class="font-semibold text-xl mb-2">Fixed Deposits</h3>
      <p class="text-gray-600">Open and manage fixed deposits for secure and rewarding savings.</p>
    </div>
    <!-- Mobile Banking -->
    <div class="bg-white rounded-xl shadow-md hover:shadow-xl transition p-8 flex flex-col items-center text-center">
      <div class="text-pink-600 text-4xl mb-4">
        <i class="fas fa-mobile-alt"></i>
      </div>
      <h3 class="font-semibold text-xl mb-2">Mobile Banking</h3>
      <p class="text-gray-600">Bank on the go with our easy-to-use and secure mobile app.</p>
    </div>
    <!-- 24/7 Support -->
    <div class="bg-white rounded-xl shadow-md hover:shadow-xl transition p-8 flex flex-col items-center text-center">
      <div class="text-red-500 text-4xl mb-4">
        <i class="fas fa-headset"></i>
      </div>
      <h3 class="font-semibold text-xl mb-2">24/7 Support</h3>
      <p class="text-gray-600">Get help anytime with our dedicated round-the-clock customer support.</p>
    </div>
  </div>
</section>
<!--KEy feature end-->
<!-- About Us Section Start -->
<section class="max-w-6xl mx-auto my-12 px-4">
  <div class="bg-blue-50 rounded-2xl shadow-md flex flex-col md:flex-row items-center md:items-stretch overflow-hidden">
    <!-- Text Column -->
    <div class="md:w-1/2 p-8 flex flex-col justify-center">
      <h2 class="text-3xl font-bold text-blue-900 mb-4">About E-Bank</h2>
      <p class="text-gray-700 mb-4 text-lg">
        <span class="font-semibold text-blue-800">E-Bank</span> is Sri Lanka’s leading digital banking platform, dedicated to making financial services simple, secure, and accessible for everyone. 
      </p>
      <p class="text-gray-700 mb-4">
        <span class="font-semibold">Our Mission:</span> To empower Sri Lankans with innovative, user-friendly banking solutions that fit modern lifestyles-anytime, anywhere.
      </p>
      <p class="text-gray-700">
        <span class="font-semibold">What makes us unique?</span> E-Bank offers 24/7 online banking in Sinhala, Tamil, and English, instant local transfers, bill payments, and personalized support. We’re committed to digital security, financial inclusion, and bringing the future of banking to every corner of Sri Lanka.
      </p>
    </div>
    <!-- Image Column -->
    <div class="md:w-1/2 flex items-center justify-center bg-blue-100">
      <img src="images/2nd.jpg"
           alt="Sri Lankan digital banking"
           class="w-full h-72 object-cover md:rounded-l-none rounded-b-2xl md:rounded-r-2xl shadow-lg">
    </div>
  </div>
</section>
<!-- About Us Section End -->

<!-- Security & Trust Badges Section Start -->
<section class="max-w-4xl mx-auto my-12 px-4">
  <div class="bg-blue-50 rounded-2xl shadow-md p-8">
    <h2 class="text-2xl font-bold text-blue-900 mb-2 text-center">Your Security is Our Priority</h2>
    <p class="text-blue-800 mb-8 text-center text-lg">
      Your data is encrypted and protected by bank-grade security.
    </p>
    <div class="flex flex-wrap justify-center gap-6">
      <!-- SSL Secured -->
      <div class="flex flex-col items-center bg-white rounded-xl shadow p-5 w-44 mb-3">
        <span class="text-green-600 text-3xl mb-2">
          <i class="fas fa-lock"></i>
        </span>
        <span class="font-semibold text-blue-900 mb-1">SSL Secured</span>
        <span class="text-gray-600 text-sm text-center">All connections are protected by SSL certificates.</span>
      </div>
      <!-- Encrypted Data -->
      <div class="flex flex-col items-center bg-white rounded-xl shadow p-5 w-44 mb-3">
        <span class="text-blue-700 text-3xl mb-2">
          <i class="fas fa-shield-alt"></i>
        </span>
        <span class="font-semibold text-blue-900 mb-1">Encrypted Data</span>
        <span class="text-gray-600 text-sm text-center">Your personal and financial data is fully encrypted.</span>
      </div>
      <!-- Verified by Central Bank -->
      <div class="flex flex-col items-center bg-white rounded-xl shadow p-5 w-44 mb-3">
        <span class="text-yellow-500 text-3xl mb-2">
          <i class="fas fa-certificate"></i>
        </span>
        <span class="font-semibold text-blue-900 mb-1">Central Bank Verified</span>
        <span class="text-gray-600 text-sm text-center">Licensed and regulated by the Central Bank of Sri Lanka.</span>
      </div>
      <!-- Privacy Guaranteed -->
      <div class="flex flex-col items-center bg-white rounded-xl shadow p-5 w-44 mb-3">
        <span class="text-purple-600 text-3xl mb-2">
          <i class="fas fa-user-shield"></i>
        </span>
        <span class="font-semibold text-blue-900 mb-1">Privacy Guaranteed</span>
        <span class="text-gray-600 text-sm text-center">We never share your data without your consent.</span>
      </div>
    </div>
  </div>
</section>
<!-- Security & Trust Badges Section End -->
<!-- Promotional Banners / News Section Start -->
<section class="max-w-6xl mx-auto px-4 py-10">
  <h2 class="text-2xl md:text-3xl font-bold text-blue-900 mb-7 text-center">Latest News & Offers</h2>
  <div class="flex space-x-6 overflow-x-auto pb-4 md:grid md:grid-cols-3 md:space-x-0 md:gap-6">
    <!-- Banner 1 -->
    <div class="min-w-[290px] bg-gradient-to-br from-blue-600 to-blue-400 text-white rounded-xl shadow-lg p-7 flex flex-col justify-between hover:scale-105 transition-transform duration-200">
      <div>
        <h3 class="text-xl font-bold mb-2 flex items-center">
          <i class="fas fa-mobile-alt mr-2"></i> New Mobile App Launched!
        </h3>
        <p class="mb-4">Experience banking on the go with our brand new E-Bank mobile app. Fast, secure, and in your language.</p>
      </div>
      <a href="#" class="inline-block mt-2 text-blue-100 underline hover:text-yellow-300 font-semibold transition">
        Learn More <i class="fas fa-arrow-right ml-1"></i>
      </a>
    </div>
    <!-- Banner 2 -->
    <div class="min-w-[290px] bg-gradient-to-br from-yellow-400 to-yellow-300 text-yellow-900 rounded-xl shadow-lg p-7 flex flex-col justify-between hover:scale-105 transition-transform duration-200">
      <div>
        <h3 class="text-xl font-bold mb-2 flex items-center">
          <i class="fas fa-piggy-bank mr-2"></i> Special FD Rates for Students
        </h3>
        <p class="mb-4">Open a fixed deposit as a student and enjoy exclusive higher interest rates. Secure your future today!</p>
      </div>
      <a href="#" class="inline-block mt-2 text-yellow-800 underline hover:text-blue-900 font-semibold transition">
        Learn More <i class="fas fa-arrow-right ml-1"></i>
      </a>
    </div>
    <!-- Banner 3 -->
    <div class="min-w-[290px] bg-gradient-to-br from-green-500 to-green-400 text-white rounded-xl shadow-lg p-7 flex flex-col justify-between hover:scale-105 transition-transform duration-200">
      <div>
        <h3 class="text-xl font-bold mb-2 flex items-center">
          <i class="fas fa-gift mr-2"></i> Refer & Earn Rewards
        </h3>
        <p class="mb-4">Invite friends to E-Bank and earn exciting rewards for every successful referral. Share the benefits!</p>
      </div>
      <a href="#" class="inline-block mt-2 text-green-100 underline hover:text-yellow-300 font-semibold transition">
        Learn More <i class="fas fa-arrow-right ml-1"></i>
      </a>
    </div>
  </div>
</section>
<!-- Promotional Banners / News Section End -->
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
    // Mobile menu toggle
    const btn = document.getElementById('mobile-menu-btn');
    const menu = document.getElementById('mobile-menu');
    btn.addEventListener('click', () => {
      menu.classList.toggle('hidden');
    });
  </script>
</body>
</html>