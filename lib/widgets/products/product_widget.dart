import 'dart:developer';

import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_shop_v1/consts/app_constants.dart';
import 'package:smart_shop_v1/models/product_model.dart';
import 'package:smart_shop_v1/providers/cart_provider.dart';
import 'package:smart_shop_v1/providers/products_provider.dart';
import 'package:smart_shop_v1/screens/inner_screen.dart/product_detail.dart';
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
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: FancyShimmerImage(
                      imageUrl: getCurrentProduct.productImage,
                      height: size.height * 0.19,
                      width: double.infinity,
                      boxFit: BoxFit.fitHeight,
                    ),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Row(
                    children: [
                      Flexible(
                        flex: 5,
                        child: TitleTextWidget(
                          label: getCurrentProduct.productTitle,
                          fontSize: 20,
                          maxLines: 2,
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(IconlyLight.heart),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: SubtitleTextWidget(
                            label: " ${getCurrentProduct.productPrice} Fcfa",
                            fontWeight: FontWeight.w600,
                            color: Colors.blue,
                          ),
                        ),
                        Flexible(
                          child: Material(
                            borderRadius: BorderRadius.circular(12.0),
                            color: Colors.lightBlue,
                            child: InkWell(
                              splashColor: Colors.red,
                              onTap: () {
                                if (cartProvider.isProductInCart(
                                    productId: getCurrentProduct.productId)) {
                                  return;
                                }
                                cartProvider.addProductTOCart(
                                    productId: getCurrentProduct.productId);
                              },
                              child: Padding(
                                padding: EdgeInsets.all(6.0),
                                child: Icon(
                                  Icons.add_shopping_cart_outlined,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
  }
}
