from django.contrib import admin
from django.urls import path
from courses.views import (
    DepartmentListCreateAPIView,
    CourseListCreateAPIView,
    StudentListCreateAPIView,
    EnrollmentListCreateAPIView,
)

urlpatterns = [
    path('admin/', admin.site.urls),

    path('api/departments/', DepartmentListCreateAPIView.as_view()),
    path('api/courses/', CourseListCreateAPIView.as_view()),
    path('api/students/', StudentListCreateAPIView.as_view()),
    path('api/enrollments/', EnrollmentListCreateAPIView.as_view()),
]