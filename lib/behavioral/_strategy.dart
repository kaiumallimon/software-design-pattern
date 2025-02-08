/*
The Strategy Pattern defines a family of algorithms, encapsulates them in separate classes, 
and makes them interchangeable at runtime.
This helps avoid if-else or switch-case statements and allows selecting a behavior dynamically.
*/

abstract class PaymentStrategy {
  void pay(double amount);
}

class CreditCardPay implements PaymentStrategy {
  final String cardNumber;

  CreditCardPay({required this.cardNumber});

  @override
  void pay(double amount) {
    print('Paying $amount using Credit Card $cardNumber');
  }
}

class PayPalPay implements PaymentStrategy {
  final String email;

  PayPalPay({required this.email});
  @override
  void pay(double amount) {
    print('Paying $amount using PayPal $email');
  }
}

class PaymentContext {
  void pay(double amount, {PaymentStrategy? paymentStrategy}) {
    if (paymentStrategy != null) {
      paymentStrategy.pay(amount);
      return;
    }

    print('No payment strategy selected, payment failed');
  }
}

void main() {
  final paymentContext = PaymentContext();
  paymentContext.pay(100);

  paymentContext.pay(100,
      paymentStrategy: CreditCardPay(cardNumber: '1234 5678 9012 3456'));
}
