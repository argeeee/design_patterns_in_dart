// Flyweight interface
abstract class Enemy {
  void display(int x, int y);
}

// Concrete flyweight
class Orc implements Enemy {
  final String name;
  final String weapon;

  Orc(this.name, this.weapon);

  @override
  void display(int x, int y) {
    print('Drawing Orc "$name" with weapon "$weapon" at position ($x, $y)');
  }
}

// Flyweight factory
class EnemyFactory {
  final Map<String, Enemy> enemyCache = {};

  Enemy getEnemy(String name, String weapon) {
    final key = '$name-$weapon';

    if (enemyCache.containsKey(key)) {
      return enemyCache[key]!;
    } else {
      final newEnemy = Orc(name, weapon);
      enemyCache[key] = newEnemy;
      return newEnemy;
    }
  }
}
