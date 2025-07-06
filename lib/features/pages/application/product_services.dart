import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tinda_one_app/core/hive_service.dart';
import 'package:tinda_one_app/features/pages/data/product_repository.dart';
import 'package:tinda_one_app/features/pages/domain/product_model.dart';

part 'product_services.g.dart';

class ProductServices {
  final ProductRepository _productRepository;

  ProductServices(this._productRepository);

  Future<List<ProductModel>> fetchAllProducts() async {
    return _productRepository.getAll();
  }
}

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
