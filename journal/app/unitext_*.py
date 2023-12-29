
from app import createstudent, createeducationplan, editstudent
from models import Student, PlanOfStudy  # Import the Student model
import pytest
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

@pytest.fixture
def db_session():
    # Set up a test database session using SQLAlchemy and PostgreSQL
    engine = create_engine('postgresql://postgres:linky1337@localhost:5432/DevOps')
    Session = sessionmaker(bind=engine)
    session = Session()
    yield session
    session.close()

def test_create_student_success(db_session):
    # Test the successful creation of a student
    new_student = Student(
        name='John',
        lastname='Doe',
        surname='Smith',
        admission_year=2022,
        education_form='Full-time',
        group='211-351'
    )
    db_session.add(new_student)  # Add the new student to the test database session
    db_session.commit()  # Commit the transaction
    retrieved_student = db_session.query(Student).filter_by(name='John').first()
    assert retrieved_student is not None
    assert retrieved_student.name == 'John'
    assert retrieved_student.lastname == 'Doe'
    assert retrieved_student.surname == 'Smith'
    assert retrieved_student.admission_year == 2022
    assert retrieved_student.education_form == 'Full-time'
    assert retrieved_student.group == '211-351'
    # Add more assertions as needed

def test_create_student_failure(db_session):
    with pytest.raises(Exception):  # Example: Test when the form data is incomplete or invalid
        createstudent('Incomplete', 'Data', 'Invalid', '2022', 'Part-time', 'B')

# def test_edit_student(db_session):
#     student_id = 1  # Replace with the actual student ID
#     updated_name = 'quan'
#     updated_lastname = 'nguyen'
#     updated_surname = 'le'
#     updated_admission_year=2003
#     updated_education_form='Pass-time'
#     updated_group='211-350'
#     # Provide other updated details as needed
#     editstudent(student_id, name=updated_name, lastname=updated_lastname, 
#     surname=updated_surname, admission_year=updated_admission_year,
#     education_form=updated_education_form,group=updated_group )
#     updated_student = db_session.query(Student).get(student_id)
#     assert updated_student.name == 'quan'
#     assert updated_student.lastname == 'nguyen'
#     assert updated_student.surname == 'le'
#     assert updated_student.admission_year == 2003
#     assert updated_student.education_form == 'Pass-time'
#     assert updated_student.group == '211-350'
def test_create_educateplan_success(db_session):
    # Test the successful creation of a educate_plan
    new_plan_educate = PlanOfStudy(
        speciality='Cyber sercurity',
        discipline='Networking',
        semester=3,
        hours=6,
        exam_or_test='Exam'
    )
    db_session.add(new_plan_educate)  # Add the new plan_educate to the test database session
    db_session.commit()  # Commit the transaction
    retrieved_plan_educate = db_session.query(PlanOfStudy).filter_by(speciality='Cyber sercurity').first()
    assert retrieved_plan_educate is not None
    assert retrieved_plan_educate.speciality == 'Cyber sercurity' 
    assert retrieved_plan_educate.discipline == 'Networking'
    assert retrieved_plan_educate.semester == 3
    assert retrieved_plan_educate.hours == 6
    assert retrieved_plan_educate.exam_or_test == 'Exam'
