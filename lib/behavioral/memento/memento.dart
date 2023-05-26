// Originator
class TextEditor {
  String text;

  TextEditor(this.text);

  void addText(String additionalText) {
    text += additionalText;
  }

  String getText() {
    return text;
  }

  TextEditorMemento save() {
    return TextEditorMemento(text);
  }

  void restore(TextEditorMemento memento) {
    text = memento.getSavedText();
  }
}

// Memento
class TextEditorMemento {
  String savedText;

  TextEditorMemento(this.savedText);

  String getSavedText() {
    return savedText;
  }
}

// Caretaker
class TextEditorHistory {
  List<TextEditorMemento> history = [];

  void saveState(TextEditorMemento memento) {
    history.add(memento);
  }

  TextEditorMemento undo() {
    if (history.isNotEmpty) {
      final lastMemento = history.removeLast();
      return lastMemento;
    }
    throw Exception('[TextEditorMemento.undo]: empty history');
  }
}
