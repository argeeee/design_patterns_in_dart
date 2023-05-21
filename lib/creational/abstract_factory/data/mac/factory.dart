// Concrete factory for macOS views
import 'package:design_patterns/creational/abstract_factory/data/mac/views.dart';
import 'package:design_patterns/creational/abstract_factory/domain/factory.dart';
import 'package:design_patterns/creational/abstract_factory/domain/views.dart';

class MacViewFactory implements ViewFactory {
  @override
  Button createButton() {
    return MacButton();
  }

  @override
  TextField createTextField() {
    return MacTextField();
  }
}
