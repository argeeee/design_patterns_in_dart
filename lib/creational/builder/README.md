# Builder

## Intent
Separate the construction of a complex object from its representation so that the
same construction process can create different representations.

## Motivation
An example of using the Builder design pattern to construct a complex object: a Pizza ordering system.

In this example, we've used the Builder pattern to construct different types of pizzas. The PizzaDirector class acts as the director, while the PizzaBuilder classes act as concrete builders. By configuring the director with a specific builder, we can construct pizzas with different crusts, sauces, and toppings.

## Applicability
Use the Builder pattern when
- the algorithm for creating a complex object should be independent of the parts that make up the object and how they're assembled.
- the construction process must allow different representations for the object that's constructed.

## Collaborations
- The client creates the Director object and configuresit with the desired Builder object.
- Director notifiesthe builder whenever a part ofthe product should be built.
- Builder handles requests from the director and adds parts to the product.
- Theclient retrieves the product from the builder. The followinginteraction diagram illustrates how Builder and Director cooperate with a client.

## Consequences
Here are key consequences of the Builder pattern:
1. It lets you vary a product's internal representation. The Builder object provides the director with an abstract interface for constructing the product. The interface lets the builder hide the representation and internal structure of the product. It also hides how the product gets assembled. Because the product is constructed through an abstract interface, all you have to do to change the product's internal representation is define a new kind of builder.
2. It isolates code for construction and representation. The Builder pattern improves modularity by encapsulating the way a complex object is constructed and represented. Clients needn't know anything about the classes that define the product's internal structure; such classes don't appear in Builder's interface. Each ConcreteBuilder contains all the code to create and assemble a particular kind of product. The code is written once; then different Directors can reuse it to build Product variants from the same set of parts.
3. It gives you finer control over the construction process. Unlike creational patterns that construct products in one shot, the Builder pattern constructs the product step by step under the director's control. Only when the product is finished does the director retrieve it from the builder. Hence the Builder interface reflects the process of constructing the product more than other creational patterns. This gives you finer control over the construction process and consequently the internal structure of the resulting product.

