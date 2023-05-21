// Concrete factory for Windows views
import 'package:design_patterns/creational/abstract_factory/data/windows/views.dart';
import 'package:design_patterns/creational/abstract_factory/domain/factory.dart';
import 'package:design_patterns/creational/abstract_factory/domain/views.dart';

class WindowsViewFactory implements ViewFactory {
  @override
  Button createButton() {
    return WindowsButton();
  }

  @override
  TextField createTextField() {
    return WindowsTextField();
  }
}
