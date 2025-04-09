import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_shop_v1/providers/cart_provider.dart';
import 'package:smart_shop_v1/screens/cart/bottom_checkout.dart';
import 'package:smart_shop_v1/screens/cart/cart_widget.dart';
import 'package:smart_shop_v1/screens/cart/empty_card_widget.dart';
import 'package:smart_shop_v1/services/assets_manager.dart';
import 'package:smart_shop_v1/widgets/empty_bag.dart';
import 'package:smart_shop_v1/widgets/subtitle_text.dart';
import 'package:smart_shop_v1/widgets/title_text_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  final bool isEmpty = false;
  @override
  Widget build(BuildContext context) {
    // final productsProvider = Provider.of<ProductsProvider>(context);
    final cartProvider = Provider.of<CartProvider>(context);

    return cartProvider.getCartItems.isEmpty
        ? Scaffold(
            body: EmptyBagWidget(
              imagePath: AssetsManager.shoppingBasket,
              title: "Votre Panier est vide",
              subtitle:
                  "Apparement Votre Panier est Vide, ajouter un produit dans votre Panier et Passez à l\'action",
              buttonText: "Acheter maintenant",
            ),
          )
        : Scaffold(
            bottomSheet: const CartBottomSheetWidget(),
            appBar: AppBar(
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  AssetsManager.shoppingCart,
                ),
              ),
              title: TitleTextWidget(
                  label: "Panier (${cartProvider.getCartItems.length})"),
              actions: [
                IconButton(
                  onPressed: () {
                    cartProvider.clearLocalCart();
                  },
                  icon: const Icon(
                    Icons.delete_forever_rounded,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: cartProvider.getCartItems.length,
                      itemBuilder: (context, index) {
                        return ChangeNotifierProvider.value(
                            value: cartProvider.getCartItems.values
                                .toList()[index],
                            child: const CartWidget());
                      }),
                ),
                const SizedBox(
                  height: kBottomNavigationBarHeight + 10,
                )
              ],
            ),
          );
  }
}
