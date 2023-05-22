# Decorator

The Decorator pattern is a structural design pattern that allows behavior to be added to an individual object dynamically, without affecting the behavior of other objects from the same class. It provides a flexible alternative to subclassing for extending functionality.

The key idea behind the Decorator pattern is to wrap the original object inside a decorator object, which provides additional functionality or modifies the behavior of the original object. Both the original object and the decorator object implement the same interface, allowing the decorator to be used transparently wherever the original object is expected.

To better understand the Decorator pattern, let's explore its components:
1. Component: This is the common interface or abstract class that defines the methods that will be implemented by both the concrete component and the decorators.
2. Concrete Component: This is the original object to which additional functionality will be added dynamically.
3. Decorator: This is the abstract class that acts as the base class for all decorators. It maintains a reference to the component object and delegates the method calls to the component, potentially adding additional behavior before or after the delegation.
4. Concrete Decorators: These are the concrete classes that extend the decorator base class and add specific behavior or modifications to the component object.

By using the Decorator pattern, you can add or modify the behavior of an object at runtime, without changing its underlying structure or requiring subclasses. This allows for greater flexibility and promotes the principle of "composition over inheritance."

## Intent
Attach additional responsibilities to an object dynamically. Decorators provide a
flexible alternative to subclassing for extending functionality.

## Also Known As
Wrapper

## Applicability
Use Decorator
- to add responsibilities to individual objects dynamically and transparently, that is, without affecting other objects.
- forresponsibilities that canbe withdrawn.
- when extension by subclassing is impractical. Sometimes a large number of independent extensions are possible and would produce an explosion of subclasses to support every combination. Or a class definition maybe hidden or otherwise unavailable for subclassing.