// what client expects is abstract/interface
abstract class TypeC {
  void charge();
}

// legacy
class USB {
  void charge() {
    print('Charging with USB');
  }
}

class Adapter implements TypeC {
  USB _usbCharger;

  Adapter(this._usbCharger);

  @override
  void charge() {
    print('Adapter converts usb to type c');
    _usbCharger.charge();
  }
}

/*
Suppose you have a new mobile phone that has a 
Type-C plug, but you've a type USB - B charger.
Since the charger and plug have different interfaces, they 
can't connect directly.

How do you solve that?
*/

// void main() {
//   var usb = USB();
//   var adapter = Adapter(usb);
//   adapter.charge();
// }



/*
Imagine you have a European plug (Type C) that only fits
into a European socket, but you are in the USA, 
where only US sockets (Type A) are available.
*/

abstract class USASocket {
  void connect();
}

class EuropeanSocket {
  void charge() {
    print("Charging with European Plug");
  }
}

class SocketAdapter extends USASocket {
  EuropeanSocket _euSocket;

  SocketAdapter(this._euSocket);

  @override
  void connect() {
    print('Converted to USA');
    _euSocket.charge();
  }
}

void main() {
  var euroPlug = EuropeanSocket();
  var adapter = SocketAdapter(euroPlug);

  adapter.connect();
}
