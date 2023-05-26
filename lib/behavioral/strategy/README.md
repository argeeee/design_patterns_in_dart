# Strategy

## Intent
Define a family of algorithms, encapsulate each one, and make them interchangeable. Strategy lets the algorithm vary independently from clients that use it.

## Also Known As
Policy

## Applicability
Use the Strategy pattern when
- many related classes differ only in their behavior. Strategies provide a way
to configure a class with one of many behaviors.
- you need different variants of an algorithm. For example, you might de-
fine algorithms reflecting different space/time trade-offs. Strategies can be
used when these variants are implemented as a class hierarchy of algo-
rithms.
- an algorithm uses data that clients shouldn't know about. Use the Strategy
pattern to avoid exposing complex, algorithm-specific data structures.
- a class defines many behaviors, and these appear as multiple conditional
statements in its operations. Instead of many conditionals, move related
conditional branches into their own Strategy class.

## Participants
- Strategy
	- declares an interface common to all supported algorithms. Context uses this interface to call the algorithm defined by a ConcreteStrategy.
- ConcreteStrategy
	- implements the algorithm using the Strategy interface.
- Context
	- is configured with a ConcreteStrategy object.
	- maintains a reference to a Strategy object.
	- may define an interface that lets Strategy access its data.

## Collaborations
- Strategy and Context interact to implement the chosen algorithm. A context
may pass all data required by the algorithm to the strategy when the algorithm
is called. Alternatively, the context can pass itself as an argument to Strategy
operations. That lets the strategy call back on the context as required.
- A context forwards requests from its clients to its strategy. Clients usually
create and pass a ConcreteStrategy object to the context; thereafter, clients
interact with the contextexclusively.There is often a family ofConcreteStrategy
classes for a client to choose from.

## Consequences
The Strategy pattern has the following benefits and drawbacks:
1. Families of related algorithms. Hierarchies of Strategy classes define a family of
algorithms or behaviors for contextsto reuse. Inheritance can help factor out
common functionality of the algorithms.
2. An alternative to subclassing. Inheritance offers another way to support a
variety of algorithms or behaviors. You can subclass a Context class directly
to give it different behaviors. But this hard-wires the behavior into Context.It
mixes the algorithm implementation with Context's, making Context harder
to understand, maintain, and extend. And you can't vary the algorithm
dynamically. Youwind up with many related classes whose only difference
is the algorithm or behavior they employ. Encapsulating the algorithm in
separate Strategy classes lets you vary the algorithm independently of its
context, making it easier to switch, understand, and extend.
3. Strategies eliminate conditional statements. The Strategy pattern offers an alternative
to conditional statements for selecting desired behavior. When different
behaviors are lumped into one class, it's hard to avoid using conditional
statements to select the right behavior. Encapsulating the behavior in separate Strategy classes eliminates these conditional statements.
4. A choice of implementations. Strategies can provide different implementations
of the same behavior. The client can choose among strategies with different
time and space trade-offs.
5. Clients must be aware of different Strategies. The pattern has a potential draw-
back in that a client must understand how Strategies differ before it can
select the appropriate one. Clients might be exposed to implementation is-
sues. Therefore you should use the Strategy pattern only when the variation
in behavior isrelevant to clients.
6. Communication overhead between Strategy and Context. The Strategy interface
isshared by all ConcreteStrategy classes whether the algorithms they imple-
ment are trivial or complex. Hence it's likely that some ConcreteStrategies
won't use all the information passed to them through this interface; simple
ConcreteStrategies may use none of it!That means there will be times when
the context creates and initializes parameters that never get used. If this is
an issue, then you'll need tighter coupling between Strategy and Context.
7. Increased number of objects. Strategies increase the number of objects in an
application. Sometimes you can reduce this overhead by implementing
strategies as stateless objects that contexts can share. Any residual state is
maintained by the context, which passes it in each request to the Strategy
object. Shared strategies should not maintain state across invocations. The
Flyweight pattern describes this approach in more detail.