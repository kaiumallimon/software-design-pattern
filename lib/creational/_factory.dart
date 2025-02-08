//_factory.dart

// creational design pattern
// provides one of the best ways to create an object

// we create object without exposing the creation logic
// to the client and refer to newly created object using
// a common interface [ We will not expose the class name
// to the client when creating the object, rather will use
// a common interface to refer the object. Subclass will decide
// which class to instantiate]

abstract class OperatingSystem {
  void show();
}

class AndroidOS extends OperatingSystem {
  @override
  void show() {
    print('Android OS');
  }
}

class IOS extends OperatingSystem {
  @override
  void show() {
    print('IOS');
  }
}

class OtherOS extends OperatingSystem {
  @override
  void show() {
    print('Other OS');
  }
}

abstract class Factory {
  OperatingSystem create();
}

class AndroidFactory extends Factory {
  @override
  OperatingSystem create() {
    // TODO: implement create
    return AndroidOS();
  }
}

class IOSFactory extends Factory {
  @override
  OperatingSystem create() {
    // TODO: implement create
    return IOS();
  }
}

class OtherFactory extends Factory {
  @override
  OperatingSystem create() {
    // TODO: implement create
    return OtherOS();
  }
}

/// Question:
// A company is developing a cross-platform application
// that needs to support different operating systems,
// including Android, iOS, and other OS variants.
// The application must create an OperatingSystem object
// dynamically based on the platform it is running on,
// but the developers don't want to modify the main application
// logic whenever a new OS is added.

// How can we encapsulate the creation of OperatingSystem objects
// so that the main application does not directly instantiate them,
// allowing for extensibility and maintainability?

// driver function
void main() {
  Factory factory;

  // create android os:
  factory = AndroidFactory();
  OperatingSystem android = factory.create();
  android.show();

  // create ios:
  factory = IOSFactory();
  OperatingSystem ios = factory.create();
  ios.show();

  // other os:
  factory = OtherFactory();
  OperatingSystem other = factory.create();
  other.show();
}
