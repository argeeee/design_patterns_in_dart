# Interpreter

The Interpreter design pattern is a behavioral pattern that is used to define a grammatical representation of a language and provides a way to evaluate or interpret sentences in that language. It is commonly used to solve problems related to interpreting or evaluating expressions, rules, or scripts.

The Interpreter pattern typically involves the following key components:
- Abstract Expression: It defines an interface or abstract base class for all the expressions in the language. It usually declares an interpret method that takes a context as input and defines the interpretation behavior.
- Terminal Expression: It represents the basic building blocks of the language. These expressions do not have any sub-expressions and provide the implementation for the interpret method defined in the abstract expression.
- Non-terminal Expression: It represents complex expressions that consist of one or more sub-expressions. These expressions delegate the interpretation to their sub-expressions and define their own interpretation logic.
- Context: It contains information or state that is used during the interpretation process. It is passed to the expressions for evaluation.
- Client: It builds the abstract syntax tree (AST) of the language using the expressions and executes the interpretation by invoking the interpret method on the root expression.

The Interpreter pattern is particularly useful when you have a language or domain-specific problem that can be represented as a grammar. It allows you to create an interpreter that can evaluate and process sentences in that language efficiently.

## Intent
Given a language, define a represention forits grammar along with an interpreter
that uses the representation to interpret sentences in the language.

## Applicability
Use the Interpreter pattern when there is a language to interpret, and you can
represent statements in the language as abstract syntax trees. The Interpreter
pattern works best when
- the grammar is simple. For complex grammars, the class hierarchy for the
grammar becomes large and unmanageable. Tools such as parser generators
are a better alternative in such cases. They can interpret expressions without
building abstract syntax trees, which can save space and possibly time.
- efficiency is not a critical concern. Themost efficient interpreters are usually
not implemented by interpreting parse trees directly but by first translating them into another form. For example, regular expressions are often transformed into state machines. But even then, the translator can be implemented by the Interpreter pattern, so the pattern is still applicable.

## Collaborations

- The client builds (oris given) the sentence as an abstract syntax tree of NonterminalExpression and TerminalExpression instances. Then the client initializes the context and invokes the Interpret operation.
- Each NonterminalExpression node defines Interpret in terms of Interpret on each subexpression. The Interpret operation of each TerminalExpression defines the base case in the recursion.
- The Interpret operations at each node use the context to store and access the state of the interpreter.

## Consequences

The Interpreter pattern has the following benefits and liabilities:
1. It's easy to change and extend the grammar. Because the pattern uses classes to represent grammar rules, you can use inheritance to change or extend the grammar. Existing expressions can be modified incrementally, and new expressions can be defined as variations on old ones.
2. Implementing the grammar is easy, too.Classes defining nodes in the abstract
syntax tree have similar implementations.These classes are easy to write, and
often their generation can be automated with a compiler or parser generator.
3. Complex grammars arehard to maintain. The Interpreter pattern defines at least
one class for every rule in the grammar (grammar rules defined using BNF
may require multiple classes). Hence grammars containing many rules can
be hard to manage and maintain. Other design patterns can be applied to
mitigate the problem (see Implementation). But when the grammar is very
complex, other techniques such as parser or compiler generators are more
appropriate.
4. Adding new ways to interpret expressions. The Interpreter pattern makes it
easier to evaluate an expression in a new way.For example, you can support
pretty printing or type-checking an expression by defining a new operation
on the expression classes. If you keep creating new ways of interpreting an
expression, then consider using the Visitor (331) pattern to avoid changing
the grammar classes.

