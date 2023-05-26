// Subject (Observable)
abstract class MessageSystem {
  List<User> subscribers = [];

  void subscribe(User user) {
    subscribers.add(user);
  }

  void unsubscribe(User user) {
    subscribers.remove(user);
  }

  void notifySubscribers(String message) {
    for (var subscriber in subscribers) {
      subscriber.receiveMessage(message);
    }
  }
}

// Concrete Subject (Concrete Observable)
class MessagingApp extends MessageSystem {
  void sendMessage(String message) {
    // Process the message sending logic

    notifySubscribers(message);
  }
}

// Observer
abstract class User {
  void receiveMessage(String message);
}

// Concrete Observer
class ChatUser implements User {
  String name;

  ChatUser(this.name);

  @override
  void receiveMessage(String message) {
    print('User $name received a new message: $message');
  }
}
