// macOS button implementation
import 'package:design_patterns/creational/abstract_factory/domain/views.dart';

class MacButton implements Button {
  @override
  void render() {
    print('Rendering a macOS button');
  }
}

// macOS text field implementation
class MacTextField implements TextField {
  @override
  void render() {
    print('Rendering a macOS text field');
  }
}
