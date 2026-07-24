#  Asset Management System (JSP • Servlet • JDBC)

# About the Project

The **Asset Management System** is a Java-based web application developed as part of my MCA learning journey. The project is designed to manage organizational assets through a simple and user-friendly web interface. It demonstrates how Java web technologies can be used to build a complete CRUD-based application with user authentication and database connectivity.

This project helped me gain practical experience in developing dynamic web applications using **JSP, Servlets, JDBC, MySQL, and Apache Tomcat** while following the MVC architecture.

# Features

*  User Registration
*  User Login & Authentication
*  Dashboard
*  Add New Asset
*  View All Assets
*  Update Asset Information
*  Delete Asset
*  Export Asset Data to Excel
*  Logout
*  MySQL Database Integration
*  Session Management

# Technologies Used

| Technology      | Purpose                 |
| --------------- | ----------------------- |
| Java            | Backend Development     |
| JSP             | View Layer              |
| Servlet         | Controller Layer        |
| JDBC            | Database Connectivity   |
| MySQL           | Database                |
| HTML5           | Web Pages               |
| CSS3            | Styling                 |
| Bootstrap       | Responsive UI           |
| Apache Tomcat 9 | Web Server              |
| Maven           | Dependency Management   |
| Eclipse IDE     | Development Environment |

# Project Architecture

Browser
    │
    ▼
JSP Pages
    │
    ▼
Servlet Controller
    │
    ▼
JDBC
    │
    ▼
MySQL Database

The project follows the **MVC (Model–View–Controller)** design pattern to separate business logic, presentation, and database operations.

# Project Structure

Asset-Management-System
│
├── src/main/java
│   ├── controller
│   ├── dao
│   └── model
│
├── src/main/webapp
│   ├── CSS
│   ├── Images
│   ├── JSP Pages
│   └── WEB-INF
│
├── pom.xml
└── README.md

# Modules

# Authentication Module

* User Registration
* User Login
* Logout
* Session Handling

# Asset Management Module

* Add Asset
* View Assets
* Update Asset
* Delete Asset

# Dashboard Module

* Display asset information
* Easy navigation

# Export Module

* Export asset details into an Excel file

# How to Run

1. Clone this repository.
2. Import it as a Maven Project in Eclipse.
3. Configure MySQL database credentials in the database connection file.
4. Create the required database and tables.
5. Run **Maven Build** (`clean install`).
6. Deploy the project on **Apache Tomcat 9**.
7. Open the application in your browser.
   
# What I Learned

While developing this project, I learned:

* Java Web Development
* JSP & Servlet Programming
* JDBC with MySQL
* MVC Architecture
* Session Management
* CRUD Operations
* Maven Project Management
* Deploying Applications on Apache Tomcat
* Building Dynamic Web Applications

# Future Enhancements

* Role-Based Authentication (Admin/User)
* Asset Categories
* Asset Search & Filter
* QR Code Generation
* Asset Reports & Analytics
* Email Notifications
* Spring Boot Migration
* REST API Integration

# Developer

**Shubham Santosh Gangurde**

**MCA Student**
Java Full Stack Developer (Learning)

GitHub: **https://github.com/shubhamgangurde58**

# Note

This project was developed as part of my MCA learning to gain hands-on experience with Java Enterprise technologies. It reflects my understanding of Java web development, database connectivity, and CRUD-based application design.

If you found this project useful, please consider giving it a **Star** on GitHub.
