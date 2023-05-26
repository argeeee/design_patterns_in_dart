# State

## Intent
Allow an object to alter its behavior when its internal state changes. The object
will appear to change its class.

## Also Known As
Objects for States

## Applicability
Use the State pattern in either of the following cases:
- An object's behavior depends on its state, and it must change its behavior at run-time depending on that state.
- Operations have large, multipart conditional statements that depend on the object's state. This state is usually represented by one or more enumerated constants. Often, several operations will contain this same conditional structure. The Statepattern puts each branch of the conditional in a separate class. This lets you treat the object's state as an object in its own right that can vary independently from other objects.

## Participants
- Context
	- defines the interface ofinterest to clients.
	- maintains an instance of a ConcreteState subclass that defines the current state.
- State
	- defines an interface for encapsulating the behavior associated with a particular state of the Context.
- ConcreteState subclasses
	- each subclassimplements a behavior associated with a state of the Context.

## Collaborations
- Context delegates state-specific requests to the current ConcreteState object.
- A context may pass itself as an argument to the State object handling the
request. This lets the State object access the context if necessary.
- Context isthe primary interface for clients.Clients canconfigure a context with
State objects. Once a context is configured, its clients don't have to deal with
the State objects directly.
- EitherContextortheConcreteState subclasses candecide which state succeeds
another and under what circumstances.


## Consequences
The State pattern has the following consequences:
1. It localizes state-specific behavior and partitions behavior for different states. The
State pattern puts all behavior associated with a particular state into one
object. Because allstate-specific code livesin a State subclass, new states and
transitions can be added easily by defining new subclasses. An alternative is to use data values to define internal states and have Con-
text operations check the data explicitly.But then we'd have look-alike con-
ditional or case statements scattered throughout Context's implementation.
Adding a new state could require changing several operations, which com-
plicatesmaintenance.
The State pattern avoids this problem but might introduce another, because
the pattern distributes behavior for different states across several State subclasses. This increasesthe number of classes and isless compact than a single
class. But such distribution is actually good if there are many states, which
would otherwise necessitate large conditional statements.
Like long procedures, large conditional statements are undesirable. They're
monolithic and tend to make the code less explicit, which in turn makes
them difficult to modify and extend. The State pattern offers a better way to
structure state-specific code. The logic that determines the state transitions
doesn't reside in monolithic if or switch statements but instead is parti-
tioned between the State subclasses. Encapsulating each state transition and
action in a class elevates the idea of an execution state to full object status.
That imposes structure on the code and makesits intent clearer.
2. It makes state transitions explicit. When an object defines its current state solely
in terms of internal data values, its state transitions have no explicit representation; they only show up as assignments to some variables. Introducing separate objects for different states makes the transitions more explicit.
Also, State objects can protect the Context from inconsistent internal states,
because state transitions are atomic from the Context's perspective—they
happen by rebinding one variable (the Context's State object variable), not
several.
3. State objects can beshared. If State objects have no instance variables—that is,
the state they represent is encoded entirely in their type—then contexts can
share a State object. When states are shared in this way, they are essentially
flyweights with no intrinsic state, only behavior.

