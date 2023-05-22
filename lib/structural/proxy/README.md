# Proxy

The Proxy design pattern is a structural pattern that provides a surrogate or placeholder for another object to control its access or provide additional functionality. The proxy acts as an intermediary between the client and the real object, allowing the client to interact with the object indirectly.

The Proxy pattern can be useful in scenarios where you want to add an extra layer of control or functionality to an object, without modifying its core implementation. It allows you to manage access to the real object, perform additional operations before or after accessing it, and provide a level of abstraction or security.

Here are the key participants in the Proxy pattern:
- Subject: This is the common interface or abstract class that both the real object and proxy implement. It defines the methods that the client can invoke on the real object.
- RealSubject: This is the real object that the proxy represents. It provides the actual implementation of the subject's methods.
- Proxy: This is the surrogate object that acts as a wrapper around the real object. It implements the subject interface and forwards the client's requests to the real object. The proxy can add additional behavior before or after forwarding the requests.

The Proxy pattern can be applied in various scenarios, such as:
- Remote Proxy: The proxy provides a local representation of an object that resides in a remote system or network. It handles the communication and data transfer between the client and the remote object.
- Virtual Proxy: The proxy creates expensive objects on-demand to improve performance and resource utilization. It acts as a placeholder until the real object is needed.
- Protection Proxy: The proxy controls the access to the real object and enforces security measures or restrictions. It can perform authentication, authorization, or other access control mechanisms.
- Logging Proxy: The proxy intercepts and logs method invocations on the real object for debugging, auditing, or performance monitoring purposes.

By using the Proxy pattern, you can add additional functionality or control to objects without modifying their core implementation. This promotes separation of concerns and enhances code reusability and maintainability.


## Intent
Provide a surrogate or placeholder for another object to control access to it.

## Also Known As
Surrogate

## Applicability
Proxy is applicable whenever there is a need for a more versatile or sophisticated
reference to an object than a simple pointer. Here are several common situations
in which the Proxy pattern is applicable:
1. A remote proxy provides a local representative for an object in a different address space. NEXTSTEP [Add94]uses the class NXProxy for this purpose. Coplien [Cop92]calls this kind of proxy an "Ambassador."
2. A virtual proxy creates expensive objects on demand. The ImageProxy described in the Motivation is an example of such aproxy.
3. A protection proxy controls access to the original object. Protection proxies are useful when objects should have different access rights. For example, KernelProxies in the Choices operating system [CIRM93] provide protected
access to operating system objects.
4. A smart reference is a replacement for a bare pointer that performs additional actions when an object is accessed. Typical uses include
- counting the number of references to the real object so that it can be freed automatically when there are no more references (also called smart pointers [Ede92]).
- loading a persistent object into memory when it's first referenced.
- checking that the real object is locked before it's accessed to ensure that no other object can change it.

## Collaborations
- Proxy forwards requests to RealSubject when appropriate, depending on the kind of proxy.

## Consequences
The Proxy pattern introduces a level of indirection when accessing an object. The additional indirection has many uses, depending on the kind of proxy:
1. A remote proxy can hide the fact that an object resides in a different address space.
2. A virtual proxy can perform optimizations such as creating an object on demand.
3. Bothprotection proxies and smart references allow additional housekeeping tasks when an object is accessed.

There's another optimization that the Proxy pattern can hide from the client. It's called copy-on-write,and it's related to creation on demand. Copying a large and complicated object can be an expensive operation. If the copy is never modified, then there's no need to incur this cost. Byusing a proxy to postpone the copying process, we ensure that we pay the price of copying the object only ifit's modified. To make copy-on-write work, the subjectmust be reference counted. Copying the
proxy will do nothing more than increment this reference count. Only when the
client requests an operation that modifiesthe subjectdoes the proxy actuallycopy
it. In that case the proxy must also decrement the subject's reference count. When
the reference count goes to zero, the subject gets deleted.
Copy-on-write can reduce the cost of copying heavyweight subjects significantly.