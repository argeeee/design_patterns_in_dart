// Mediator interface
abstract class ChatRoomMediator {
  void sendMessage(String message, User sender);
  void addUser(User user);
}

// Concrete Mediator
class ChatRoom implements ChatRoomMediator {
  List<User> users = [];

  @override
  void sendMessage(String message, User sender) {
    for (var user in users) {
      if (user != sender) {
        user.receiveMessage(message);
      }
    }
  }

  @override
  void addUser(User user) {
    users.add(user);
  }
}

// Colleague
class User {
  String name;
  ChatRoomMediator chatRoom;

  User(this.name, this.chatRoom);

  void sendMessage(String message) {
    chatRoom.sendMessage(message, this);
  }

  void receiveMessage(String message) {
    print('$name received message: $message');
  }
}

// Client
void main() {}
