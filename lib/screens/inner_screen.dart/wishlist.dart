import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_shop_v1/providers/whishlist_provider.dart';
import 'package:smart_shop_v1/services/assets_manager.dart';
import 'package:smart_shop_v1/widgets/empty_bag.dart';
import 'package:smart_shop_v1/widgets/title_text_widget.dart';
import 'package:smart_shop_v1/services/my_app_functions.dart';
import 'package:smart_shop_v1/widgets/products/product_widget.dart';

class WishlistScreen extends StatelessWidget {
  static const String routName = "/WishlistScreen";

  @override
  Widget build(BuildContext context) {
    final wishlistProvider = Provider.of<WishlistProvider>(context);

    return wishlistProvider.getWishlists.isEmpty
        ? Scaffold(
            body: EmptyBagWidget(
              imagePath: AssetsManager.bagWish,
              title: "Aucun Favoris",
              subtitle:
                  "Vous attendez quoi pour aller liker les produits que vous aimez 😁",
              buttonText: "Allez consulter",
            ),
          )
        : Scaffold(
            appBar: AppBar(
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(AssetsManager.shoppingCart),
              ),
              title: TitleTextWidget(
                label: "Favoris (${wishlistProvider.getWishlists.length})",
              ),
            ),
            body: DynamicHeightGridView(
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              itemCount: wishlistProvider.getWishlists.length,
              crossAxisCount: 2,
              builder: (context, index) {
                final productId = wishlistProvider.getWishlists.values
                    .toList()[index]
                    .productId;

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProductWidget(productId: productId),
                );
              },
            ),
          );
  }
}
