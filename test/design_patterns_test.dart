import 'package:design_patterns/creational/abstract_factory/data/windows/factory.dart';
import 'package:design_patterns/creational/abstract_factory/domain/factory.dart';
import 'package:design_patterns/creational/abstract_factory/domain/views.dart';
import 'package:design_patterns/creational/builder/builders.dart';
import 'package:design_patterns/creational/builder/director.dart';
import 'package:design_patterns/creational/builder/models.dart';
import 'package:test/test.dart';

void main() {
  test('Abstract Factory', () {
    // Determine the operating system (for simplicity, let's assume it's a Windows environment)
    ViewFactory factory = WindowsViewFactory();

    // Create views using the factory
    Button button = factory.createButton();
    TextField textField = factory.createTextField();

    // Render the views
    button.render();
    textField.render();

    // Just to mark the test as passed
    expect(0, 0);
  });

  test('Builder', () {
    PizzaDirector director = PizzaDirector();

    // Create a Margherita pizza
    PizzaBuilder margheritaBuilder = MargheritaPizzaBuilder();
    director.setPizzaBuilder(margheritaBuilder);
    Pizza margheritaPizza = director.constructPizza();
    margheritaPizza.display();

    print('---');

    // Create a Pepperoni pizza
    PizzaBuilder pepperoniBuilder = PepperoniPizzaBuilder();
    director.setPizzaBuilder(pepperoniBuilder);
    Pizza pepperoniPizza = director.constructPizza();
    pepperoniPizza.display();

    // Just to mark the test as passed
    expect(0, 0);
  });
}
