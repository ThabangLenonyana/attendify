# Frontend Directory Structure Documentation

## Components Directory

### /auth

- **Login.js**: Handles user authentication and login form
- **Register.js**: New user registration form and validation
- **ForgotPassword.js**: Password recovery workflow

### /student

- **CheckIn.js**: QR/GPS/Button attendance check-in options
- **AttendanceHistory.js**: Student's attendance records view
- **Leaderboard.js**: Gamification rankings and points display
- **RewardStore.js**: Points redemption and rewards catalog

### /teacher

- **QRGenerator.js**: Creates QR codes for class sessions
- **AttendanceMonitor.js**: Real-time class attendance tracking
- **Reports.js**: Attendance analytics and reporting tools

### /admin

- **UserManagement.js**: CRUD operations for user accounts
- **SystemSettings.js**: System configuration and parameters

## Services Directory

### Core Service Files

- **api.js**: Base axios configuration and interceptors
- **auth.js**: Authentication and token management
- **attendance.js**: Attendance API calls and data handling

### Service Module Responsibilities

Each service module handles:

- API endpoint communication
- Data transformation
- Error handling
- Response caching (where applicable)

## Supporting Directories

### /utils

- **constants.js**: System-wide configuration values
- **helpers.js**: Common utility functions

### /routes

- **PrivateRoute.js**: Role-based route protection
- **routes.js**: Application routing configuration

### /context

- **AuthContext.js**: Global authentication state management

### /assets

- **/styles/theme.js**: MaterialUI theme customization

## Layouts Directory

### MainLayout.js

Base layout for authenticated users:

- Includes navigation, header, footer
- Handles responsive design

### AuthLayout.js

Simplified layout for authentication pages:

- Centers content and displays branding
- No navigation elements
