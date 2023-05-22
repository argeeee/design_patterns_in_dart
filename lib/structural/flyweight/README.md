# Flyweight

The Flyweight design pattern is a structural pattern that is used to minimize memory usage by sharing as much data as possible with other similar objects. It is suitable for scenarios where a large number of objects need to be created, but most of the data within those objects can be shared among them.

The main idea behind the Flyweight pattern is to separate the intrinsic state (shared data) and extrinsic state (unique data) of an object. The intrinsic state is stored in a shared flyweight object, while the extrinsic state is passed to the flyweight objects when needed.

By sharing the intrinsic state, the Flyweight pattern reduces memory consumption, as the shared data is stored only once and reused by multiple objects. This can greatly improve the performance and efficiency of an application, especially when dealing with a large number of objects.

Here are the key participants in the Flyweight pattern:
1. FlyweightFactory: This is a factory class that manages the creation and sharing of flyweight objects. It maintains a pool of flyweight objects and provides methods to retrieve or create flyweights based on certain criteria.
2. Flyweight: This is the interface or abstract class that defines the common methods for flyweight objects. It declares methods that can be used by both intrinsic and extrinsic states.
3. ConcreteFlyweight: This is the implementation of the Flyweight interface. It represents the shared flyweight object that stores the intrinsic state. Multiple instances of ConcreteFlyweight can be shared among different contexts.
4. Context: This represents the context or the unique state that is not shared among flyweight objects. It is passed to the flyweight objects when their methods are invoked.

The Flyweight pattern aims to strike a balance between memory efficiency and performance. By separating the shared and unique data, it minimizes memory usage and allows for better utilization of system resources.

The Flyweight pattern is commonly used in scenarios such as:
- Text editors or word processors, where a large number of character objects are needed, but most of the characters have the same intrinsic properties (e.g., font, size).
- Graphical user interfaces (GUI), where lightweight objects like icons or images need to be shared and reused in different parts of the interface.
- Game development, where objects like sprites or tiles with similar properties are reused across multiple game instances.

By applying the Flyweight pattern, you can optimize the memory usage of your application and improve its performance when dealing with a large number of objects with shared data.

## Intent
Use sharing to support large numbers of fine-grained objects efficiently.

## Applicability
The Flyweight pattern's effectiveness depends heavily on how and where it's
used. Apply the Flyweight pattern when allof the followingare true:
- An application uses a large number of objects.
- Storage costs are high because ofthe sheer quantity ofobjects.
- Most object state canbe made extrinsic.
- Many groups of objects may be replaced by relatively few shared objects once extrinsic state isremoved.
- The application doesn't depend on object identity. Since flyweight objects may be shared, identity tests will return true for conceptually distinct objects.

## Collaborations
- State that a flyweight needs tofunction must be characterized aseither intrinsic or extrinsic. Intrinsic state is stored in the ConcreteFlyweight object; extrinsic state is stored or computed by Client objects. Clients pass this state to the flyweight when they invoke its operations.
- Clients should notinstantiate ConcreteFlyweights directly.Clients must obtain ConcreteFlyweight objects exclusively from the FlyweightFactory object to ensure they are shared properly.

## Consequences
Flyweights may introduce run-time costs associated with transferring, finding, and/or computing extrinsic state, especially if it was formerly stored as intrinsic state. However, such costs are offset by space savings, which increase as more flyweights are shared. Storage savings are a function of several factors:
- the reduction in the total number of instances that comes from sharing
- the amount of intrinsic state per object
- whether extrinsic state is computed or stored.
The more flyweights are shared, the greater the storage savings. The savings
increase with the amount of shared state. The greatest savings occur when the
objects use substantial quantities of both intrinsic and extrinsic state, and the
extrinsic state can be computed rather than stored. Then you save on storage in
two ways: Sharing reduces the cost ofintrinsic state, and you trade extrinsic state
for computation time.
The Flyweight pattern is often combined with the Composite (163) pattern to
represent a hierarchicalstructure as a graph with shared leaf nodes. A consequence
of sharing isthat flyweightleaf nodes cannot store a pointerto their parent.Rather,
the parent pointer is passed to the flyweight as part of its extrinsic state. This has
a major impact on how the objects in the hierarchy communicate with each other.