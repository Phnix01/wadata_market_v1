import 'package:flutter/material.dart';
import 'package:smart_shop_v1/screens/cart/cart_widget.dart';
import 'package:smart_shop_v1/screens/cart/empty_card_widget.dart';
import 'package:smart_shop_v1/services/assets_manager.dart';
import 'package:smart_shop_v1/widgets/subtitle_text.dart';
import 'package:smart_shop_v1/widgets/title_text_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool _isEmpty = false;
    return _isEmpty
        ? Scaffold(body: EmptyCardWidget())
        : Scaffold(
            body: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return CartWidget();
                }));
  }
}
