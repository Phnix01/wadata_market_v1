import 'dart:developer';

import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:smart_shop_v1/screens/inner_screen.dart/product_detail.dart';
import 'package:smart_shop_v1/widgets/subtitle_text.dart';
import 'package:smart_shop_v1/widgets/title_text_widget.dart';
import 'package:iconly/iconly.dart';

class ProductWidget extends StatefulWidget {
  const ProductWidget({super.key});

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, ProductDetails.routName);
        },
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: FancyShimmerImage(
                imageUrl: "https://i.ibb.co/8r1Ny2n/20-Nike-Air-Force-1-07.png",
                height: size.height * 0.15,
                width: double.infinity,
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
                    label: "Titre Prod" * 10,
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
                      label: "150.000 Fcfa",
                      fontWeight: FontWeight.w600,
                      color: Colors.blue,
                    ),
                  ),
                  Flexible(
                    child: Material(
                      borderRadius: BorderRadius.circular(12.0),
                      color: Colors.lightBlue,
                      child: InkWell(
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
