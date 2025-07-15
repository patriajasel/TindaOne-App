import 'package:tinda_one_app/features/pages/data/order_repository.dart';
import 'package:tinda_one_app/features/pages/domain/order_model.dart';

class OrderServices {
  final OrderRepository _orderRepository;

  OrderServices(this._orderRepository);

  // Fetch all Orders
  Future<List<OrderModel>> fetchAllOrders() async {
    return _orderRepository.getAll();
  }

  // Fetch a single Order
  Future<OrderModel?> fetchOrder(String orderId) async {
    return _orderRepository.get(orderId);
  }

  // Create an Order
  Future<void> createOrder(OrderModel order) async {
    return _orderRepository.create(order);
  }

  // Update an Order
  Future<void> updateOrder(OrderModel order) async {
    return _orderRepository.update(order);
  }

  // Delete an Order
  Future<void> deleteOrder(String orderId) async {
    return _orderRepository.delete(orderId);
  }
}
