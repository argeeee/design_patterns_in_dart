# Factory Method

## Intent
Define an interface for creating an object, but let subclasses decide which class to
instantiate. Factory Method lets a class defer instantiation to subclasses.

## Also Known As
Virtual Constructor


## Motivation

This is an example that demonstrates the usage of the Factory Method design pattern in a simplified scenario of a logging library:

Let's say you have a logging library that supports multiple logging providers (e.g., ConsoleLogger, FileLogger, NoLogger). The library needs to allow users to choose the logging provider they want to use dynamically