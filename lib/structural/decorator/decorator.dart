// Component
abstract class Coffee {
  String getDescription();
  double getCost();
}

// Concrete Component
class SimpleCoffee implements Coffee {
  @override
  String getDescription() {
    return "Simple Coffee";
  }

  @override
  double getCost() {
    return 1.0;
  }
}

// Decorator
abstract class CoffeeDecorator implements Coffee {
  final Coffee decoratedCoffee;

  CoffeeDecorator(this.decoratedCoffee);
}

// Concrete Decorators
class MilkDecorator extends CoffeeDecorator {
  MilkDecorator(Coffee decoratedCoffee) : super(decoratedCoffee);

  @override
  String getDescription() {
    return "${decoratedCoffee.getDescription()}, Milk";
  }

  @override
  double getCost() {
    return decoratedCoffee.getCost() + 0.5;
  }
}

class SugarDecorator extends CoffeeDecorator {
  SugarDecorator(Coffee decoratedCoffee) : super(decoratedCoffee);

  @override
  String getDescription() {
    return "${decoratedCoffee.getDescription()}, Sugar";
  }

  @override
  double getCost() {
    return decoratedCoffee.getCost() + 0.2;
  }
}
