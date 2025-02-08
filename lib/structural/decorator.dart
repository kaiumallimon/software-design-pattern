/*
Decorator pattern:

The decorator pattern allows to dynamically add new behaviors 
or functionalities to an exsiting object without modifying its
structure. Instead of extending the object, the decorator pattern
creates a wrapper that contains the original object and provides
additional behaviors.
*/

abstract class Coffee {
  String getDescription();
  double getCost();
}

class BasicCoffee implements Coffee {
  @override
  String getDescription() {
    return 'Basic coffee';
  }

  @override
  double getCost() {
    return 20;
  }
}

abstract class CoffeeDecorator implements Coffee {
  Coffee _coffee;

  CoffeeDecorator(this._coffee);

  @override
  String getDescription() {
    return _coffee.getDescription();
  }

  @override
  double getCost() {
    return _coffee.getCost();
  }
}

class Milk extends CoffeeDecorator {
  Milk(Coffee coffee) : super(coffee);

  @override
  String getDescription() {
    return '${super.getDescription()}, milk';
  }

  @override
  double getCost() {
    return super.getCost() + 10;
  }
}

class Sugar extends CoffeeDecorator {
  Sugar(Coffee coffee) : super(coffee);

  @override
  String getDescription() {
    return '${super.getDescription()}, sugar';
  }

  @override
  double getCost() {
    return super.getCost() + 5;
  }
}

class Cream extends CoffeeDecorator {
  Cream(Coffee coffee) : super(coffee);

  @override
  String getDescription() {
    return '${super.getDescription()}, cream';
  }

  @override
  double getCost() {
    return super.getCost() + 15;
  }
}

/*
A coffee shop sells basic coffee, but customers can customize
it by adding milk, sugar, or whipped cream. Instead of creating
multiple subclasses for different combinations 
(e.g., CoffeeWithMilk, CoffeeWithSugar,
CoffeeWithMilkAndSugar), we use the Decorator Pattern.

Q: An user wants a coffee with milk and sugar. How can we create
   this coffee?
*/

void main() {
  var coffee = BasicCoffee();
  Sugar sugar = Sugar(coffee);
  Milk milk = Milk(sugar);

  print(coffee.getDescription());

  print(milk.getCost());
}
