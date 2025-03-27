import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_shop_v1/models/product_model.dart';
import 'package:smart_shop_v1/providers/products_provider.dart';
import 'package:smart_shop_v1/services/assets_manager.dart';
import 'package:smart_shop_v1/widgets/products/product_widget.dart';
import 'package:smart_shop_v1/widgets/title_text_widget.dart';

class SearchScreen extends StatefulWidget {
  static String routName = "./SearchScreen";
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

  List<ProductModel> productListSearch = [];
  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<ProductsProvider>(context);

    String? passedCategory =
        ModalRoute.of(context)!.settings.arguments as String?;
    List<ProductModel> productList = passedCategory == null
        ? productsProvider.products
        : productsProvider.findByCategory(
            categoryName: passedCategory.toLowerCase());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            AssetsManager.shoppingCart,
          ),
        ),
        title: Text(
            passedCategory == null ? " Rechercher un produit" : passedCategory),
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
              onSubmitted: (value) {
                setState(() {
                  productListSearch = productsProvider.searchQuery(
                      searchText: _searcherTextController.text);
                });
              },
            ),
            SizedBox(
              height: 20,
            ),
            if (_searcherTextController.text.isNotEmpty &&
                productListSearch.isEmpty) ...[
              const Center(
                child: TitleTextWidget(label: " Aucun resultat"),
              )
            ],
            Expanded(
              child: DynamicHeightGridView(
                builder: (context, index) {
                  return ProductWidget(
                    productId: _searcherTextController.text.isNotEmpty
                        ? productListSearch[index].productId
                        : productList[index].productId,
                  );
                },
                itemCount: _searcherTextController.text.isNotEmpty
                    ? productListSearch.length
                    : productList.length,
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
