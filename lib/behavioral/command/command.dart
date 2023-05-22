// Command interface
abstract class Command {
  void execute();
}

// Concrete Command
class AddTextCommand implements Command {
  TextEditor receiver;
  String text;

  AddTextCommand(this.receiver, this.text);

  @override
  void execute() {
    receiver.addText(text);
  }
}

// Concrete Command
class RemoveLastCharacterCommand implements Command {
  TextEditor receiver;
  String deletedCharacter = '';

  RemoveLastCharacterCommand(this.receiver);

  @override
  void execute() {
    deletedCharacter = receiver.removeLastCharacter();
  }

  void undo() {
    receiver.addText(deletedCharacter);
  }
}

// Receiver
class TextEditor {
  String text = '';

  void addText(String text) {
    this.text += text;
    print('[Added text]: "$text"');
  }

  String removeLastCharacter() {
    final deletedCharacter =
        text.isNotEmpty ? text.substring(text.length - 1) : '';
    text = text.isNotEmpty ? text.substring(0, text.length - 1) : '';
    print('[Removed character]: "$deletedCharacter"');
    return deletedCharacter;
  }

  void displayText() {
    print('[Current text]: "$text"');
  }
}

// Invoker
class TextEditorInvoker {
  Command? command;

  void setCommand(Command command) {
    this.command = command;
  }

  void executeCommand() {
    command?.execute();
  }
}
