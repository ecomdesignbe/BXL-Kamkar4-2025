## Understand the basics of Inheritance and Overriding
Design a base class Shape with a method area() that calculates the area (set to 0 by default). Create subclasses Square and Circle that inherit from Shape and override the area() method with their specific area calculations based on side length and radius, respectively.

import math

# Base class
class Shape:
    def area(self):
        return 0

# Subclass for Square
class Square(Shape):
    def __init__(self, side):
        self.side = side

    def area(self):
        return self.side ** 2

# Subclass for Circle
class Circle(Shape):
    def __init__(self, radius):
        self.radius = radius

    def area(self):
        return math.pi * self.radius ** 2

# Example usage
if __name__ == "__main__":
    shapes = [
        Shape(),
        Square(4),
        Circle(3)
    ]

    for shape in shapes:
        print(f"{shape.__class__.__name__} area: {shape.area():.2f}")