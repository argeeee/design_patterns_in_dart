# Adapter

The Adapter design pattern allows incompatible interfaces to work together by converting the interface of one class into another interface that the client expects. It acts as a bridge between two incompatible interfaces, making them compatible and enabling them to collaborate.

Here's a step-by-step explanation of the Adapter pattern:
1. Identify the target interface: This is the interface that the client expects to interact with. It defines the methods or operations that the client code uses.

2. Determine the existing class: This is the class that has an incompatible interface and needs to be adapted to work with the target interface.

3. Create an adapter class: The adapter class implements the target interface and wraps the existing class. It acts as a middleman between the client and the existing class, translating requests from the target interface into calls to the existing class.

4. Implement the adapter methods: In the adapter class, you implement the methods defined by the target interface. Inside these methods, you delegate the calls to the corresponding methods of the existing class.

5. Use the adapter: The client code interacts with the target interface through the adapter class, unaware of the underlying implementation or the need for adaptation.

## Intent
Convert the interface of a class into another interface clients expect. Adapter lets
classes work together that couldn't otherwise because of incompatible interfaces.

## Also Known As
Wrapper

## Applicability
Use the Adapter pattern when
- you want to use an existing class, and its interface does not match the one you need.
- you want to create a reusable class that cooperates with unrelated orunforeseen classes, that is, classes that don't necessarily have compatible interfaces.
- (object adapter only) you need to use several existing subclasses, but it's unpractical to adapt their interface by subclassing every one. An object adapter can adapt the interface of its parent class.