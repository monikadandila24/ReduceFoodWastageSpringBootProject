<%@page import="com.klef.jfsd.springboot.model.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%
    Customer c = (Customer) session.getAttribute("customer");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Dashboard - SDP Project</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="icon" href="${pageContext.request.contextPath}/images/logo.png" sizes="32x32">
    <style>
        /* Styling (unchanged) */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f7f9fc;
            color: #333;
            display: flex;
            height: 100vh;
            overflow: hidden;
        }

        .navbar {
            width: 240px;
            background-color: #2c3e50;
            color: white;
            padding: 20px;
            position: fixed;
            height: 100vh;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
        }

        .navbar h1 {
            text-align: center;
            font-size: 24px;
            margin-bottom: 25px;
            font-weight: bold;
            letter-spacing: 1px;
        }

        .navbar ul {
            list-style-type: none;
            padding: 0;
        }

        .navbar ul li {
            margin: 15px 0;
        }

        .navbar ul li a {
            color: white;
            text-decoration: none;
            padding: 10px 20px;
            display: flex;
            align-items: center;
            border-radius: 4px;
            transition: background 0.3s, transform 0.3s;
            font-size: 16px;
        }

        .navbar ul li a:hover {
            background-color: #34495e;
            transform: translateX(5px);
        }

        .navbar ul li a i {
            margin-right: 12px;
            font-size: 20px;
            color: #f7f9f9;
            transition: color 0.3s;
        }

        .navbar ul li a:hover i {
            color: #c0d9e7;
        }

        .profile-container {
            position: absolute;
            top: 20px;
            right: 20px;
            display: flex;
            align-items: center;
            cursor: pointer;
            color: #333;
        }

        .profile-container img {
            border-radius: 50%;
            width: 40px;
            height: 40px;
            margin-right: 10px;
            border: 2px solid #2c3e50;
        }

        .dropdown {
            position: relative;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            right: 0;
            background-color: white;
            min-width: 150px;
            border: 1px solid #ddd;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            z-index: 1;
        }

        .dropdown-content a {
            color: #333;
            padding: 10px;
            text-decoration: none;
            display: block;
        }

        .dropdown-content a:hover {
            background-color: #f0f4f8;
        }

        .profile-container:hover .dropdown-content {
            display: block;
        }

        .content {
            margin-left: 260px;
            padding: 30px;
            width: calc(100% - 260px);
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .welcome-container {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
            width: 100%;
            max-width: 600px;
        }

        .welcome-container h2 {
            font-size: 2em;
            color: #34495e;
            margin-bottom: 10px;
            font-weight: bold;
        }

        .welcome-container p {
            font-size: 1.1em;
            color: #777;
            margin-bottom: 20px;
        }

        .welcome-container .btn {
            background-color: #3498db;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            font-size: 1em;
            font-weight: bold;
            text-decoration: none;
            cursor: pointer;
            transition: background 0.3s;
        }

        .welcome-container .btn:hover {
            background-color: #2d7aa8;
        }

        .contact-us {
            position: absolute;
            bottom: 20px;
            right: 20px;
            display: flex;
            align-items: center;
            background-color: #ffffff;
            padding: 10px 20px;
            border-radius: 50px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
            cursor: pointer;
            transition: box-shadow 0.3s;
            color: #333;
            font-weight: bold;
        }

        .contact-us img {
            border-radius: 50%;
            width: 30px;
            height: 30px;
            margin-right: 10px;
        }

        .contact-us:hover {
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.25);
        }
    </style>
</head>
<body>
    <!-- Sidebar Navbar -->
    <div class="navbar">
        <h1>AnnapoornaSeva</h1>
        <ul>
            <li><a href="customerhome"><i class="fas fa-home"></i> Home</a></li>
            <li><a href="customerprofile"><i class="fas fa-user"></i> Profile</a></li>
            <li><a href="#"><i class="fas fa-shopping-cart"></i> My Orders</a></li>
            <li><a href="tracking"><i class="fas fa-truck"></i> Track Orders</a></li>
            <li><a href="logout"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
        </ul>
    </div>

    <div class="profile-container">
        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDGQO5-8CPA9Hzl5_wLkAf6VtlMw52q7IwRw&s" alt="Profile Picture">
        <span>Welcome, <%= c.getName() %></span>
    </div>

    <!-- Main Content -->
    <div class="content">
        <div class="welcome-container">
            <h2>Welcome, <%= c.getName() %>!</h2>
            <p>Thank you for being a valued customer of AnnapoornaSeva. Explore our services and offers!</p>
            <a href="viewalldonations" class="btn">Start Shopping</a>
        </div>
    </div>

    <!-- Contact Us Button -->
    <div class="contact-us">
        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDGQO5-8CPA9Hzl5_wLkAf6VtlMw52q7IwRw&s" alt="Contact">
        <a href="customercontactus">CONTACT US</a>
    </div>
</body>
</html>