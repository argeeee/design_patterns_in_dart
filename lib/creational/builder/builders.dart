import 'package:design_patterns/creational/builder/models.dart';

abstract class PizzaBuilder {
  void buildCrust();
  void buildSauce();
  void buildToppings();
  Pizza getPizza();
}

class MargheritaPizzaBuilder extends PizzaBuilder {
  Pizza pizza = Pizza();

  @override
  void buildCrust() {
    pizza.crust = 'Thin Crust';
  }

  @override
  void buildSauce() {
    pizza.sauce = 'Tomato Sauce';
  }

  @override
  void buildToppings() {
    pizza.toppings = ['Fresh Mozzarella', 'Basil Leaves'];
  }

  @override
  Pizza getPizza() {
    return pizza;
  }
}

class PepperoniPizzaBuilder extends PizzaBuilder {
  Pizza pizza = Pizza();

  @override
  void buildCrust() {
    pizza.crust = 'Thick Crust';
  }

  @override
  void buildSauce() {
    pizza.sauce = 'Tomato Sauce';
  }

  @override
  void buildToppings() {
    pizza.toppings = ['Pepperoni', 'Cheese', 'Onions', 'Peppers'];
  }

  @override
  Pizza getPizza() => pizza;
}
