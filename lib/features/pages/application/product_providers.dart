import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tinda_one_app/core/hive_service.dart';
import 'package:tinda_one_app/features/pages/application/product_services.dart';
import 'package:tinda_one_app/features/pages/data/product_repository.dart';
import 'package:tinda_one_app/features/pages/domain/product_model.dart';

part 'product_providers.g.dart';

@riverpod
ProductRepository productRepository(Ref ref) {
  final hive = ref.watch(hiveServiceProvider);
  return ProductRepository(hive);
}

@riverpod
ProductServices productServices(Ref ref) {
  final repository = ref.watch(productRepositoryProvider);
  return ProductServices(repository);
}

@riverpod
Future<void> createProduct(
  Ref ref, {
  required ProductModel product,
  File? imageFile,
}) async {
  return await ref
      .read(productServicesProvider)
      .createProduct(product, imageFile);
}

@riverpod
Future<List<ProductModel>> fetchAllProducts(Ref ref) async {
  return await ref.watch(productServicesProvider).fetchAllProducts();
}

@riverpod
Future<ProductModel?> fetchProduct(Ref ref, {required String productId}) async {
  return await ref.watch(productServicesProvider).fetchProduct(productId);
}

@riverpod
Future<void> updateProduct(
  Ref ref, {
  required ProductModel product,
  File? imageFile,
}) async {
  return await ref
      .read(productServicesProvider)
      .updateProduct(product, imageFile);
}

@riverpod
Future<void> deleteProduct(Ref ref, {required String productId}) async {
  return await ref.read(productServicesProvider).deleteProduct(productId);
}
