class RobotSimulator:
    def __init__(self):
        self.position = [0, 0]
        self.direction = 90  # 0: North, 90: East, 180: South, 270: West
        self.matrix_size = 10
        self.field = [[0] * self.matrix_size for _ in range(self.matrix_size)]

    def execute_instructions(self, filename):
        with open(filename, 'r') as file:
            instructions = file.readlines()

        for instruction in instructions:
            self.execute_instruction(instruction.strip())

    def execute_instruction(self, instruction):
        tokens = instruction.split(',')
        opcode = tokens[0].strip()
        opcode=opcode.upper()
        if opcode == 'MOV':
            c = int(tokens[1].strip())
            # print(opcode," ",c)
            self.move(c)
        elif opcode == 'TURN':
            c = int(tokens[1].strip())
            # print(opcode," ",c)
            self.turn(c)

    def move(self, blocks):
        new_position = self.calculate_new_position(blocks)
        if self.is_position_valid(new_position):
            for i in range(blocks):
                self.field[self.position[0]][self.position[1]] = "-"
                self.position = self.calculate_new_position(1)
            self.field[self.position[0]][self.position[1]] = "x"
        else:
            raise ValueError("Illegal instruction: Move out of bounds")

    def turn(self, degrees):
        self.direction = (self.direction + degrees) % 360

    def calculate_new_position(self, blocks):
        if self.direction == 0:  # North
            return [self.position[0] - blocks, self.position[1]]
        elif self.direction == 90:  # East
            return [self.position[0], self.position[1] + blocks]
        elif self.direction == 180:  # South
            return [self.position[0] + blocks, self.position[1]]
        elif self.direction == 270:  # West
            return [self.position[0], self.position[1] - blocks]

    def is_position_valid(self, position):
        x, y = position
        return 0 <= x < self.matrix_size and 0 <= y < self.matrix_size

    def draw_field(self):
        print("Robot final position:" ,self.position,"\nDirection:",self.direction)
        for row in self.field:
            print(' '.join(map(str, row)))


if __name__ == '__main__':
    robot = RobotSimulator()
    robot.execute_instructions('RobotComputationalMethods\src\instructions.asm')
    robot.draw_field()
