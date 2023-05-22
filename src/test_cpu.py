import unittest
from cpu import RobotSimulator

class TestRobot(unittest.TestCase):
    def setUp(self):
        self.robot = RobotSimulator()

    def test_execute_instructions(self):
        self.robot.execute_instructions('src/instructions.asm')
        self.assertEqual(self.robot.position, [2, 2])  # Expected final position after executing instructions
        self.assertEqual(self.robot.direction, 0)  # Expected final direction after executing instructions


    def test_move_out_of_bounds(self):
        with self.assertRaises(ValueError):
            self.robot.move(10)  # Attempting to move out of bounds should raise an exception

    def test_turn(self):
        self.robot.turn(270)  # Turning 270 degrees from initial direction (90)
        self.assertEqual(self.robot.direction, 0)

    def test_calculate_new_position(self):
        new_position = self.robot.calculate_new_position(2)  # Calculate new position after moving 2 blocks
        self.assertEqual(new_position, [0, 2])  # Expected new position relative to initial position (0, 0)


if __name__ == '__main__':
    unittest.main()
