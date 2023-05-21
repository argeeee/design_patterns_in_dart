# Singleton

## Intent
Ensure a class only has one instance, and provide a global point of access to it.

## Motivation
Certainly! Here's a real-world example that demonstrates the usage of the Singleton design pattern in a simplified scenario of a configuration manager:

Let's say you have a configuration manager in your application that is responsible for loading and providing access to application configuration settings. The configuration settings need to be shared across different components of the application, and it is crucial to have a single instance of the configuration manager to maintain consistency.

## Applicability
Use the Singleton pattern when
- there must be exactly one instance of a class, and it must be accessible to clients from a well-known access point.
- when the sole instance should be extensible by subclassing, and clients should be able to use an extended instance without modifying their code.