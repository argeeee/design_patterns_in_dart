# Memento

The Memento design pattern is a behavioral pattern that allows you to capture and restore an object's internal state without violating encapsulation. It provides a way to save and restore the state of an object, making it possible to revert back to a previous state.

The Memento pattern typically involves the following key components:
- Originator: It represents the object whose state needs to be saved and restored. It has methods to create a memento (capturing the current state) and to restore the state from a memento.
- Memento: It is an object that stores the state of the originator. It provides methods to retrieve the saved state but does not expose the actual state details to other objects.
- Caretaker: It is responsible for storing and managing the mementos. It requests mementos from the originator, stores them, and can also provide mementos back to the originator for restoring the state.

The Memento pattern allows you to capture the state of an object at a particular point in time and save it externally. This can be useful in scenarios where you need to implement undo/redo functionality, transactional systems, or checkpoints in an application.

## Intent
Without violating encapsulation, capture and externalize an object's internal state
so that the object can be restored to this state later.

## Also Known As
Token

## Applicability
Use the Memento pattern when
- a snapshot of (some portion of) an object's state must be saved so that it can be restored to that state later, and
- a direct interface to obtaining the state would expose implementation details and break the object's encapsulation.

## Consequences
The Memento pattern has several consequences:
1. Preserving encapsulation boundaries. Memento avoids exposing information that only an originator should manage but that must be stored nevertheless outside the originator. The pattern shields other objects from potentially complex Originator internals, thereby preserving encapsulation boundaries.
2. It simplifies Originator. In other encapsulation-preserving designs, Originator keeps the versions of internal state that clients have requested. That puts all the storage management burden on Originator. Having clients manage the state they ask for simplifies Originator and keeps clients from having to notify originators when they're done.
3. Using mementos might beexpensive. Mementosmight incur considerable overhead if Originator must copy large amounts of information to store in the memento or if clients create and return mementos to the originator often enough. Unless encapsulating and restoring Originator state is cheap, the pattern might not be appropriate.
4. Defining narrow and wide interfaces. It may be difficult in some languages to ensure that only the originator can accessthe memento's state.
5. Hidden costs in caring for mementos. A caretakeris responsible for deleting the mementos it cares for. However, the caretaker has no idea how much state is in the memento. Hence an otherwise lightweight caretaker might incur large storage costs when it stores mementos.