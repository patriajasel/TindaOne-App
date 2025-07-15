import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tinda_one_app/core/hive_service.dart';
import 'package:tinda_one_app/features/pages/application/order_services.dart';
import 'package:tinda_one_app/features/pages/data/order_repository.dart';
import 'package:tinda_one_app/features/pages/domain/order_model.dart';

part 'order_providers.g.dart';

@riverpod
OrderRepository orderRepository(Ref ref) {
  final hive = ref.watch(hiveServiceProvider);
  return OrderRepository(hive);
}

@riverpod
OrderServices orderServices(Ref ref) {
  final repository = ref.watch(orderRepositoryProvider);
  return OrderServices(repository);
}

@riverpod
Future<void> createOrder(Ref ref, {required OrderModel order}) async {
  return await ref.read(orderServicesProvider).createOrder(order);
}

@riverpod
Future<List<OrderModel>> fetchAllOrders(Ref ref) async {
  return await ref.watch(orderServicesProvider).fetchAllOrders();
}

@riverpod
Future<OrderModel?> fetchOrder(Ref ref, {required String orderId}) async {
  return await ref.watch(orderServicesProvider).fetchOrder(orderId);
}

@riverpod
Future<void> updateOrder(Ref ref, {required OrderModel order}) async {
  return await ref.read(orderServicesProvider).updateOrder(order);
}

@riverpod
Future<void> deleteOrder(Ref ref, {required String orderId}) async {
  return await ref.read(orderServicesProvider).deleteOrder(orderId);
}
