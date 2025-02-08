// state pattern:
/*
The State Pattern allows an object to change its behavior dynamically based
on its internal state, without modifying its code. It helps avoid complex if-else
or switch-case statements by encapsulating different behaviors in separate state classes.
*/

abstract class OrderState {
  void previous(Order order);
  void next(Order order);
  void printStatus();
}

class Order {
  OrderState _state;

  Order(this._state);

  void setState(OrderState state) {
    _state = state;
  }

  void previous(Order order) {
    _state.previous(order);
  }

  void next() {
    _state.next(this);
  }

  void printStatus() {
    _state.printStatus();
  }
}

class NewOrder implements OrderState {
  @override
  void next(Order order) {
    order.setState(ShippedState());
  }

  @override
  void previous(Order order) {
    print('This is the first state');
  }

  @override
  void printStatus() {
    print('New order');
  }
}

class ShippedState implements OrderState {
  @override
  void next(Order order) {
    order.setState(DeliveredState());
  }

  @override
  void previous(Order order) {
    order.setState(NewOrder());
    print('Order returned');
  }

  @override
  void printStatus() {
    print('Order shipped');
  }
}

class DeliveredState implements OrderState {
  @override
  void next(Order order) {
    print('This is the last state');
  }

  @override
  void previous(Order order) {
    order.setState(ShippedState());
  }

  @override
  void printStatus() {
    print('Order delivered');
  }
}

void main() {
  final order = Order(NewOrder());
  order.printStatus();
  order.next();
  order.printStatus();
  order.next();
  order.printStatus();
}
