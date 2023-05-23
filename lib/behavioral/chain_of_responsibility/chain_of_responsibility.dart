// Handler interface
abstract class Approver {
  Approver? nextApprover;

  void setNextApprover(Approver approver) {
    nextApprover = approver;
  }

  void processRequest(PurchaseRequest request);
}

// ConcreteHandler
class TeamLead extends Approver {
  @override
  void processRequest(PurchaseRequest request) {
    if (request.amount <= 1000) {
      print("Team Lead approves purchase request #${request.requestNumber}.");
    } else if (nextApprover != null) {
      nextApprover!.processRequest(request);
    }
  }
}

// ConcreteHandler
class Manager extends Approver {
  @override
  void processRequest(PurchaseRequest request) {
    if (request.amount <= 5000) {
      print("Manager approves purchase request #${request.requestNumber}.");
    } else if (nextApprover != null) {
      nextApprover!.processRequest(request);
    }
  }
}

// ConcreteHandler
class Director extends Approver {
  @override
  void processRequest(PurchaseRequest request) {
    if (request.amount <= 10000) {
      print("Director approves purchase request #${request.requestNumber}.");
    } else {
      print(
        "Purchase request #${request.requestNumber} requires higher-level approval.",
      );
    }
  }
}

// PurchaseRequest class
class PurchaseRequest {
  int requestNumber;
  double amount;

  PurchaseRequest(this.requestNumber, this.amount);
}
