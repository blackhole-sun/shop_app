import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFav;

  Product(
      {@required this.id,
      @required this.imageUrl,
      @required this.description,
      @required this.title,
      @required this.price,
      this.isFav = false});

  void toggleFav(){
    isFav=!isFav;
    notifyListeners();
  }
}
