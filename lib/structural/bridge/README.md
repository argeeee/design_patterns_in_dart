# Bridge

The Bridge design pattern is used to decouple an abstraction from its implementation, allowing them to vary independently. It separates the interface (abstraction) and the implementation into separate hierarchies, providing flexibility in adding new abstractions or implementations without modifying the existing code.

Here's a step-by-step explanation of the Bridge pattern:
1. Identify the two orthogonal dimensions: The Bridge pattern typically involves two separate hierarchies: the abstraction and the implementation. The abstraction represents the high-level interface that clients interact with, while the implementation represents the low-level details that the abstraction depends on.
2. Define the abstraction: Create an abstract class or interface that defines the high-level interface or functionality expected by clients. The abstraction contains a reference to the implementation object.
3. Define the implementation: Create an interface or abstract class that defines the low-level implementation details. It should have methods that can be called by the abstraction.
4. Create concrete implementations: Implement the low-level functionality in different concrete classes that inherit from the implementation interface or abstract class.
5. Implement the abstraction: Create concrete subclasses of the abstraction class and implement the high-level functionality using the methods provided by the implementation.
6. Decouple the abstraction and implementation: The abstraction class should delegate the implementation-specific tasks to the implementation object, allowing them to vary independently.

## Applicability
Use the Bridge pattern when
- you want to avoid a permanent binding between an abstraction and itsimplementation. This might be the case, for example,when the implementation must be selected or switched at run-time.
- both the abstractions and their implementations should be extensible by subclassing. In this case, the Bridge pattern lets you combine the different abstractions and implementations and extend them independently.
- changes in the implementation of an abstraction should have no impact on clients; that is, their code should not have to be recompiled.