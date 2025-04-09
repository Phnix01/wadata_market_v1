import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_shop_v1/models/cart_model.dart';
import 'package:smart_shop_v1/providers/cart_provider.dart';
import 'package:smart_shop_v1/widgets/subtitle_text.dart';

class QuantityBottomSheet extends StatelessWidget {
  const QuantityBottomSheet({super.key, required this.cartModel});
  final CartModel cartModel;

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Container(
          width: 100,
          height: 5,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.grey),
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: ListView.builder(
              itemCount: 25,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    cartProvider.updateQty(
                        productId: cartModel.productId, qty: index + 1);
                    Navigator.pop(context);
                  },
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SubtitleTextWidget(label: "$index"),
                  )),
                );
              }),
        ),
      ],
    );
  }
}
