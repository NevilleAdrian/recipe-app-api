"""
Sample test
"""
from django.test import SimpleTestCase

from app import calc

class CalcTests(SimpleTestCase):
    """Test calc module"""

    def test_add_number(self):

        res = calc.add(5,6)

        self.assertEqual(res, 11)


    def test_substract_number(self):

        res = calc.subtract(15,10)

        self.assertEqual(res, 5)
