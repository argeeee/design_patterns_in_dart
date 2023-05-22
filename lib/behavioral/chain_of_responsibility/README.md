# Chain of Responsibility

The Chain of Responsibility design pattern is a behavioral pattern that allows an object to pass a request along a chain of potential handlers until the request is handled or reaches the end of the chain. Each handler in the chain has the ability to process the request or pass it to the next handler in the chain.

The Chain of Responsibility pattern decouples the sender of a request from its receivers, giving multiple objects an opportunity to handle the request without the sender having knowledge of which object will handle it. This promotes loose coupling and flexibility in the system's design.

Here are the key participants in the Chain of Responsibility pattern:
- Handler: This is an interface or an abstract class that defines the common methods for handling requests. It contains a reference to the next handler in the chain.
- ConcreteHandler: These are the actual handler implementations that process the requests. Each handler decides whether it can handle the request or not. If it can handle the request, it processes it; otherwise, it passes the request to the next handler in the chain.
- Client: This is the object that initiates the request and starts the chain. It doesn't need to know the specifics of the handlers in the chain, as it only interacts with the first handler.

The Chain of Responsibility pattern can be applied in various scenarios, such as:
- Request processing: When you have a series of processing steps or operations that need to be performed on a request, each step can be implemented as a handler in the chain. The request passes through the chain until it is handled completely.
- Event handling: When you have a hierarchy of event handlers, each handler in the chain can decide whether to handle the event or pass it to the next handler. This allows for flexible event processing and event propagation.
- Error handling: When you want to handle errors or exceptions in a systematic way, each handler in the chain can handle specific types of errors. If a handler can't handle the error, it can pass it to the next handler for further processing or escalation.

By using the Chain of Responsibility pattern, you can achieve a more flexible and dynamic approach to handling requests, as well as promoting code reusability and maintainability.

## Intent
Avoid coupling the sender of a request to its receiver by giving more than one
object a chance to handle the request. Chain the receiving objects and pass the
request along the chain until an object handles it.

## Applicability
Use Chain of Responsibility when
- more than one object may handle a request, and the handler isn't known a priori. The handler should be ascertainedautomatically.
- you want to issue a request to one ofseveral objectswithout specifyingthe receiver explicitly.
- the set of objects that can handle a request should be specified dynamically.

## Collaborations
. When a client issues a request, the request propagates along the chain until a ConcreteHandler object takes responsibility for handling it.

## Consequences
Chain of Responsibility has the following benefits and liabilities:
1. Reduced coupling. The pattern frees an object from knowing which other
object handles a request. An object only has to know that a request will be
handled "appropriately." Both the receiver and the sender have no explicit
knowledge of each other, and an object in the chain doesn't have to know
about the chain's structure.
As a result, Chain of Responsibility can simplify object interconnections.
Instead of objects maintaining references to all candidate receivers, they
keep a single reference to their successor.
2. Added flexibility in assigning responsibilities to objects. Chain of Responsibility
gives you added flexibility in distributing responsibilities among objects.
You can add or change responsibilities for handling a request by adding
to or otherwise changing the chain at run-time. You can combine this with
subclassing to specialize handlers statically.
3. Receipt isn't guaranteed. Since a request has no explicit receiver, there's no
guarantee it'll be handled—the request can fall off the end ofthe chain without
ever being handled. A request can also go unhandled when the chain is not
configured properly.