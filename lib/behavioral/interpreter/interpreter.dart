// Abstract Expression
abstract class Expression {
  int interpret();
}

// Terminal Expression
class NumberExpression implements Expression {
  int value;

  NumberExpression(this.value);

  @override
  int interpret() {
    return value;
  }
}

// Non-terminal Expressions
class AdditionExpression implements Expression {
  Expression left;
  Expression right;

  AdditionExpression(this.left, this.right);

  @override
  int interpret() {
    return left.interpret() + right.interpret();
  }
}

class SubtractionExpression implements Expression {
  Expression left;
  Expression right;

  SubtractionExpression(this.left, this.right);

  @override
  int interpret() {
    return left.interpret() - right.interpret();
  }
}

class MultiplicationExpression implements Expression {
  Expression left;
  Expression right;

  MultiplicationExpression(this.left, this.right);

  @override
  int interpret() {
    return left.interpret() * right.interpret();
  }
}

class DivisionExpression implements Expression {
  Expression left;
  Expression right;

  DivisionExpression(this.left, this.right);

  @override
  int interpret() {
    return left.interpret() ~/ right.interpret();
  }
}

// Client
void main() {}
