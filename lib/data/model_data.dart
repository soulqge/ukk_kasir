// data.dart
class MenuItem {
  final int idmenu;
  final String name;
  final String imageUrl;
  final String description;
  final int price;
  int quantity;

  MenuItem({required this.idmenu,required this.name, required this.imageUrl,required this.description, required this.price, this.quantity = 1});

  int get _idmenu => idmenu;
  String get _name => name;
  String get _imageUrl => imageUrl;
  String get _desc => description;
  int get _price => price;
}

final List<MenuItem> culinaryItems = [
  MenuItem(
      idmenu: 1,
      name: 'Popcorn Cina',
      imageUrl: 'assets/images/Makanan4.png',
      description: 'Popcorn Cina',
      price: 1500),
  MenuItem(
      idmenu: 2,
      name: 'Burger Jepang',
      imageUrl: 'assets/images/Makanan1.png',
      description: 'Burger Jepang',
      price: 1500),
  MenuItem(
      idmenu: 3,
      name: 'Potato Bakar',
      imageUrl: 'assets/images/Makanan2.png',
      description: 'Potato Bakar',
      price: 1500),
  MenuItem(
      idmenu: 4,
      name: 'Beef Steak',
      imageUrl: 'assets/images/Makanan3.png',
      description: 'Beef Steak',
      price: 1500),
  MenuItem(
      idmenu: 5,
      name: 'Chicken Steak',
      imageUrl: 'assets/images/Makanan5.png',
      description: 'Chicken Steak',
      price: 1500
  )
];

final List<MenuItem> drinkItems = [
  MenuItem(
      idmenu: 6,
      name: 'Es Lemon',
      imageUrl: 'assets/images/Minuman1.png',
      description: 'Es Lemon',
      price: 3000),
  MenuItem(
      idmenu: 7,
      name: 'Teh Lemon',
      imageUrl: 'assets/images/Minuman2.png',
      description: 'Teh Lemon',
      price: 3000),
  MenuItem(
      idmenu: 8,
      name: 'Es Oreo',
      imageUrl: 'assets/images/Minuman3.png',
      description: 'Es Oreo',
      price: 3000),
  MenuItem(
      idmenu: 9,
      name: 'Es Blueberry',
      imageUrl: 'assets/images/Minuman4.png',
      description: 'Es Blueberry',
      price: 3000),
  MenuItem(
      idmenu: 10,
      name: 'Es Cincau',
      imageUrl: 'assets/images/Minuman5.png',
      description: 'Es Cincau',
      price: 3000
  )
];
//customer cart
  List<MenuItem> _cart = [];

  //getter method
  List<MenuItem> get dishMenu => culinaryItems;
  List<MenuItem> get drinkMenu => drinkItems;
  List<MenuItem> get cart => _cart;

  //add to cart
  void AddtoCart(MenuItem fnb, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(fnb);
    }
  }

  //remove from cart
  void removefromCart(MenuItem fnb) {
    _cart.remove(fnb);
  }


