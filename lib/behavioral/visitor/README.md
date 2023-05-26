# Visitor

## Intent
Represent an operation to be performed on the elements of an object structure. Visitor lets you define a new operation without changing the classes of the elements on which it operates.

## Applicability
Use the Visitorpattern when
- an object structure contains many classes of objectswith differing interfaces,
and you want to perform operations on these objects that depend on their
concrete classes.
- manydistinct and unrelated operations need tobe performed on objectsinan
object structure, and you want to avoid "polluting" their classes with these
operations. Visitorlets you keep related operations together by definingthem
in one class. When the object structure is shared by many applications, use
Visitor to put operations in just those applications that need them.
- the classes defining the object structure rarely change, but you often want
to define new operations over the structure. Changing the object structure
classes requires redefining the interface to all visitors, which is potentially
costly. Ifthe object structure classes change often, then it's probably better to
define the operations in those classes.

## Participants
- Visitor
	- declares a Visit operation for each class of ConcreteElement in the object structure. Theoperation's name and signature identifiesthe class that sends the Visit request to the visitor. That lets the visitor determine the concrete class of the element being visited. Then the visitor can access the element directly through its particularinterface.
- ConcreteVisitor
	- implements each operation declared byVisitor.Eachoperation implements a fragment of the algorithm defined for the corresponding class of object in the structure. ConcreteVisitor provides the context for the algorithm and stores its local state. This state often accumulates results during the traversal of the structure.
- Element
	- defines an Accept operation that takes a visitor as an argument.
- ConcreteElement
	- implements an Accept operation that takes a visitor as an argument.
- ObjectStructure
	- can enumerate its elements.
	- mayprovide a high-level interface to allow the visitor to visit its elements.
	- may either be a composite or a collection such as a list or a set.

## Collaborations
- A client that uses the Visitor pattern must create a ConcreteVisitor object and
then traverse the object structure, visiting each element with the visitor.
- When an element is visited, it calls the Visitor operation that corresponds to
its class. The element supplies itself as an argument to this operation to let the
visitor access its state, if necessary.

## Consequences
Some of the benefits and liabilities of the Visitor pattern are asfollows:
1. Visitor makes adding newoperations easy.Visitorsmake it easy to add operations
that depend on the components of complex objects. You can define a new
operation over an object structure simply by adding a new visitor.In contrast,
if you spread functionality over many classes, then you must change each
class to define a new operation.
2. A visitor gathers related operations and separates unrelated ones. Related behavior isn't spread over the classes defining the object structure; it's localized in a visitor. Unrelated sets of behavior are partitioned in their own visitor
subclasses. That simplifies both the classes defining the elements and the al-
gorithms defined in the visitors. Any algorithm-specific data structures can
be hidden in the visitor.
3. Adding new ConcreteElement classes is hard. The Visitor pattern makesit hard
to add new subclasses of Element. Each new ConcreteElement gives rise to
a new abstract operation on Visitor and a corresponding implementation
in every ConcreteVisitor class. Sometimes a default implementation can be
provided in Visitorthat can be inherited by most ofthe ConcreteVisitors, but
this is the exception rather than the rule.
So the key consideration in applying the Visitor pattern is whether you are
mostly likely to change the algorithm applied over an object structure or
the classes of objects that make up the structure. The Visitor class hierarchy
can be difficult to maintain when new ConcreteElement classes are added
frequently. In such cases, it's probably easier just to define operations on the
classes that make up the structure. If the Element class hierarchy is stable,
but you are continually adding operations or changing algorithms, then the
Visitor pattern will help you manage the changes.
4. Visiting across class hierarchies. An iterator (see Iterator (257)) can visit the
objects in a structure as it traverses them by calling their operations. But an
iterator can't work across object structures with different types of elements.
5. Accumulating state. Visitors can accumulate state as they visit each element
in the object structure. Without a visitor, this state would be passed as extra
arguments to the operations that performthe traversal, or they might appear
as global variables.
6. Breaking encapsulation. Visitor's approach assumes that the ConcreteElement
interface is powerful enough to let visitors do their job.As a result, the pattern
often forces you to provide public operations that access an element's internal
state, which may compromise its encapsulation.

