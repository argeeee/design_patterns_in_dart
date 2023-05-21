// Abstract factory interface
import 'package:design_patterns/creational/abstract_factory/domain/views.dart';

abstract class ViewFactory {
  Button createButton();
  TextField createTextField();
}
