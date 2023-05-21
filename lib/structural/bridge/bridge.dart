// Abstraction
abstract class Vehicle {
  List<Workshop> workshops;

  Vehicle(this.workshops);

  void manufacture();
}

// Implementation
abstract class Workshop {
  void work();
}

// Concrete Implementations
class AssembleWorkshop implements Workshop {
  @override
  void work() {
    print("Assembling vehicle");
  }
}

class PaintWorkshop implements Workshop {
  @override
  void work() {
    print("Painting vehicle");
  }
}

// Refined Abstraction
class Car extends Vehicle {
  Car(List<Workshop> workshops) : super(workshops);

  @override
  void manufacture() {
    print("Car manufacturing process:");
    for (var workshop in workshops) {
      workshop.work();
    }
    print("Car manufactured");
  }
}

// Refined Abstraction
class Bike extends Vehicle {
  Bike(List<Workshop> workshops) : super(workshops);

  @override
  void manufacture() {
    print("Bike manufacturing process:");
    for (var workshop in workshops) {
      workshop.work();
    }
    print("Bike manufactured");
  }
}
