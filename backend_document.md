# Attendify Backend Guide

## Table of Contents
- [Introduction](#introduction)
- [Authentication and Authorization](#authentication-and-authorization)
  - [User Registration](#user-registration)
  - [User Login](#user-login)
  - [Email Verification](#email-verification)
  - [Password Reset](#password-reset)
  - [Role-Based Access Control (RBAC)](#role-based-access-control-rbac)
- [API Endpoints](#api-endpoints)
- [Database Schema](#database-schema)


## Introduction
Attendify is a comprehensive web attendance system designed specifically for FMTALI/Afrika Tikkun, which integrates gamification features to enhance user engagement. The primary goal of Attendify is to streamline the attendance tracking process while encouraging consistent attendance through a reward system.

## Authentication and Authorization

### User Registration
- **Endpoint**: `/api/auth/register/`
- **Method**: `POST`
- **Description**: Allows new users to register by providing their email, password, and other necessary details.
- **Payload**:
  ```json
  {
    "email": "user@example.com",
    "password": "securepassword",
    "first_name": "John",
    "last_name": "Doe",
    "age": 20,
    "gender": "Male",
    "phone_number": "123-456-7890",
    "address": "123 Street, City, Country",
    "date_of_birth": "2000-01-01"
  }

### User Login
  - **Endpoint**: `/api/auth/login/`
  - **Method**: `POST`
  - **Description**: Authenticates users by verifying their email and password.ir email, password, and other necessary details.
  - **Payload**:
    ```json
     {
      "email": "user@example.com",
      "password": "securepassword"
    }

### Email Verification
  - **Endpoint**: `/api/auth/verify-email/`
  - **Method**: `POST`
  - **Description**: Sends a verification email to the user after registration.
  - **Payload**:
    ```json
    {
      "email": "user@example.com"
    }
  

### Password Reset
  - **Endpoint**: `/api/auth/reset-password/`
  - **Method**: `POST`
  - **Description**: Allows users to reset their password by providing their email..
  - **Payload**:
    ```json
    {
      "email": "user@example.com"
    }

### Role-Based Access Control (RBAC)
  - **Description**: `Users are assigned roles (Student, Teacher, Admin) that determine their access levels and permissions within the system.`
  - **roles**:
      - **Student**: `Can check-in, view personal attendance records, and participate in gamification.`
      - **Teacher**: `Can generate QR codes, monitor attendance, and access analytics.`
      - **Admin**:  `Can manage users, configure system settings, and access global analytics.`
