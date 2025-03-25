class ProductModel {
  final String productId;
  final String productTitle;
  final String productCategory;
  final String productDescription;
  final String productImage;
  final String productQuantity;

  ProductModel(
      {required this.productId,
      required this.productTitle,
      required this.productCategory,
      required this.productDescription,
      required this.productImage,
      required this.productQuantity});
}
