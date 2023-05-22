# Facade

The Facade design pattern is a structural pattern that provides a simplified interface to a complex system of classes, making it easier to use and understand. It acts as a unified interface that encapsulates the underlying subsystems and provides a higher-level interface for the clients to interact with.

The main idea behind the Facade pattern is to hide the complexities of the subsystems and provide a simple interface that clients can use to access the functionality of the subsystems. It promotes loose coupling between the clients and the subsystems, allowing for easier maintenance and modification of the system.

The Facade pattern is useful in scenarios where a system consists of multiple subsystems with intricate relationships and interactions. By providing a simplified interface, the pattern reduces the complexity and minimizes the dependencies between the clients and the subsystems.

Here are the key participants in the Facade pattern:
- Facade: This is the central class that provides a simplified interface to the clients. It delegates the client requests to the appropriate subsystems and manages their interactions.
- Subsystems: These are the complex classes or modules that make up the underlying system. They perform specific tasks and have their own interfaces. The Facade class communicates with the subsystems to fulfill client requests.
- Client: This is the class or module that interacts with the Facade to access the functionality of the subsystems. The client doesn't need to know about the complexities of the subsystems, as it only uses the simplified interface provided by the Facade.

The Facade pattern promotes encapsulation, abstraction, and simplification. It helps to hide the implementation details of the subsystems and provides a high-level interface that is more convenient for the clients to use.

By using the Facade pattern, you can achieve the following benefits:
- Simplified interface: The Facade provides a single, simplified interface to the clients, hiding the complexities of the underlying subsystems. This makes it easier for clients to use the system.
- Decoupling: The Facade decouples the clients from the subsystems, reducing dependencies and promoting better maintainability and modifiability.
- Code organization: The Facade acts as a central point of control and coordination for the subsystems, providing a structured and organized approach to the system design.
- Complexity management: The Facade pattern is especially useful when dealing with large and complex systems. It helps to manage and reduce the overall complexity by providing a higher-level interface.

Overall, the Facade design pattern simplifies the usage of complex subsystems by providing a clean and concise interface. It improves code readability, maintainability, and modifiability by encapsulating the complexities of the system.

## Intent
Provide a unified interface to a set of interfaces in a subsystem. Facade defines a higher-level interface that makes the subsystem easier to use.

## Applicability
Use the Facadepattern when
- you want to provide a simple interface to a complexsubsystem. Subsystems often get more complex as they evolve. Most patterns, when applied, result in more and smaller classes. This makes the subsystem more reusable and easier to customize, but it also becomes harder to use for clients that don't need to customize it. A facade can provide a simple default view of the subsystem that is good enough for most clients. Only clients needing more customizability will need to look beyond the facade.
- there aremany dependencies between clients and theimplementation classes of an abstraction.Introduce a facade to decouple the subsystem from clients and other subsystems, thereby promoting subsystem independence and portability.
- you want to layer your subsystems. Use a facade to define an entry point to each subsystem level. If subsystems are dependent, then you can simplify the dependencies between them by making them communicate with each other solely through their facades.

## Collaborations
- Clients communicatewith the subsystem by sending requeststoFacade,which forwards themto the appropriate subsystem object(s). Although the subsystem objects perform the actualwork, the facade may have to do work ofits own to translate its interface to subsystem interfaces.
- Clients that use the facade don't have to access its subsystem objects directly.

## Consequences
The Facade pattern offers the following benefits:
1. It shields clients from subsystem components, thereby reducing the number of objects that clients deal with and making the subsystem easier to use.
2. It promotes weak coupling between the subsystem and its clients. Often the components in a subsystem are strongly coupled. Weak coupling lets you vary the components of the subsystem without affecting its clients. Facades help layer a system and the dependencies between objects. They can eliminate complexor circulardependencies. This canbe an important consequence when the client and the subsystem are implemented independently. Reducing compilation dependencies is vital in large software systems.You want to save time by minimizing recompilation when subsystem classes change. Reducing compilation dependencies with facades can limit the re-
compilation needed for a small change in an important subsystem. A facade can also simplify porting systems to other platforms, because it's less likely that building one subsystem requires building all others.
3. It doesn't prevent applicationsfrom using subsystem classes if they need to. Thus you can choose between ease of use and generality.

