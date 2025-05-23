import 'package:smart_shop_v1/models/categories_model.dart';

import '../services/assets_manager.dart';

class AppConstants {
  static const String imageUrl =
      'https://i.ibb.co/8r1Ny2n/20-Nike-Air-Force-1-07.png';

  static List<String> bannersImages = [
    AssetsManager.banner1,
    AssetsManager.banner2
  ];

  static List<CategoriesModel> categoriesList = [
    CategoriesModel(
      id: "Phones",
      image: AssetsManager.mobiles,
      name: "Phones",
    ),
    CategoriesModel(
      id: "Laptops",
      image: AssetsManager.pc,
      name: "Ordinateurs",
    ),
    CategoriesModel(
      id: "Electronics",
      image: AssetsManager.electronics,
      name: "Electroniques",
    ),
    CategoriesModel(
      id: "Watches",
      image: AssetsManager.watch,
      name: "Montres",
    ),
    CategoriesModel(
      id: "Clothes",
      image: AssetsManager.fashion,
      name: "Vêtements",
    ),
    CategoriesModel(
      id: "Shoes",
      image: AssetsManager.shoes,
      name: "Chaussures",
    ),
    CategoriesModel(
      id: "Books",
      image: AssetsManager.book,
      name: "Livres",
    ),
    CategoriesModel(
      id: "Cosmetics",
      image: AssetsManager.cosmetics,
      name: "Cosmetiques",
    ),
  ];
}
