import 'package:greengrocer/src/models/item_model.dart';

class CarItemModel {
  ItemModel item;
  int quantity;

  CarItemModel({
    required this.item,
    required this.quantity,
  });

  double totalPrice()=> item.price* quantity;
}
