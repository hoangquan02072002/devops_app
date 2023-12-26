import unittest
from sqlalchemy import MetaData
from flask_sqlalchemy import SQLAlchemy
from app import app, db
from models import Student

class TestCreateStudentFunction(unittest.TestCase):
    def setUp(self):
        app.config['TESTING'] = True
        app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://postgres:linky1337@postgres_db/DevOps'
        self.app = app.test_client()
        with app.app_context():
            db.create_all()

    def tearDown(self):
        with app.app_context():
            db.session.remove()
            db.drop_all()

    def test_create_student_success(self):
        with app.test_request_context('/createstudent', method='POST', data={
            'name': 'John',
            'lastname': 'Doe',
            'surname': 'Smith',
            'admission_year': '2022',
            'education_form': 'Full-time',
            'group': 'A'
        }):
            response = app.test_client().post('/createstudent')
            self.assertEqual(response.status_code, 302)  # Assuming a successful redirect status code

            # Optionally, you can assert the presence of the newly created student in the database
            with app.app_context():
                new_student = Student.query.filter_by(name='John').first()
                self.assertIsNotNone(new_student)
                self.assertEqual(new_student.lastname, 'Doe')
                # Add more assertions as needed

    def test_create_student_failure(self):
        # Write test cases to simulate failure scenarios for creating a student
        pass
        # Example: Test when the form data is incomplete or invalid

if __name__ == '__main__':
    unittest.main()