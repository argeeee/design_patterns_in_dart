// Windows button implementation
import 'package:design_patterns/creational/abstract_factory/domain/views.dart';

class WindowsButton implements Button {
  @override
  void render() {
    print('Rendering a Windows button');
  }
}

// Windows text field implementation
class WindowsTextField implements TextField {
  @override
  void render() {
    print('Rendering a Windows text field');
  }
}
