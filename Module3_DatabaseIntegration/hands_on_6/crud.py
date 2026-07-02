''' connect database'''
from sqlalchemy.orm import sessionmaker
from models import *

Session = sessionmaker(bind=engine)

session = Session()
''' insert to department'''
cs = Department(
    dept_name="Computer Science",
    head_of_dept="Dr Ramesh",
    budget=850000
)

session.add(cs)

session.commit()

''' insert to student'''

student = Student(

    first_name="Arjun",

    last_name="Mehta",

    email="arjun@gmail.com",

    enrollment_year=2022,

    department=cs

)

session.add(student)

session.commit()

'''read data'''
students = (

session.query(Student)

.join(Department)

.filter(

Department.dept_name=="Computer Science"

)

.all()

)

for s in students:

    print(s.first_name,s.last_name)

students = (

session.query(Student)

.join(Department)

.filter(

Department.dept_name=="Computer Science"

)

.all()

)

for s in students:

    print(s.first_name,s.last_name)


