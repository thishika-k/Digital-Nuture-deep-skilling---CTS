from django.contrib import admin
from django.urls import path
from courses.views import (
    DepartmentListCreateAPIView,
    DepartmentRetrieveUpdateDestroyAPIView,
    CourseListCreateAPIView,
    CourseRetrieveUpdateDestroyAPIView,
    StudentListCreateAPIView,
    StudentRetrieveUpdateDestroyAPIView,
    EnrollmentListCreateAPIView,
    EnrollmentRetrieveUpdateDestroyAPIView,
)
from rest_framework_simplejwt.views import (
    TokenObtainPairView,
    TokenRefreshView,
)

urlpatterns = [
    path("admin/", admin.site.urls),
    
    path("api/token/", TokenObtainPairView.as_view(), name="token_obtain_pair"),
    path("api/token/refresh/", TokenRefreshView.as_view(), name="token_refresh"),

    path("api/departments/", DepartmentListCreateAPIView.as_view()),
    path("api/departments/<int:pk>/", DepartmentRetrieveUpdateDestroyAPIView.as_view()),

    path("api/courses/", CourseListCreateAPIView.as_view()),
    path("api/courses/<int:pk>/", CourseRetrieveUpdateDestroyAPIView.as_view()),

    path("api/students/", StudentListCreateAPIView.as_view()),
    path("api/students/<int:pk>/", StudentRetrieveUpdateDestroyAPIView.as_view()),

    path("api/enrollments/", EnrollmentListCreateAPIView.as_view()),
    path("api/enrollments/<int:pk>/", EnrollmentRetrieveUpdateDestroyAPIView.as_view()),
]