import 'package:flutter/material.dart';
import 'package:smart_shop_v1/services/assets_manager.dart';
import 'package:smart_shop_v1/widgets/subtitle_text.dart';
import 'package:smart_shop_v1/widgets/title_text_widget.dart';

class EmptyCardWidget extends StatelessWidget {
  const EmptyCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          AssetsManager.shoppingCart,
          width: double.infinity,
          height: _size.height * 0.4,
        ),
        TitleTextWidget(
          label: "Ooups!!",
          color: Colors.red,
          fontWeight: FontWeight.bold,
          fontSize: 45,
        ),
        const SizedBox(
          height: 20,
        ),
        SubtitleTextWidget(
          label: "Votre panier est vide",
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        Padding(
          padding: const EdgeInsets.all(23.0),
          child: SubtitleTextWidget(
            label:
                "Il semble que vous n'ayez pas encore ajouté d'articles à votre panier",
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              elevation: 1,
              backgroundColor: Colors.red.shade500,
              foregroundColor: Colors.white,
              padding: EdgeInsets.all(18)),
          onPressed: () {},
          child: Text(
            "Acheter maintenant",
            style: TextStyle(fontSize: 16),
          ),
        )
      ],
    );
  }
}
