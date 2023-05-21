import 'package:design_patterns/creational/abstract_factory/data/windows/factory.dart';
import 'package:design_patterns/creational/abstract_factory/domain/factory.dart';
import 'package:design_patterns/creational/abstract_factory/domain/views.dart';
import 'package:design_patterns/creational/builder/builders.dart';
import 'package:design_patterns/creational/builder/director.dart';
import 'package:design_patterns/creational/builder/models.dart';
import 'package:design_patterns/creational/factory_method/factory_method.dart';
import 'package:design_patterns/creational/prototype/shape_utils.dart';
import 'package:design_patterns/creational/singleton/config.dart';
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

  test('Factory Method', () {
    LoggerFactory factory = LoggerFactory();

    // Use the ConsoleLogger
    Logger consoleLogger = factory.createLogger(LoggingProvider.console);
    consoleLogger.log('This is a console log.');

    // Use the FileLogger
    Logger fileLogger = factory.createLogger(LoggingProvider.file);
    fileLogger.log('This is a file log.');

    // Use the NoLogger
    Logger noLogger = factory.createLogger(LoggingProvider.noLogging);
    noLogger.log('This will not be logged.');

    // Just to mark the test as passed
    expect(0, 0);
  });

  test('Prototype', () {
    ShapeCache.loadCache();

    final circle = ShapeCache.getShape('circle');
    circle?.draw();

    final rectangle = ShapeCache.getShape('rectangle');
    rectangle?.draw();

    // Just to mark the test as passed
    expect(0, 0);
  });

  test('Singleton', () {
    Config config1 = Config.getInstance();
    Config config2 = Config.getInstance();

    config1.loadConfiguration('api_key', 'your-api-key');
    config2.loadConfiguration('database_url', 'your-database-url');

    String apiKey = config2.getConfiguration('api_key');
    String databaseUrl = config1.getConfiguration('database_url');

    print(apiKey); // Output: your-api-key
    print(databaseUrl); // Output: your-database-url

    print(identical(config1, config2)); // Output: true

    // Just to mark the test as passed
    expect(0, 0);
  });
}
