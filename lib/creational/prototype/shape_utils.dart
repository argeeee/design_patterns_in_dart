import 'package:design_patterns/creational/prototype/shapes.dart';

class ShapeCache {
  static Map<String, Shape> _shapeCache = {};

  static void loadCache() {
    Circle circle = Circle(10.0, 'Red');
    Rectangle rectangle = Rectangle(20.0, 30.0, 'Blue');

    _shapeCache['circle'] = circle;
    _shapeCache['rectangle'] = rectangle;
  }

  static Shape? getShape(String shapeType) {
    Shape? cachedShape = _shapeCache[shapeType];
    return cachedShape?.clone();
  }
}
