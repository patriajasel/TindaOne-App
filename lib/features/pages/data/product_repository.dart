import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:tinda_one_app/core/hive_service.dart';
import 'package:tinda_one_app/features/pages/domain/product_model.dart';

class ProductRepository {
  final HiveService _hiveService;

  ProductRepository(this._hiveService);

  /// Create a product
  Future<void> add(ProductModel product, File? imageFile) async {
    String? imageDir;

    if (imageFile != null) {
      imageDir = await saveImageFile(imageFile, product.productId);
    }

    final productModelHive = ProductModelHive.fromModel(
      product.copyWith(image: imageDir),
    );
    await _hiveService.productBox.put(product.productId, productModelHive);
  }

  /// Fetch all products
  List<ProductModel> getAll() {
    return _hiveService.productBox.values
        .map((productModel) => productModel.toModel())
        .toList();
  }

  /// Fetch a single product
  Future<ProductModel?> get(String productId) async {
    return _hiveService.productBox.get(productId)?.toModel();
  }

  /// Update a product
  Future<void> update(ProductModel product) async {
    final productModelHive = ProductModelHive.fromModel(product);
    await _hiveService.productBox.put(product.productId, productModelHive);
  }

  /// Delete a product
  Future<void> delete(String productId) =>
      _hiveService.productBox.delete(productId);

  /// Clear the product box
  Future<void> clear() => _hiveService.productBox.clear();

  // Save image file and provide directory
  Future<String> saveImageFile(File imageFile, String productId) async {
    final Directory appDocDir = await getApplicationDocumentsDirectory();
    final String imagePath = '${appDocDir.path}/tinda_one_app/product_images';

    final Directory imageDir = Directory(imagePath);
    if (!await imageDir.exists()) {
      await imageDir.create(recursive: true);
    }

    final String fileName = 'product-$productId';
    final String newPath = '$imagePath/$fileName';

    await imageFile.copy(newPath);
    return newPath;
  }
}
