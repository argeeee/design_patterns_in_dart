# Mediator

The Mediator design pattern is a behavioral pattern that promotes loose coupling between components by encapsulating their interaction within a central mediator object. It allows components to communicate with each other through the mediator instead of directly interacting with one another. The mediator acts as a coordinator and controls the communication and collaboration between the components.

The Mediator pattern typically involves the following key components:
- Mediator: It defines an interface that facilitates communication between components. It typically declares methods that components can use to send messages and receive notifications.
- Concrete Mediator: It implements the mediator interface and coordinates the communication between components. It maintains references to the components and manages their interaction.
- Colleague: It represents a component that interacts with other components through the mediator. It maintains a reference to the mediator and uses it to send messages or receive notifications.

The Mediator pattern helps to reduce the direct dependencies between components by introducing a central mediator that handles the communication logic. This promotes the decoupling of components and simplifies their individual implementation.

## Intent
Define an object that encapsulateshow a set of objects interact. Mediator promotes
loose coupling by keeping objects from referring to each other explicitly, and it
lets you vary their interaction independently.

## Applicability
Use the Mediator pattern when
- a set of objects communicatein well-defined but complexways.The resulting interdependencies are unstructured and difficult to understand.
- reusing an object is difficult because itrefers to and communicateswithmany other objects.
- a behavior that's distributed between several classes should be customizable without a lot of subclassing.

## Collaborations
- Colleagues send and receive requests from a Mediator object. The mediator implements the cooperative behavior by routing requests between the appropriate colleague(s).

## Consequences
The Mediator pattern has the followingbenefits and drawbacks:
1. It limits subclassing. A mediator localizes behavior that otherwise would be distributed among several objects. Changing this behavior requires subclassing Mediator only; Colleague classes can be reused as is.
2. It decouples colleagues. A mediator promotes loose coupling between colleagues. You can vary and reuse Colleague and Mediator classes independently.
3. It simplifies object protocols. A mediator replaces many-to-many interactions with one-to-many interactions between the mediator and its colleagues. One-to-many relationships are easier to understand, maintain, and extend.
4. It abstracts how objects cooperate. Making mediation an independent concept and encapsulating it in an object lets you focus on how objectsinteract apart from their individual behavior. That can help clarify how objectsinteract in a system.
5. It centralizes control. The Mediator pattern trades complexity of interaction for complexity in the mediator. Because a mediator encapsulates protocols, it can become more complex than any individual colleague. This can make the mediator itself a monolith that's hard to maintain.