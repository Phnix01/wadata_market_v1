import 'package:flutter/material.dart';
import 'package:smart_shop_v1/widgets/subtitle_text.dart';

class QuantityBottomSheet extends StatelessWidget {
  const QuantityBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
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
                return Center(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SubtitleTextWidget(label: "$index"),
                ));
              }),
        ),
      ],
    );
  }
}
