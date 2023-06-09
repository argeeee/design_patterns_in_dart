# Command

The Command pattern is a behavioral design pattern that encapsulates a request as an object, thereby allowing you to parameterize clients with different requests, queue or log requests, and support undoable operations. It decouples the sender of a request from its receiver by encapsulating the request as an object.

The main components of the Command pattern are:
- Command: Declares an interface for executing operations.
- Concrete Command: Implements the Command interface and defines a binding between a Receiver object and an action.
- Receiver: Knows how to perform the operations associated with carrying out a request.
- Invoker: Asks the command to carry out the request.
- Client: Creates a Concrete Command object and sets its receiver.

## Intent
Encapsulate a request as an object, thereby letting you parameterize clients with
different requests, queue or log requests, and support undoable operations.

## Also Known As
Action, Transaction

## Applicability
Use the Command pattern when you want to
- parameterize objects by an actiontoperform, asMenultem objects did above.
You can express such parameterization in a procedural language with a
callback function, that is, a function that's registered somewhere to be called
at a later point. Commands are an object-oriented replacement for callbacks.
- specify, queue, and execute requests at different times. A Command object
can have a lifetime independent of the original request. If the receiver of a
request can be represented in an address space-independent way, then you
can transfer a command object for the request to a different process and fulfill
the request there.
- support undo. TheCommand's Execute operation can store state for revers-
ing its effects in the command itself. The Command interface must have an added Unexecute operation that reverses the effects of a previous call to Execute. Executedcommands are stored in a history list. Unlimited-level undo
and redo is achieved by traversing this list backwards and forwards calling
Unexecute and Execute,respectively.
- support logging changes so that they can be reapplied in case of a system crash. By augmenting the Command interface with load and store operations, you can keep a persistent log of changes. Recovering from a crash involves reloading logged commands from disk and reexecuting them with the Execute operation.
- structure a system around high-level operations built on primitives operations. Such a structure is common in informationsystems that support transactions. A transaction encapsulates a set of changes to data. The Command pattern offers a way to model transactions. Commands have a common in-
terface, letting you invoke all transactions the same way. The pattern also makes it easy to extend the system with new transactions.

## Collaborations
- The client creates a ConcreteCommand object and specifies itsreceiver.
- An Invoker object stores the ConcreteCommand object.

- The invoker issues a request by calling Execute on the command. When commands are undoable, ConcreteCommand stores state for undoing the com-
mand prior to invoking Execute.
- The ConcreteCommand object invokes operations on its receiver to carry out the request.
The following diagram showsthe interactionsbetween these objects. It illustrates how Command decouples the invoker from the receiver (and the request it carries out).

## Consequences
The Command pattern has the following consequences:
1. Command decouples the object that invokesthe operation from the one that
knows how to perform it.
2. Commands are first-class objects. They can be manipulated and extended
like any other object.
3. Youcan assemble commands into a composite command. An example is the
MacroCommand class described earlier. In general, composite commands
are an instance of the Composite (163) pattern.
4. It's easy to add new Commands, because you don't have to change existing classes.

