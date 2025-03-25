import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:smart_shop_v1/models/product_model.dart';
import 'package:smart_shop_v1/services/assets_manager.dart';
import 'package:smart_shop_v1/widgets/products/product_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController _searcherTextController;
  @override
  void initState() {
    super.initState();
    _searcherTextController = TextEditingController();
  }

  @override
  void dispose() {
    _searcherTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            AssetsManager.shoppingCart,
          ),
        ),
        title: Text(" Rechercher un produit"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(9.0),
        child: Column(
          children: [
            TextField(
              controller: _searcherTextController,
              decoration: InputDecoration(
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: "nom du produit",
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.blue,
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      FocusScope.of(context).unfocus();
                      _searcherTextController.clear();
                    });
                  },
                  icon: const Icon(
                    Icons.clear,
                    color: Colors.red,
                  ),
                ),
                contentPadding: const EdgeInsets.all(20),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: DynamicHeightGridView(
                builder: (context, index) {
                  return ProductWidget(
                    image: ProductModel.products[index].productImage,
                    price: ProductModel.products[index].productPrice,
                    title: ProductModel.products[index].productTitle,
                  );
                },
                itemCount: ProductModel.products.length,
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
