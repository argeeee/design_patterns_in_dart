class Pizza {
  late String crust;
  late String sauce;
  late List<String> toppings;

  void display() {
    print('Crust: $crust');
    print('Sauce: $sauce');
    print('Toppings: ${toppings.join(', ')}');
  }
}
