import unittest
from cpu import RobotSimulator

class TestRobot(unittest.TestCase):
    def setUp(self):
        self.robot = RobotSimulator()

    def test_move(self):
        self.robot.move(2)
        self.assertEqual(self.robot.position, [0, 2])  # Expected position relative to initial position (0, 0)
        
    def test_move_out_of_bounds(self):
        with self.assertRaises(ValueError):
            self.robot.move(10)  # Attempting to move out of bounds should raise an exception

    def test_turn(self):
        self.robot.turn(270)  # Turning 270 degrees from initial direction (90)
        self.assertEqual(self.robot.direction, 0)

    def test_calculate_new_position(self):
        new_position = self.robot.calculate_new_position(2)  # Calculate new position after moving 2 blocks
        self.assertEqual(new_position, [0, 2])  # Expected new position relative to initial position (0, 0)

    def test_execute_instruction(self):
        self.robot.execute_instruction("MOV, 3")
        self.assertEqual(self.robot.position, [0, 3])  # Expected position after executing move instruction

        self.robot.execute_instruction("TURN, 90")
        self.assertEqual(self.robot.direction, 180)  # Expected direction after executing turn instruction

    def test_is_position_valid(self):
        valid_position = [5, 5]
        self.assertTrue(self.robot.is_position_valid(valid_position))  # Valid position should return True

        invalid_position = [15, 5]
        self.assertFalse(self.robot.is_position_valid(invalid_position))  # Out-of-bounds position should return False


if __name__ == '__main__':
    unittest.main()
