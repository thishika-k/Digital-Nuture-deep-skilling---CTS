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
from rest_framework import permissions
from drf_yasg.views import get_schema_view
from drf_yasg import openapi

schema_view = get_schema_view(
    openapi.Info(
        title="Course Management API",
        default_version='v1',
        description="API documentation for Course Management System",
    ),
    public=True,
    permission_classes=(permissions.AllowAny,),
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

    path(
    "swagger/",
    schema_view.with_ui("swagger", cache_timeout=0),
    name="schema-swagger-ui",
), 
    path(
    "redoc/",
    schema_view.with_ui("redoc", cache_timeout=0),
    name="schema-redoc",
),
]