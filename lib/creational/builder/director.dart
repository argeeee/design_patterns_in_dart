import 'package:design_patterns/creational/builder/builders.dart';
import 'package:design_patterns/creational/builder/models.dart';

class PizzaDirector {
  late PizzaBuilder pizzaBuilder;

  void setPizzaBuilder(PizzaBuilder builder) {
    pizzaBuilder = builder;
  }

  Pizza constructPizza() {
    pizzaBuilder.buildCrust();
    pizzaBuilder.buildSauce();
    pizzaBuilder.buildToppings();
    return pizzaBuilder.getPizza();
  }
}
