

class Pizza {
  String _topping;
  double _price;
  int _size;
  String strSize;
  String description;

  final PIZZA_PRICES = [7.99, 9.99, 12.99, 14.99];
  final PIZZA_SIZES = ["Small", "Medium", "Large", "X-Large"];

  Pizza(String this._topping, int this._size) {
    _price = PIZZA_PRICES[_size];
    strSize = PIZZA_SIZES[_size];
    description = "$strSize $_topping pizza";
  }
}