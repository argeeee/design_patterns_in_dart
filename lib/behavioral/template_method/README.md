# Template method

## Intent
Define the skeleton of an algorithm in an operation, deferring some steps to
subclasses.Template Method letssubclassesredefine certain steps of an algorithm
without changing the algorithm's structure.

## Applicability
The Template Method pattern should be used
- to implement the invariant parts of an algorithm once and leave it up to
subclasses to implement the behavior that can vary.
- when common behavior among subclasses should be factored and localized
in a common class to avoid code duplication. This is a good example of
"refactoring to generalize" as described by Opdyke and Johnson.
You first identify the differences in the existing code and then separate the
differences into new operations. Finally, you replace the differing code with
a template method that calls one of these new operations.
- to control subclasses extensions. You can define a template method that calls
"hook" operations (see Consequences) at specific points, thereby permitting
extensions only at those points.

## Participants
- AbstractClass
	- defines abstract primitive operations that concrete subclasses define to implement steps of an algorithm.
	- implements a template method defining the skeleton of an algorithm. The template method calls primitive operations as well as operations defined in AbstractClass or those of other objects.
- ConcreteClass (MyApplication)
	- implements the primitive operations to carry outsubclass-specific steps of the algorithm.

## Collaborations
- ConcreteClass relies on AbstractClass to implement the invariant steps ofthe
algorithm.

## Consequences
Template methods are a fundamental technique for code reuse. They are partic-
ularly important in class libraries, because they are the means for factoring out

common behavior in library classes.
Template methods lead to an inverted control structure that'ssometimes referred
to as "the Hollywood principle," that is, "Don't call us, we'll call you".
This refers to how a parent class calls the operations of a subclass and not the
other way around.
Template methods call the following kinds of operations:
- concrete operations (either on the ConcreteClass or on client classes);
- concrete AbstractClass operations (i.e., operations that are generally useful
to subclasses);
- primitive operations (i.e., abstract operations);
- factory methods (see Factory Method (107)); and
- hook operations, which provide default behavior that subclasses can extend
if necessary. A hook operation often does nothing by default.
It's important for template methods to specify which operations are hooks (may
be overridden) and which are abstract operations (must be overridden). To reuse
an abstract class effectively, subclass writers must understand which operations
are designed for overriding.