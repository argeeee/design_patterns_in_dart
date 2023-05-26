// Strategy
abstract class PaymentStrategy {
  void pay(double amount);
}

// Concrete Strategies
class CreditCardPaymentStrategy implements PaymentStrategy {
  String cardNumber;
  String cvv;

  CreditCardPaymentStrategy(this.cardNumber, this.cvv);

  @override
  void pay(double amount) {
    // Perform credit card payment logic
    print('Paid $amount with Credit Card');
  }
}

class PayPalPaymentStrategy implements PaymentStrategy {
  String email;
  String password;

  PayPalPaymentStrategy(this.email, this.password);

  @override
  void pay(double amount) {
    // Perform PayPal payment logic
    print('Paid $amount with PayPal');
  }
}

class BankTransferPaymentStrategy implements PaymentStrategy {
  String accountNumber;

  BankTransferPaymentStrategy(this.accountNumber);

  @override
  void pay(double amount) {
    // Perform bank transfer payment logic
    print('Paid $amount with Bank Transfer');
  }
}

// Context
class PaymentProcessor {
  PaymentStrategy? paymentStrategy;

  void setPaymentStrategy(PaymentStrategy strategy) {
    paymentStrategy = strategy;
  }

  void processPayment(double amount) {
    if (paymentStrategy != null) {
      paymentStrategy!.pay(amount);
    } else {
      print('No payment strategy set');
    }
  }
}
