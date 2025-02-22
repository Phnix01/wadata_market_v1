import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_shop_v1/providers/theme_provider.dart';
import 'package:smart_shop_v1/services/assets_manager.dart';
import 'package:smart_shop_v1/widgets/app_text_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> bannerImage = [AssetsManager.banner1, AssetsManager.banner2];
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            AssetsManager.shoppingCart,
          ),
        ),
        title: AppNameTextWidget(),
      ),
      body: Column(
        children: [
          SizedBox(
            height: size.height * 0.25,
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return Image.asset(
                  bannerImage[index],
                  fit: BoxFit.fill,
                );
              },
              itemCount: bannerImage.length,
              pagination: SwiperPagination(
                builder: DotSwiperPaginationBuilder(
                  activeColor: Colors.red,
                  color: Colors.white,
                ),
              ),
              // control: SwiperControl(),
            ),
          )
        ],
      ),
    );
  }
}
