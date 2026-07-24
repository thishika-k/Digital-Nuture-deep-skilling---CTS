# Python Backend Framework - CTS Deep Skilling

## Overview

This repository contains the implementation of the **Python Backend Framework** module from the CTS Digital Nurture Deep Skilling Program.

Instead of creating a separate Django project for every hands-on, a single Django project was created in **Hands-On 1** and progressively enhanced throughout the remaining hands-ons. This approach avoids code duplication while demonstrating all the required concepts and functionalities.

---

## Project Structure

```
python_backend_framework/
│
├── hands_on_1/
│   ├── backend/          # Complete Django project
│   ├── env/              # Virtual Environment
│   ├── README.md
│   └── output/
│
├── hands_on_2/
│   ├── README.md
│   └── output/
│
├── hands_on_3/
│   ├── README.md
│   └── output/
│
├── hands_on_4/
│   ├── README.md
│   └── output/
│
├── hands_on_5/
│   ├── README.md
│   └── output/
│
├── hands_on_6/
│   ├── README.md
│   └── output/
│
├── hands_on_7/
│   ├── README.md
│   └── output/
│
├── hands_on_8/
│   ├── README.md
│   └── output/
│
└── hands_on_9/
    ├── README.md
    └── output/
```

---

## Hands-On Summary

### Hands-On 1
- Created Django project
- Created virtual environment
- Configured Django
- Started development server

### Hands-On 2
- Designed database models
- Created Department, Course, Student and Enrollment models
- Generated and applied migrations

### Hands-On 3
- Installed Django REST Framework
- Created Model Serializers
- Developed REST APIs
- Configured API routing

### Hands-On 4
- Implemented CRUD operations
- Created Create, Read, Update and Delete APIs
- Tested REST endpoints

### Hands-On 5
- Configured JWT Authentication
- Generated Access and Refresh Tokens
- Secured APIs using `IsAuthenticated`

### Hands-On 6
- Implemented Filtering
- Implemented Searching
- Implemented Ordering
- Improved API usability using `django-filter`

### Hands-On 7
- Configured Swagger UI
- Configured ReDoc
- Generated interactive API documentation

### Hands-On 8
- Developed Dashboard API
- Returned overall statistics
- Used Django ORM `count()` operations

### Hands-On 9
- Developed Department Statistics API
- Returned department-wise analytics
- Calculated total courses, students and enrollments

---

## Technologies Used

- Python 3.12.6
- Django 6.0.7
- Django REST Framework
- Django REST Framework Simple JWT
- django-filter
- drf-yasg (Swagger)
- SQLite

---

## APIs Implemented

- Department CRUD APIs
- Course CRUD APIs
- Student CRUD APIs
- Enrollment CRUD APIs
- JWT Authentication APIs
- Dashboard API
- Department Statistics API

---

## Additional Features

- JWT Authentication
- Protected APIs
- Filtering
- Searching
- Ordering
- Swagger Documentation
- ReDoc Documentation
- Dashboard Summary
- Department Statistics

---

## Note

To avoid creating multiple identical Django projects, all coding for Hands-On 2 to Hands-On 9 was implemented by extending the Django project created in **Hands-On 1**.

Each hands-on folder contains its own **README.md** and **output screenshots** corresponding to that exercise, while the complete implementation is maintained in the **Hands-On 1** project.

---

## Learning Outcomes

- Built REST APIs using Django REST Framework.
- Designed relational database models using Django ORM.
- Implemented CRUD operations.
- Secured APIs with JWT Authentication.
- Implemented filtering, searching and ordering.
- Generated API documentation using Swagger UI and ReDoc.
- Developed custom analytical APIs using Django ORM.
- Built a complete Course Management System backend following REST architecture.