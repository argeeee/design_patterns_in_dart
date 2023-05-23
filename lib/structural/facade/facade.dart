// Subsystem 1: Account
class Account {
  final String accountNumber;
  double balance;

  Account(this.accountNumber, this.balance);

  void deposit(double amount) {
    balance += amount;
    print('Deposited: \$${amount.toStringAsFixed(2)}');
  }

  void withdraw(double amount) {
    if (balance >= amount) {
      balance -= amount;
      print('Withdrawn: \$${amount.toStringAsFixed(2)}');
    } else {
      print('Insufficient balance');
    }
  }

  double getBalance() {
    return balance;
  }
}

// Subsystem 2: Notification
class Notification {
  void sendNotification(String message) {
    print('Notification sent: $message');
  }
}

// Facade
class BankingFacade {
  final Account account;
  final Notification notification;

  BankingFacade(this.account, this.notification);

  void deposit(double amount) {
    account.deposit(amount);
    notification.sendNotification(
      'Amount \$${amount.toStringAsFixed(2)} deposited',
    );
  }

  void withdraw(double amount) {
    account.withdraw(amount);
    notification.sendNotification(
      'Amount \$${amount.toStringAsFixed(2)} withdrawn',
    );
  }

  double getBalance() {
    return account.getBalance();
  }
}

// Client code
void main() {}
