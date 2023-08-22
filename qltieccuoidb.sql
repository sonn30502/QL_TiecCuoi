-- MySQL dump 10.13  Distrib 8.0.15, for macos10.14 (x86_64)
--
-- Host: localhost    Database: qltieccuoidb
-- ------------------------------------------------------
-- Server version	8.0.15
ALTER SCHEMA `qltieccuoidb` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ;

CREATE TABLE Branches (
    branchID INT AUTO_INCREMENT PRIMARY KEY,
    branchName VARCHAR(100),
    address VARCHAR(200),
    phoneNumber VARCHAR(20)
);

CREATE TABLE User (
  userID INT AUTO_INCREMENT PRIMARY KEY,
  firstName VARCHAR(100) NOT NULL,
  lastName VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL,
  phoneNumber VARCHAR(20),
  profileImage VARCHAR(200),
  username VARCHAR(45) NOT NULL,
  password VARCHAR(100) NOT NULL,
  userRole VARCHAR(45),
  UNIQUE(email),
  UNIQUE(username)
);

CREATE TABLE Halls (
    hallID INT AUTO_INCREMENT PRIMARY KEY,
    branchID INT,
    hallName VARCHAR(100),
    priceMorning DECIMAL(10, 2),
    priceAfternoon DECIMAL(10, 2),
    priceEvening DECIMAL(10, 2),
    priceWeekend DECIMAL(10, 2),
    FOREIGN KEY (branchID) REFERENCES Branches(branchID)
);

CREATE TABLE Menus (
    menuID INT AUTO_INCREMENT PRIMARY KEY,
    branchID INT,
    menuName VARCHAR(100),
    description TEXT,
    price DECIMAL(10, 2),
    FOREIGN KEY (branchID) REFERENCES Branches(branchID)
);

CREATE TABLE Services (
    serviceID INT AUTO_INCREMENT PRIMARY KEY,
    branchID INT,
    serviceName VARCHAR(100),
    description TEXT,
    price DECIMAL(10, 2),
    FOREIGN KEY (branchID) REFERENCES Branches(branchID)
);

CREATE TABLE Events (
    eventID INT AUTO_INCREMENT PRIMARY KEY,
    branchID INT,
    hallID INT,
    menuID INT,
    serviceID INT,
    userID INT,
    eventDate DATE,
    totalPrice DECIMAL(10, 2),
    status ENUM('Đã xác nhận', 'Chưa xác nhận', 'Đã hủy'),
    FOREIGN KEY (branchID) REFERENCES Branches(branchID),
    FOREIGN KEY (hallID) REFERENCES Halls(hallID),
    FOREIGN KEY (menuID) REFERENCES Menus(menuID),
    FOREIGN KEY (serviceID) REFERENCES Services(serviceID),
    FOREIGN KEY (userID) REFERENCES User(userID)
);

CREATE TABLE Feedbacks (
    feedbackID INT AUTO_INCREMENT PRIMARY KEY,
    eventID INT,
    feedbackDate DATE,
    feedbackContent TEXT,
    rating INT,
    FOREIGN KEY (eventID) REFERENCES Events(eventID)
);

CREATE TABLE Payments (
    paymentID INT AUTO_INCREMENT PRIMARY KEY,
    eventID INT,
    paymentDate DATE,
    paymentMethod ENUM('Trực tiếp', 'Momo', 'ZaloPay'),
    invoiceNumber VARCHAR(100),
    details TEXT,
    FOREIGN KEY (eventID) REFERENCES Events(eventID)
);

CREATE TABLE Statistics (
    statisticID INT AUTO_INCREMENT PRIMARY KEY,
    branchID INT,
    month INT,
    quarter INT,
    year INT,
    eventCount INT,
    revenue DECIMAL(10, 2),
    FOREIGN KEY (branchID) REFERENCES Branches(branchID)
);


