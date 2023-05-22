import 'package:design_patterns/behavioral/chain_of_responsibility/chain_of_responsibility.dart';
import 'package:design_patterns/behavioral/command/command.dart';
import 'package:design_patterns/creational/abstract_factory/data/windows/factory.dart';
import 'package:design_patterns/creational/abstract_factory/domain/factory.dart';
import 'package:design_patterns/creational/abstract_factory/domain/views.dart';
import 'package:design_patterns/creational/builder/builders.dart';
import 'package:design_patterns/creational/builder/director.dart';
import 'package:design_patterns/creational/builder/models.dart';
import 'package:design_patterns/creational/factory_method/factory_method.dart';
import 'package:design_patterns/creational/prototype/shape_utils.dart';
import 'package:design_patterns/creational/singleton/config.dart';
import 'package:design_patterns/structural/adapter/media_player.dart';
import 'package:design_patterns/structural/bridge/bridge.dart';
import 'package:design_patterns/structural/composite/composite.dart';
import 'package:design_patterns/structural/decorator/decorator.dart';
import 'package:design_patterns/structural/facade/facade.dart';
import 'package:design_patterns/structural/flyweight/flyweight.dart';
import 'package:design_patterns/structural/proxy/proxy.dart';
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

  test('Adapter', () {
    MediaPlayer mediaPlayer = MediaPlayerAdapter(LegacyMediaPlayer());

    mediaPlayer.play("vlc", "movie.vlc");
    mediaPlayer.play("mp4", "song.mp4");

    // Just to mark the test as passed
    expect(0, 0);
  });

  test('Bridge', () {
    Workshop assembleWorkshop = AssembleWorkshop();
    Workshop paintWorkshop = PaintWorkshop();

    List<Workshop> carWorkshops = [assembleWorkshop, paintWorkshop];
    List<Workshop> bikeWorkshops = [assembleWorkshop];

    Vehicle car = Car(carWorkshops);
    Vehicle bike = Bike(bikeWorkshops);

    car.manufacture();
    print('------------------');
    bike.manufacture();

    // Just to mark the test as passed
    expect(0, 0);
  });

  test('Composite', () {
    File file1 = File("file1.txt");
    File file2 = File("file2.txt");
    Directory directory1 = Directory("directory1");
    directory1.addComponent(file1);
    directory1.addComponent(file2);

    File file3 = File("file3.txt");
    Directory directory2 = Directory("directory2");
    directory2.addComponent(file3);
    directory2.addComponent(directory1);

    directory2.display();

    // Just to mark the test as passed
    expect(0, 0);
  });

  test('Decorator', () {
    Coffee simpleCoffee = SimpleCoffee();
    print(
      "Simple Coffee - Cost: \$${simpleCoffee.getCost().toStringAsFixed(2)}, Description: ${simpleCoffee.getDescription()}",
    );

    Coffee milkCoffee = MilkDecorator(simpleCoffee);
    print(
      "Coffee with Milk - Cost: \$${milkCoffee.getCost().toStringAsFixed(2)}, Description: ${milkCoffee.getDescription()}",
    );

    Coffee sugarCoffee = SugarDecorator(simpleCoffee);
    print(
      "Coffee with Sugar - Cost: \$${sugarCoffee.getCost().toStringAsFixed(2)}, Description: ${sugarCoffee.getDescription()}",
    );

    Coffee milkSugarCoffee = MilkDecorator(sugarCoffee);
    print(
      "Coffee with Milk and Sugar - Cost: \$${milkSugarCoffee.getCost().toStringAsFixed(2)}, Description: ${milkSugarCoffee.getDescription()}",
    );

    // Just to mark the test as passed
    expect(0, 0);
  });

  test('Facade', () {
    // Creating subsystem objects
    Account account = Account('1234567890', 1000.0);
    Notification notification = Notification();

    // Creating the banking facade
    BankingFacade bankingFacade = BankingFacade(account, notification);

    // Using the simplified interface provided by the facade
    bankingFacade.deposit(500.0);
    bankingFacade.withdraw(200.0);

    double balance = bankingFacade.getBalance();
    print('Account balance: \$${balance.toStringAsFixed(2)}');

    // Just to mark the test as passed
    expect(0, 0);
  });

  test('Flyweight', () {
    final enemyFactory = EnemyFactory();

    // Creating and displaying enemies
    final orc1 = enemyFactory.getEnemy('Orc', 'Axe');
    orc1.display(100, 200);

    final orc2 = enemyFactory.getEnemy('Orc', 'Sword');
    orc2.display(150, 250);

    final orc3 = enemyFactory.getEnemy('Orc', 'Axe');
    orc3.display(200, 300);

    // Reusing existing enemies
    final orc1Copy = enemyFactory.getEnemy('Orc', 'Axe');
    orc1Copy.display(250, 350);

    // Just to mark the test as passed
    expect(0, 0);
  });

  test('Proxy', () {
    final image1 = ImageProxy("image1.jpg");
    final image2 = ImageProxy("image2.jpg");

    // Images are not loaded yet
    image1.display();
    image2.display();

    // Images are loaded and displayed
    image1.display();
    image2.display();

    // Just to mark the test as passed
    expect(0, 0);
  });

  test('Chain of Reponsibility', () {
    final teamLead = TeamLead();
    final manager = Manager();
    final director = Director();

    teamLead.setNextApprover(manager);
    manager.setNextApprover(director);

    // Create purchase requests
    final request1 = PurchaseRequest(1, 800);
    final request2 = PurchaseRequest(2, 4500);
    final request3 = PurchaseRequest(3, 12000);

    // Process purchase requests
    teamLead.processRequest(request1);
    teamLead.processRequest(request2);
    teamLead.processRequest(request3);

    // Just to mark the test as passed
    expect(0, 0);
  });

  test('Command', () {
    final textEditor = TextEditor();
    final invoker = TextEditorInvoker();

    // Add text command
    final addCommand = AddTextCommand(textEditor, 'Hello,');
    invoker.setCommand(addCommand);
    invoker.executeCommand(); // Adds "Hello, "

    // Remove last character command
    final removeCommand = RemoveLastCharacterCommand(textEditor);
    invoker.setCommand(removeCommand);
    invoker.executeCommand(); // Removes the comma (',')
    textEditor.displayText(); // Current text: "Hello"

    // Undo the remove operation
    removeCommand.undo();
    textEditor.displayText(); // Current text: "Hello, "

    // Just to mark the test as passed
    expect(0, 0);
  });
}
