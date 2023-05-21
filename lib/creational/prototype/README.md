# Prototype

## Intent
Specify the kinds of objects to create using a prototypical instance, and create new
objects by copying this prototype.

## Motivation
This is an example that demonstrates the usage of the Prototype design pattern in a simplified scenario of a shape drawing application:

Let's say you have a shape drawing application that allows users to create and manipulate different types of shapes, such as circles and rectangles. Each shape has various properties (e.g., position, size, color) that can be customized by the user. To support the creation of new shapes efficiently, you can use the Prototype pattern.

## Applicability
Use the Prototype pattern when a system should be independent of how its
products are created, composed, and represented; and
- when the classes to instantiate are specified at run-time, for example, by dynamic loading; or
- to avoid building a class hierarchy offactories that parallels the class hierarchy of products; or
- when instances of a class can have one of only a few different combinations of state. It may be more convenient to install a corresponding number of prototypes and clone them rather than instantiating the class manually, each time with the appropriate state.
