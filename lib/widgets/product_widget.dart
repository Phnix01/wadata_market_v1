import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class ProductWidget extends StatefulWidget {
  const ProductWidget({super.key});

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        FancyShimmerImage(
          imageUrl: "https://i.ibb.co/8r1Ny2n/20-Nike-Air-Force-1-07.png",
          height: size.height * 0.22,
          width: double.infinity,
        ),
      ],
    );
  }
}
