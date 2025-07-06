import 'package:tinda_one_app/core/hive_service.dart';
import 'package:tinda_one_app/features/pages/domain/product_model.dart';

class ProductRepository {
  final HiveService _hiveService;

  ProductRepository(this._hiveService);

  List<ProductModel> getAll() {
    return _hiveService.productBox.values
        .map((hiveModel) => hiveModel.toModel())
        .toList();
  }

  Future<void> add(ProductModel product) async {
    final hiveModel = ProductModelHive.fromModel(product);
    await _hiveService.productBox.put(product.productId, hiveModel);
  }

  Future<void> delete(String productId) =>
      _hiveService.productBox.delete(productId);

  Future<void> clear() => _hiveService.productBox.clear();
}
