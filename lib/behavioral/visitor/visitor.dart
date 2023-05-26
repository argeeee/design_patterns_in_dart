// Abstract Syntax Tree Nodes
abstract class Expression {
  void accept(ExpressionVisitor visitor);
}

class Number implements Expression {
  final int value;

  Number(this.value);

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitNumber(this);
  }
}

class Addition implements Expression {
  final Expression left;
  final Expression right;

  Addition(this.left, this.right);

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitAddition(this);
  }
}

class Subtraction implements Expression {
  final Expression left;
  final Expression right;

  Subtraction(this.left, this.right);

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitSubtraction(this);
  }
}

// Visitor interface
abstract class ExpressionVisitor {
  void visitNumber(Number number);
  void visitAddition(Addition addition);
  void visitSubtraction(Subtraction subtraction);
}

// Concrete visitor: ExpressionEvaluator
class ExpressionEvaluator implements ExpressionVisitor {
  int result = 0;

  @override
  void visitNumber(Number number) {
    result = number.value;
  }

  @override
  void visitAddition(Addition addition) {
    addition.left.accept(this);
    final int leftResult = result;

    addition.right.accept(this);
    final int rightResult = result;

    result = leftResult + rightResult;
  }

  @override
  void visitSubtraction(Subtraction subtraction) {
    subtraction.left.accept(this);
    final int leftResult = result;

    subtraction.right.accept(this);
    final int rightResult = result;

    result = leftResult - rightResult;
  }
}
