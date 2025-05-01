import 'dart:developer';

import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_shop_v1/consts/app_constants.dart';
import 'package:smart_shop_v1/models/product_model.dart';
import 'package:smart_shop_v1/providers/cart_provider.dart';
import 'package:smart_shop_v1/providers/products_provider.dart';
import 'package:smart_shop_v1/screens/inner_screen.dart/product_detail.dart';
import 'package:smart_shop_v1/widgets/products/heart_btn.dart';
import 'package:smart_shop_v1/widgets/subtitle_text.dart';
import 'package:smart_shop_v1/widgets/title_text_widget.dart';
import 'package:iconly/iconly.dart';

class ProductWidget extends StatefulWidget {
  final String productId;
  const ProductWidget({super.key, required this.productId});

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<ProductsProvider>(context);
    final getCurrentProduct = productsProvider.findByProdId(widget.productId);
    final cartProvider = Provider.of<CartProvider>(context);
    Size size = MediaQuery.of(context).size;

    return getCurrentProduct == null
        ? const SizedBox.shrink()
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  ProductDetails.routName,
                  arguments: getCurrentProduct.productId,
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image du produit
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: FancyShimmerImage(
                      imageUrl: getCurrentProduct.productImage,
                      height: size.height * 0.19,
                      width: double.infinity,
                      boxFit: BoxFit.fitHeight,
                    ),
                  ),
                  const SizedBox(height: 12.0),

                  // Titre + bouton favoris
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: TitleTextWidget(
                          label: getCurrentProduct.productTitle,
                          fontSize: 18,
                          maxLines: 2,
                        ),
                      ),
                      HeartButtonWidget(
                        productId: getCurrentProduct.productId,
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),

                  // Prix + bouton panier
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Affichage du prix formaté
                      Row(
                        children: [
                          Text(
                            "${formatPriceString(getCurrentProduct.productPrice)}",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent,
                            ),
                          ),
                          const SizedBox(width: 4),
                          const Text(
                            "FCFA",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),

                      // Bouton panier
                      Material(
                        borderRadius: BorderRadius.circular(12.0),
                        color: Colors.lightBlue,
                        child: InkWell(
                          splashColor: Colors.red,
                          borderRadius: BorderRadius.circular(12.0),
                          onTap: () {
                            if (cartProvider.isProductInCart(
                                productId: getCurrentProduct.productId)) {
                              return;
                            }
                            cartProvider.addProductTOCart(
                                productId: getCurrentProduct.productId);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Icon(
                              cartProvider.isProductInCart(
                                      productId: getCurrentProduct.productId)
                                  ? Icons.check
                                  : Icons.add_shopping_cart_outlined,
                              size: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
  }

  // Fonction utilitaire pour formater une chaîne de chiffres en "XXX XXX"
  String formatPriceString(String priceStr) {
    try {
      final number = int.parse(priceStr);
      return number.toString().replaceAllMapped(
            RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
            (match) => '${match[1]} ',
          );
    } catch (e) {
      return priceStr; // En cas d'erreur, on retourne le prix brut
    }
  }
}
