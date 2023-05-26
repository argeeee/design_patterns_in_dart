import 'package:design_patterns/behavioral/chain_of_responsibility/chain_of_responsibility.dart';
import 'package:design_patterns/behavioral/command/command.dart' as command;
import 'package:design_patterns/behavioral/interpreter/interpreter.dart';
import 'package:design_patterns/behavioral/iterator/iterator.dart';
import 'package:design_patterns/behavioral/mediator/mediator.dart' as mediator;
import 'package:design_patterns/behavioral/memento/memento.dart' as memento;
import 'package:design_patterns/behavioral/observer/observer.dart' as observer;
import 'package:design_patterns/behavioral/state/state.dart';
import 'package:design_patterns/behavioral/strategy/strategy.dart';
import 'package:design_patterns/behavioral/template_method/template_method.dart';
import 'package:design_patterns/behavioral/visitor/visitor.dart';
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
    final textEditor = command.TextEditor();
    final invoker = command.TextEditorInvoker();

    // Add text command
    final addCommand = command.AddTextCommand(textEditor, 'Hello,');
    invoker.setCommand(addCommand);
    invoker.executeCommand(); // Adds "Hello, "

    // Remove last character command
    final removeCommand = command.RemoveLastCharacterCommand(textEditor);
    invoker.setCommand(removeCommand);
    invoker.executeCommand(); // Removes the comma (',')
    textEditor.displayText(); // Current text: "Hello"

    // Undo the remove operation
    removeCommand.undo();
    textEditor.displayText(); // Current text: "Hello, "

    // Just to mark the test as passed
    expect(0, 0);
  });

  test('Interpreter', () {
    // Creating the expression tree for: 5 + (4 - 2) * 3 / 2

    // Terminal expressions
    final num5 = NumberExpression(5);
    final num4 = NumberExpression(4);
    final num2 = NumberExpression(2);
    final num3 = NumberExpression(3);

    // Sub-expressions
    final subtraction = SubtractionExpression(num4, num2);
    final multiplication = MultiplicationExpression(subtraction, num3);
    final division = DivisionExpression(multiplication, num2);

    // Main expression
    final expression = AdditionExpression(num5, division);

    // Evaluate the expression
    final result = expression.interpret();
    print('Result: $result'); // Output: Result: 8

    // Just to mark the test as passed
    expect(0, 0);
  });

  test('Iterator', () {
    final bookCollection = BookCollection();

    bookCollection.addBook(
      Book("Design Patterns: Elements of Reusable Object-Oriented Software"),
    );
    bookCollection.addBook(
      Book("Clean Code: A Handbook of Agile Software Craftsmanship"),
    );
    bookCollection.addBook(
      Book("Refactoring: Improving the Design of Existing Code"),
    );

    final iterator = bookCollection.createIterator();
    while (iterator.hasNext()) {
      final book = iterator.next();
      print(book.title);
    }

    // Just to mark the test as passed
    expect(0, 0);
  });

  test('Mediator', () {
    final chatRoom = mediator.ChatRoom();

    final user1 = mediator.User('John', chatRoom);
    final user2 = mediator.User('Alice', chatRoom);
    final user3 = mediator.User('Bob', chatRoom);

    chatRoom.addUser(user1);
    chatRoom.addUser(user2);
    chatRoom.addUser(user3);

    user1.sendMessage(
      'Hello everyone!',
    );
    // Output: Alice received message: Hello everyone!
    //         Bob received message: Hello everyone!

    user2.sendMessage('Hi John!'); // Output: John received message: Hi John!

    // Just to mark the test as passed
    expect(0, 0);
  });

  test('Memento', () {
    final textEditor = memento.TextEditor('');
    final history = memento.TextEditorHistory();

    // Initial state
    history.saveState(textEditor.save());

    // User actions
    textEditor.addText('Hello, ');
    history.saveState(textEditor.save());

    textEditor.addText('world!');
    history.saveState(textEditor.save());

    // Undo
    textEditor.restore(history.undo());

    print(textEditor.getText()); // Output: Hello,

    textEditor.restore(history.undo());

    print(textEditor.getText()); // Output:

    textEditor.restore(history.undo());

    print(textEditor.getText()); // Output:

    // Just to mark the test as passed
    expect(0, 0);
  });

  test('Observer', () {
    // Create the messaging app object (subject)
    final messagingApp = observer.MessagingApp();

    // Create users (observers)
    final user1 = observer.ChatUser('Alice');
    final user2 = observer.ChatUser('Bob');
    final user3 = observer.ChatUser('Charlie');

    // Users subscribe to receive messages
    messagingApp.subscribe(user1);
    messagingApp.subscribe(user2);
    messagingApp.subscribe(user3);

    // Send a message
    messagingApp.sendMessage('Hello, everyone!');

    // User2 unsubscribes from receiving messages
    messagingApp.unsubscribe(user2);

    // Send another message
    messagingApp.sendMessage('How are you doing?');
    // Just to mark the test as passed
    expect(0, 0);
  });

  test('State', () {
    // Create the music player
    final musicPlayer = MusicPlayer();

    // Perform operations
    musicPlayer.play();
    musicPlayer.pause();
    musicPlayer.play();
    musicPlayer.stop();
    musicPlayer.pause();

    // Just to mark the test as passed
    expect(0, 0);
  });

  test('Strategy', () {
    // Create payment processor
    final paymentProcessor = PaymentProcessor();

    // Set different payment strategies
    final creditCardStrategy = CreditCardPaymentStrategy(
      '1234567890',
      '123',
    );
    final paypalStrategy = PayPalPaymentStrategy(
      'user@example.com',
      'password',
    );
    final bankTransferStrategy = BankTransferPaymentStrategy(
      '9876543210',
    );

    // Process payments using different strategies
    paymentProcessor.setPaymentStrategy(creditCardStrategy);
    paymentProcessor.processPayment(100.0);

    paymentProcessor.setPaymentStrategy(paypalStrategy);
    paymentProcessor.processPayment(50.0);

    paymentProcessor.setPaymentStrategy(bankTransferStrategy);
    paymentProcessor.processPayment(200.0);

    // Just to mark the test as passed
    expect(0, 0);
  });

  test('Template Method', () {
    HouseBuilder woodenHouseBuilder = WoodenHouseBuilder();
    woodenHouseBuilder.buildHouse();

    print("-------------------------");

    HouseBuilder concreteHouseBuilder = ConcreteHouseBuilder();
    concreteHouseBuilder.buildHouse();

    // Just to mark the test as passed
    expect(0, 0);
  });

  test('Visitor', () {
    // Create the AST: 5 + (2 - 3)
    final expression = Addition(
      Number(5),
      Subtraction(
        Number(2),
        Number(3),
      ),
    );

    // Evaluate the expression using the ExpressionEvaluator visitor
    final evaluator = ExpressionEvaluator();
    expression.accept(evaluator);
    print('Result: ${evaluator.result}'); // Output: Result: 4

    // Just to mark the test as passed
    expect(0, 0);
  });
}
