# Attendify - Attendance Web App

Web Attendance System with Gamification Features for FMTALI/Afrika Tikkun.

## Table of Contents

- [Introduction](#introduction)
- [Features](#features)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Backend Installation](#backend-installation)
  - [Frontend Installation](#frontend-installation)
- [Usage](#usage)
- [Folder Structure](#folder-structure)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

## Introduction

Attendify is a comprehensive web attendance system designed specifically for FMTALI/Afrika Tikkun, which integrates gamification features to enhance user engagement. The primary goal of Attendify is to streamline the attendance tracking process for educational institutions, providing a seamless and efficient way for students to check in via GPS, QR codes, or manual buttons. Teachers can monitor attendance in real-time, and the platform includes gamification elements such as points, badges, and leaderboards to motivate students. Additionally, Attendify offers detailed attendance analytics and reports, supporting both Android, iOS, and Web platforms. This system aims to modernize attendance management while fostering a more interactive and engaging learning environment.

## Features

- Student check-in via GPS, QR code, or manual button
- Real-time attendance tracking for teachers
- Gamification elements (points, badges, leaderboards)
- Attendance analytics and reports
- Cross-platform support (Android, iOS, Web)

## Getting Started

### Prerequisites

- Python 3.x
- Node.js and npm
- Django and Django REST Framework
- React
- IDE (VS Code, PyCharm)
- Azure Cloud Account

### Backend Installation

1. **Clone the repository:**

   ```bash
   git clone https://github.com/yourusername/attendance-gamification-app.git
   ```

2. **Navigate to the backend directory:**

  ```bash
  cd attendance-gamification-app/backend
  ```

3. **Create a virtual environment and activate it:**

  ```bash
  python -m venv venv
  source venv/bin/activate  # On Windows use `venv\Scripts\activate`
  ```

4. **Install the required packages:**

  ```bash
  pip install -r requirements.txt
  ```

5. **Apply migrations and start the Django server:**

  ```bash
  python manage.py migrate
  python manage.py runserver
  ```

5. **Frontend Installation
Navigate to the frontend directory:**

  ```bash
  cd ../frontend
  ```

6. **Install the required packages:**

  ```bash
  npm install
  ```

7. **Start the React development server:**

   ```bash
   npm start
   ```
    
## Folder Structure
Outline the structure of your project, including an explanation of the contents of each folder.

## Contributing
Explain how other developers can contribute to your project.

## License
Specify the license under which your project is distributed.

## Contact
Provide contact information for people who want to get in touch with you regarding the project.
