# Attendify Backend Guide

## Table of Contents
- [Introduction](#introduction)
- [Authentication and Authorization](#authentication-and-authorization)
  - [User Registration](#user-registration)
  - [User Login](#user-login)
  - [Email Verification](#email-verification)
  - [Password Reset](#password-reset)
  - [OAuth using Google](#OAuth-using-Google)
  - [JWT Authentication](#JWT-Authentication)
  - [Role-Based Access Control (RBAC)](#role-based-access-control-rbac)
- [Attendance Tracking](#attendance-tracking)
  - [GPS Checking](#Check-in-via-GPS)
  - [QR Code Checking](#Check-in-via-qr-code)
  - [manual Checking](#manual-checking)
  - [Checking Out](Checking-Out)
- [teacher](#teacher)
  - [Monitor](#monitor)
  - [editing attendance](editing-attendance)
  - [Generating QR](#Generating-QR)
- [Attendance Analytics and Reporting](#Attendance-Analytics-and-Reporting)
  - [Get Attendance Data](#Get-Attendance-Data)
  - [Generate Attendance Report](#Generate-Attendance-Report)
- [Gamification Features](#Gamification-Features)
  - [Points System](#Points-System)
  - [Badges System](#Badges-System)
  - [Leaderboard](#Leaderboard)
- [Push Notification Service](#Push-Notification-Service)
  - [Notification Service](#Notification-Service)
  - [Notification Triggers](#Notification-Triggers)
- [Administrative Functions](#Administrative-Functions)
  - [User Management](#User-Management)
  - [System Settings Management](#System-Settings-Management)


## Introduction
This document provides a comprehensive guide to the backend of Attendify, a Web attendance system with gamification features designed for FMTALI/Afrika Tikkun Services. It details the API endpoints, authentication methods, attendance tracking mechanisms, real-time monitoring, analytics and reporting, gamification features, push notification services, and administrative functions. The goal is to help developers understand and manage the backend functionalities efficiently.

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
  - **Description**: Allows users to reset their password by providing their email.
  - **Payload**:
    ```json
    {
      "email": "user@example.com"
    }

### OAuth using Google
  - **Endpoint**: `/api/auth/oauth/google/`
  - **Method**: `GET`
  - **Description**: `Redirects users to Google for OAuth authentication and retrieves user information.`
  - **Payload**:
    ```json
    {
      "client_id": "YOUR_CLIENT_ID.apps.googleusercontent.com",
      "client_secret": "YOUR_CLIENT_SECRET",
      "redirect_uris": [
        "YOUR_REDIRECT_URI"
      ],
      "auth_uri": "https://accounts.google.com/o/oauth2/auth",
      "token_uri": "https://oauth2.googleapis.com/token",
      "userinfo_uri": "https://openidconnect.googleapis.com/v1/userinfo",
      "scope": "https://www.googleapis.com/auth/userinfo.profile https://www.googleapis.com/auth/userinfo.email",
      "response_type": "code"
    }

### JWT Authentication
  - **Endpoint**: `/api/auth/token/`
  - **Method**: `POST`
  - **Description**: Generates a JWT token for authenticated users.
  - **Payload**:
    ```json
    {
      "email": "user@example.com",
      "password": "securepassword"
    }
  - **Response**:
    ```json
    {
      "access": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9...",
      "refresh": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9..."
    }

### Role-Based Access Control (RBAC)
  - **Description**: `Users are assigned roles (Student, Teacher, Admin) that determine their access levels and permissions within the system.`
  - **roles**:
      - **Student**: `Can check-in, view personal attendance records, and participate in gamification.`
      - **Teacher**: `Can generate QR codes, monitor attendance, and access analytics.`
      - **Admin**:  `Can manage users, configure system settings, and access global analytics.`

## Attendance Tracking

### Check in via GPS
  - **Endpoint**: `/api/attendance/check-in/gps/`
  - **Method**: `POST`
  - **Description**: Allows users to check-in using their GPS location.`
  - **Payload**:
    ```json
    {
      "user_id": 1,
      "latitude": -26.2041,
      "longitude": 28.0473
    }

### Check in via QR
  - **Endpoint**: `/api/attendance/check-in/qr/`
  - **Method**: `POST`
  - **Description**:`Allows users to check-in by scanning a QR code.`
  - **Payload**:
    ```json
    {
      "user_id": 1,
      "qr_code": "sample-qr-code-data"
    }

### manual checking
  - **Endpoint**: `/api/attendance/check-in/manual/`
  - **Method**: `POST`
  - **Description**:`Allows users to check-in manually by pressing a button.`
  - **Payload**:
    ```json
    {
      "user_id": 1
    }

### Checking Out
  - **Endpoint**: `/api/attendance/check-out/`
  - **Method**: `POST`
  - **Description**:`Allows users to check-out of the system using their user ID.`
  - **Payload**:
    ```json
    {
      "status": "success",
      "data": [
        {
          "user_id": 1,
          "name": "John Doe",
          "check_in_time": "2025-01-19T06:56:41Z",
          "status": "Present"
        },
        {
          "user_id": 2,
          "name": "Jane Doe",
          "check_in_time": "2025-01-19T06:58:41Z",
          "status": "Late"
        }
      ]
    }

## teachers

### Monitor
  - **Endpoint**: `/api/teacher/attendance/monitor`
  - **Method**: `GET`
  - **Description**:`Fetches real-time attendance data for teachers to monitor.`
  - **Payload**:
    ```json
    {
      "status": "success",
      "data": [
        {
          "user_id": 1,
          "name": "John Doe",
          "check_in_time": "2025-01-19T06:56:41Z",
          "status": "Present"
        },
        {
          "user_id": 2,
          "name": "Jane Doe",
          "check_in_time": "2025-01-19T06:58:41Z",
          "status": "Late"
        }
      ]
    }

### editing attendance
  - **Endpoint**: `/api/teacher/attendance/edit/`
  - **Method**: `PUT`
  - **Description**:`Allows teachers to manually alter attendance records`
  - **Payload**:
    ```json
    {
      "attendance_id": 1,
      "user_id": 1,
      "check_in_time": "2025-01-19T06:56:41Z",
      "check_out_time": "2025-01-19T14:56:41Z",
      "status": "Present"
    }

### Generating QR
  - **Endpoint**: `/api/teacher/attendance/generate-qr`
  - **Method**: `POST`
  - **Description**:`Allows teachers to generate QR codes for attendance.`
  - **Payload**:
    ```json
    {
      "status": "success",
      "qr_code_url": "http://example.com/qrcode.png"
    }
    
## Attendance Analytics and Reporting

### Get Attendance Data
  - **Endpoint**: `/api/attendance`
  - **Method**: `GET`
  - **Description**: `Retrieve attendance records with filtering options.`
  - **Query Parameters**:
      - **user_id (optional)**: `Filter by user ID`
      - **status (optional)**: `Filter by attendance status (e.g., Present, Absent, Late).`
      - **date (optional)**:  `Filter by specific date or date range.`
  - **Payload**:
    ```json
      {
        "status": "success",
        "data": [
          {
            "id": 1,
            "user_id": 1,
            "check_in_time": "2025-01-19T06:56:41Z",
            "check_out_time": "2025-01-19T14:56:41Z",
            "status": "Present",
            "user": {
              "id": 1,
              "first_name": "John",
              "last_name": "Doe",
              "email": "john.doe@example.com"
            }
          },
          {
            "id": 2,
            "user_id": 2,
            "check_in_time": "2025-01-19T07:02:13Z",
            "check_out_time": "2025-01-19T15:02:13Z",
            "status": "Late",
            "user": {
              "id": 2,
              "first_name": "Jane",
              "last_name": "Doe",
              "email": "jane.doe@example.com"
            }
          }
        ]
      }

### Generate Attendance Report
  - **Endpoint**: `/api/attendance/report`
  - **Method**: `POST`
  - **Description**: `Generate attendance reports based on given criteria.`
  - **Payload**:
    ```json
    {
      "status": "success",
      "report": {
        "start_date": "2025-01-01T00:00:00Z",
        "end_date": "2025-01-19T23:59:59Z",
        "total_days": 19,
        "total_present": 15,
        "total_absent": 2,
        "total_late": 2,
        "attendance_records": [
          {
            "id": 1,
            "user_id": 1,
            "check_in_time": "2025-01-19T06:56:41Z",
            "check_out_time": "2025-01-19T14:56:41Z",
            "status": "Present",
            "user": {
              "id": 1,
              "first_name": "John",
              "last_name": "Doe",
              "email": "john.doe@example.com"
            }
          },
          {
            "id": 2,
            "user_id": 2,
            "check_in_time": "2025-01-19T07:02:13Z",
            "check_out_time": "2025-01-19T15:02:13Z",
            "status": "Late",
            "user": {
              "id": 2,
              "first_name": "Jane",
              "last_name": "Doe",
              "email": "jane.doe@example.com"
            }
          }
        ]
      }
    }

## Gamification Features

### Points System
  - **Endpoint**: `/api/gamification/award_points`
  - **Method**: `POST`
  - **Description**: `Award points to users based on their attendance.`
  - **Payload**:
    ```json
    {
      "user_id": 1,
      "points": 10
    }
    
### Badges System
  - **Endpoint**: `/api/gamification/award_badge`
  - **Method**: `POST`
  - **Description**: `Award badges to users for specific achievements.`
  - **Payload**:
    ```json
    {
      "user_id": 1,
      "badge": "Perfect Attendance"
    }

### Leaderboard
  - **Endpoint**: `/api/gamification/leaderboard`
  - **Method**: `GET`
  - **Description**: `Retrieve the current leaderboard.`
  - **Payload**:
    ```json
    {
      "status": "success",
      "leaderboard": [
        {
          "user_id": 1,
          "name": "John Doe",
          "points": 150,
          "rank": 1
        },
        {
          "user_id": 2,
          "name": "Jane Doe",
          "points": 140,
          "rank": 2
        }
      ]
    }

## Push Notification Service

### Notification Service
  - **Endpoint**: `/api/notifications/send/`
  - **Method**: `POST`
  - **Description**: `Award points to users based on their attendance.`
  - **Payload**:
    ```json
    {
      "title": "Notification Title",
      "message": "Notification Message",
      "recipient_id": 1
    }
    
### Notification Triggers
  - **Student Check-In and Check-out Notification**
      - **Description**:  `Sends a notification to the teacher when a student checks in or checks out.`
  - **Gamification Notifications**
      - **Description**: `Sends notifications to students when they receive points, rewards, badges, or when their leaderboard rank changes.`

## Administrative Functions

### User Management
  **Use the Django administration console to manage the Users.**
  
### System Settings Management
  - **Endpoint**: `/api/admin/settings/`
  - **Method**: `GET`
  - **Description**: `Retrieve system settings.`


  - **Endpoint**: `/api/admin/settings/`
  - **Method**: `PUT`
  - **Description**: `Update system settings.
  - **Payload**:
    ```json
    {
      "setting_name": "value"
    }
