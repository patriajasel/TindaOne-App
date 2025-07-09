import 'dart:io';

import 'package:tinda_one_app/features/pages/data/product_repository.dart';
import 'package:tinda_one_app/features/pages/domain/product_model.dart';

class ProductServices {
  final ProductRepository _productRepository;

  ProductServices(this._productRepository);

  // Fetch all products
  Future<List<ProductModel>> fetchAllProducts() async {
    return _productRepository.getAll();
  }

  // Fetch a single product
  Future<ProductModel?> fetchProduct(String productId) async {
    return _productRepository.get(productId);
  }

  // Create a product
  Future<void> createProduct(ProductModel product, File? imageFile) async {
    return _productRepository.add(product, imageFile);
  }

  // Update a product
  Future<void> updateProduct(ProductModel product) async {
    return _productRepository.update(product);
  }

  // Delete a product
  Future<void> deleteProduct(String productId) async {
    return _productRepository.delete(productId);
  }
}
