from sqlalchemy import (
    create_engine,
    Column,
    Integer,
    String,
    Date,
    ForeignKey,
    Numeric
)

from sqlalchemy.orm import declarative_base
from sqlalchemy.orm import relationship

Base = declarative_base()

engine = create_engine(
    "mysql+mysqlconnector://root:@localhost/college_db_orm",
    echo=True
)

''' departmental model'''
class Department(Base):

    __tablename__ = "departments"

    department_id = Column(Integer, primary_key=True)

    dept_name = Column(String(100), nullable=False)

    head_of_dept = Column(String(100))

    budget = Column(Numeric(12,2))

    students = relationship("Student", back_populates="department")

    courses = relationship("Course", back_populates="department")

    professors = relationship("Professor", back_populates="department")

''' student model'''


class Department(Base):

    __tablename__ = "departments"

    department_id = Column(Integer, primary_key=True)

    dept_name = Column(String(100), nullable=False)

    head_of_dept = Column(String(100))

    budget = Column(Numeric(12,2))

    students = relationship("Student", back_populates="department")

    courses = relationship("Course", back_populates="department")

    professors = relationship("Professor", back_populates="department")

''' course model'''
class Course(Base):

    __tablename__ = "courses"

    course_id = Column(Integer, primary_key=True)

    course_name = Column(String(150))

    course_code = Column(String(20), unique=True)

    credits = Column(Integer)

    department_id = Column(
        Integer,
        ForeignKey("departments.department_id")
    )

    department = relationship(
        "Department",
        back_populates="courses"
    )

    enrollments = relationship(
        "Enrollment",
        back_populates="course"
    )

'''enrollment model'''
class Enrollment(Base):

    __tablename__ = "enrollments"

    enrollment_id = Column(Integer, primary_key=True)

    student_id = Column(
        Integer,
        ForeignKey("students.student_id")
    )

    course_id = Column(
        Integer,
        ForeignKey("courses.course_id")
    )

    enrollment_date = Column(Date)

    grade = Column(String(2))

    student = relationship(
        "Student",
        back_populates="enrollments"
    )

    course = relationship(
        "Course",
        back_populates="enrollments"
    )

'''professor model'''

class Enrollment(Base):

    __tablename__ = "enrollments"

    enrollment_id = Column(Integer, primary_key=True)

    student_id = Column(
        Integer,
        ForeignKey("students.student_id")
    )

    course_id = Column(
        Integer,
        ForeignKey("courses.course_id")
    )

    enrollment_date = Column(Date)

    grade = Column(String(2))

    student = relationship(
        "Student",
        back_populates="enrollments"
    )

    course = relationship(
        "Course",
        back_populates="enrollments"
    )



Base.metadata.create_all(engine)

