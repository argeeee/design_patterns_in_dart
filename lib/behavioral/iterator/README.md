# Iterator

The Iterator design pattern is a behavioral pattern that provides a way to access elements of an aggregate object sequentially without exposing its underlying representation. It allows you to traverse the elements of a collection in a systematic and consistent manner, regardless of the specific implementation of the collection.

The Iterator pattern typically involves the following key components:
- Iterator Interface: It defines the common operations that can be performed on the collection, such as retrieving the next element, checking if there are more elements, and resetting the iterator.
- Concrete Iterator: It implements the iterator interface and provides the specific implementation for traversing the elements of the collection.
- Aggregate Interface: It defines the interface for the collection object, which may include operations for creating an iterator or accessing elements.
- Concrete Aggregate: It implements the aggregate interface and provides the specific implementation for creating an iterator that can traverse the elements of the collection.
- Client: It uses the iterator to traverse the elements of the collection without being aware of the underlying structure of the collection.

The Iterator pattern is particularly useful when you want to iterate over a collection of objects without exposing its internal details. It decouples the iteration logic from the collection, allowing the collection to change its structure or implementation without affecting the client code.

## Intent
Provide a way to access the elements of an aggregate object sequentially without
exposing its underlying representation.

## Also Known As
Cursor

## Applicability
Use the Iterator pattern
- to access an aggregate object's contents without exposing its internal representation.
- to support multiple traversals of aggregate objects.
- to provide a uniform interface for traversing different aggregate structures (that is, to support polymorphic iteration).

## Collaborations
- A Concretelterator keeps track of the current object in the aggregate and can compute the succeeding object in the traversal.

## Consequences
The Iterator pattern has three important consequences:
1. It supports variations in the traversal of an aggregate. Complex aggregates may be traversed in many ways. For example, code generation and semantic checking involve traversing parse trees. Code generation may traverse the parse tree inorder or preorder. Iterators make it easy to change the traversal algorithm: Just replace the iterator instance with a different one. Youcan also define Iterator subclasses to support new traversals.
2. Iterators simplify the Aggregate interface. Iterator's traversal interface obviates the need for a similar interface in Aggregate, thereby simplifying the aggregate's interface.
3. More than one traversal can be pending on an aggregate. An iterator keeps track of its own traversal state. Therefore you can have more than one traversal in progress at once.

