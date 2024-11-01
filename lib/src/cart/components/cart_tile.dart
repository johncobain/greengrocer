import 'package:flutter/material.dart';
import 'package:greengrocer/src/common_widgets/quantity_widgets.dart';
import 'package:greengrocer/src/config/custon_colors.dart';
import 'package:greengrocer/src/models/car_item_model.dart';
import 'package:greengrocer/src/services/utils_services.dart';

class CartTile extends StatefulWidget {
  final CarItemModel cartItem;
  final Function(int) updatedQuantity;

  const CartTile({
    super.key,
    required this.cartItem,
    required this.updatedQuantity,
  });

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        //imagem
        leading: Image.asset(
          widget.cartItem.item.imgUrl,
          height: 60,
          width: 60,
        ),

        //titulo
        title: Text(
          widget.cartItem.item.itemName,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        //total
        subtitle: Text(
          utilsServices.priceToCurrency(widget.cartItem.totalPrice()),
          style: TextStyle(
            color: CustomColors.customSwatchColor,
            fontWeight: FontWeight.bold,
          ),
        ),

        //quantidade
        trailing: QuantityWidgets(
          suffixText: widget.cartItem.item.unit,
          value: widget.cartItem.quantity,
          result: widget.updatedQuantity,
          isRemovable: true,
        ),
      ),
    );
  }
}
