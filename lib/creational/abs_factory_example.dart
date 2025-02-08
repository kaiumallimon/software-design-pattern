/*
In travel site, we can book train ticket as well bus tickets and 
flight ticket. In this case user can give his travel type as ‘bus’,
‘train’ or ‘flight’.
*/

abstract class Ticket {
  void show();
}

class TrainTicket extends Ticket {
  @override
  void show() {
    print('Train ticket');
  }
}

class BusTicket extends Ticket {
  @override
  void show() {
    print('Bus ticket');
  }
}

class FlightTicket extends Ticket {
  @override
  void show() {
    print('Flight ticket');
  }
}

abstract class BookingFactory {
  Ticket bookTicket();
}

class BookTrainTicket extends BookingFactory {
  @override
  Ticket bookTicket() {
    return TrainTicket();
  }
}

class BookBusTicket extends BookingFactory {
  @override
  Ticket bookTicket() {
    return BusTicket();
  }
}

class BookFlightTicket extends BookingFactory {
  @override
  Ticket bookTicket() {
    return FlightTicket();
  }
}

class TicketFactory {
  static BookingFactory getFactory(String input) {
    if (input == 'bus') {
      return BookBusTicket();
    } else if (input == 'train') {
      return BookTrainTicket();
    } else {
      return BookFlightTicket();
    }
  }
}

void main() {
  String input = "bus";

  late BookingFactory factory = TicketFactory.getFactory(input);
  Ticket ticket = factory.bookTicket();
  ticket.show();
}
