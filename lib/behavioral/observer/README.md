# Observer

## Intent
Define a one-to-many dependency between objects so that when one object
changes state, all its dependents are notified and updated automatically.

## Also Known As
Dependents, Publish-Subscribe

## Applicability
Use the Observer pattern in any of the following situations:
- When an abstraction has two aspects, one dependent on the other. Encapsulating these aspects in separate objects lets you vary and reuse them independently.
- When a change to one object requires changing others, and you don't know how many objects need to be changed.
- When an object should be able to notify other objects without making assumptions about who these objects are.In other words, you don't want these objects tightly coupled.

## Participants
- Subject
	- knows its observers. Any number of Observer objects may observe a subject.
	- provides an interface for attachingand detaching Observer objects.
- Observer
	- defines an updating interface for objects that should be notified of changes in a subject.
- ConcreteSubject
	- stores state ofinterest toConcreteObserver objects.
	- sends a notification to its observers when itsstate changes.
- ConcreteObserver
	- maintains a reference to a ConcreteSubject object.
	- stores state that should stay consistent with the subject's.
	- implements the Observer updating interface to keep its state consistent with the subject's.

## Consequences
The Observer pattern lets you vary subjects and observers independently. You can reuse subjectswithout reusing their observers, and vice versa. It lets you add observers without modifying the subject or other observers. Further benefits and liabilities of the Observer pattern include the following:
1. Abstract coupling between Subject and Observer. All a subject knows is that it has a list of observers, each conforming to the simple interface of the abstract Observer class. The subject doesn't know the concrete class of any observer. Thus the coupling between subjects and observers is abstract and minimal. Because Subject and Observer aren't tightly coupled, they can belong to different layers of abstraction in a system. A lower-level subject can communicate and inform a higher-level observer, thereby keeping the system's layering intact. If Subject and Observer are lumped together, then the resulting object must either span two layers (and violate the layering), or itmust be forced to live in one layer or the other (whichmight compromise the layering abstraction).
2. Support for broadcast communication. Unlike an ordinary request, the notification that a subject sends needn't specify its receiver. The notification is broadcast automatically to all interested objects that subscribed to it. The subject doesn't care how many interested objects exist; its only responsibility is to notify its observers. This gives you the freedom to add and remove observers at any time.It's up to the observer to handle orignore a notification.
3. Unexpected updates. Because observers have no knowledge of each other's
presence, they can be blind to the ultimate cost of changing the subject. A seemingly innocuous operation on the subject may cause a cascade of updates to observers and their dependent objects. Moreover, dependency criteria that aren't well-defined or maintained usually lead to spurious updates, which can be hard to track down. This problem is aggravated by the fact that the simple update protocol provides no details on what changed in the subject. Without additional protocol to help observers discover what changed, they may be forced to work hard to deduce the changes.

