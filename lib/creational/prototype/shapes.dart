abstract class Shape {
  void draw();
  Shape clone();
}

class Circle implements Shape {
  double radius;
  String color;

  Circle(this.radius, this.color);

  @override
  void draw() {
    print('Drawing a circle with radius $radius and color $color');
  }

  @override
  Shape clone() {
    return Circle(radius, color);
  }
}

class Rectangle implements Shape {
  double width;
  double height;
  String color;

  Rectangle(this.width, this.height, this.color);

  @override
  void draw() {
    print(
      'Drawing a rectangle with width $width, height $height, and color $color',
    );
  }

  @override
  Shape clone() {
    return Rectangle(width, height, color);
  }
}
