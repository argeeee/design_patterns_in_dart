// Step 1: Identify the algorithm
abstract class HouseBuilder {
  void buildFoundation();
  void buildWalls();
  void buildRoof();
  void furnishHouse();

  // Template Method
  void buildHouse() {
    buildFoundation();
    buildWalls();
    buildRoof();
    furnishHouse();
  }
}

// Step 2: Create concrete subclasses
class WoodenHouseBuilder extends HouseBuilder {
  @override
  void buildFoundation() {
    print("Building wooden foundation");
  }

  @override
  void buildWalls() {
    print("Building wooden walls");
  }

  @override
  void buildRoof() {
    print("Building wooden roof");
  }

  @override
  void furnishHouse() {
    print("Furnishing wooden house");
  }
}

class ConcreteHouseBuilder extends HouseBuilder {
  @override
  void buildFoundation() {
    print("Building concrete foundation");
  }

  @override
  void buildWalls() {
    print("Building concrete walls");
  }

  @override
  void buildRoof() {
    print("Building concrete roof");
  }

  @override
  void furnishHouse() {
    print("Furnishing concrete house");
  }
}
