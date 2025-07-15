import 'package:tinda_one_app/core/hive_service.dart';
import 'package:tinda_one_app/features/pages/domain/order_model.dart';

class OrderRepository {
  final HiveService _hiveService;

  OrderRepository(this._hiveService);

  /// Create an Order Model
  Future<void> create(OrderModel order) async {
    final orderModelHive = OrderModelHive.fromModel(order);

    await _hiveService.orderBox.put(order.orderId, orderModelHive);
  }

  /// Fetch all Orders
  List<OrderModel> getAll() {
    return _hiveService.orderBox.values
        .map((orderModel) => orderModel.toModel())
        .toList();
  }

  /// Fetch a single order
  Future<OrderModel?> get(String productId) async {
    return _hiveService.orderBox.get(productId)?.toModel();
  }

  /// Update an order
  Future<void> update(OrderModel order) async {
    final orderModelHive = OrderModelHive.fromModel(order);
    await _hiveService.orderBox.put(order.orderId, orderModelHive);
  }

  /// Delete a product
  Future<void> delete(String orderId) => _hiveService.orderBox.delete(orderId);

  /// Clear the product box
  Future<void> clear() => _hiveService.orderBox.clear();
}
