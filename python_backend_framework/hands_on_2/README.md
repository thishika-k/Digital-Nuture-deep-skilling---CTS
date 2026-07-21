# Hands-On 2: Django Models and Database Migrations

## Objective
To create Django models representing the Course Management System and generate the corresponding database tables using migrations.

## Models Created
- Department
- Course
- Student
- Enrollment

## Relationships
- One Department can have many Courses.
- One Department can have many Students.
- A Student can enroll in many Courses through the Enrollment model.

## Steps Performed
1. Created models in `courses/models.py`.
2. Defined relationships using `ForeignKey`.
3. Generated migration files using:
   ```bash
   python manage.py makemigrations
   ```
4. Applied migrations using:
   ```bash
   python manage.py migrate
   ```
5. Verified that the database tables were created successfully.

## Output
- Models created successfully.
- Migration file generated.
- Database tables created successfully.

## Learning Outcome
- Learned how to define Django models.
- Understood model relationships using `ForeignKey`.
- Learned how Django migrations create and update database tables.