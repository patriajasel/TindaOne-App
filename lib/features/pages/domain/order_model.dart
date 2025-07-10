import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'order_model.freezed.dart';
part 'order_model.g.dart';

@freezed
class OrderModel with _$OrderModel {
  const factory OrderModel({
    required String orderId,
    required DateTime date,
    required List<OrderItems> items,
    required int totalAmount,
    int? discount,
    List<OrderInclusion>? inclusion,
  }) = _OrderModel;

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
}

@freezed
class OrderItems with _$OrderItems {
  const factory OrderItems({
    required String productId,
    required String name,
    List<ItemList>? itemList,
    int? price,
    int? quantity,
  }) = _OrderItems;

  factory OrderItems.fromJson(Map<String, dynamic> json) =>
      _$OrderItemsFromJson(json);
}

@freezed
class ItemList with _$ItemList {
  const factory ItemList({
    required String size,
    required int price,
    required int quantity,
  }) = _ItemList;

  factory ItemList.fromJson(Map<String, dynamic> json) =>
      _$ItemListFromJson(json);
}

@freezed
class OrderInclusion with _$OrderInclusion {
  const factory OrderInclusion({
    required String productId,
    required String name,
    required int quantity,
  }) = _OrderInclusion;

  factory OrderInclusion.fromJson(Map<String, dynamic> json) =>
      _$OrderInclusionFromJson(json);
}

// Hive Adapters
@HiveType(typeId: 3)
class OrderModelHive extends HiveObject {
  @HiveField(0)
  late String orderId;

  @HiveField(1)
  late DateTime date;

  @HiveField(2)
  late List<OrderItemsHive> items;

  @HiveField(4)
  late int totalAmount;

  @HiveField(5)
  int? discount;

  @HiveField(6)
  List<OrderInclusionHive>? inclusion;

  OrderModelHive();

  OrderModelHive.fromModel(OrderModel model) {
    orderId = model.orderId;
    date = model.date;
    items = model.items.map((item) => OrderItemsHive.fromModel(item)).toList();
    totalAmount = model.totalAmount;
    discount = model.discount;
    inclusion = model.inclusion
        ?.map((inclusionData) => OrderInclusionHive.fromModel(inclusionData))
        .toList();
  }

  OrderModel toModel() {
    return OrderModel(
      orderId: orderId,
      date: date,
      items: items.map((item) => item.toModel()).toList(),
      totalAmount: totalAmount,
      discount: discount,
      inclusion: inclusion
          ?.map((inclusionData) => inclusionData.toModel())
          .toList(),
    );
  }
}

@HiveType(typeId: 4)
class OrderItemsHive extends HiveObject {
  @HiveField(0)
  late String productId;

  @HiveField(1)
  late String name;

  @HiveField(2)
  List<ItemListHive>? itemList;

  @HiveField(3)
  int? price;

  @HiveField(4)
  int? quantity;

  OrderItemsHive();

  OrderItemsHive.fromModel(OrderItems model) {
    productId = model.productId;
    name = model.name;
    itemList = model.itemList
        ?.map((item) => ItemListHive.fromModel(item))
        .toList();
    price = model.price;
    quantity = model.quantity;
  }

  OrderItems toModel() {
    return OrderItems(
      productId: productId,
      name: name,
      itemList: itemList?.map((item) => item.toModel()).toList(),
      price: price,
      quantity: quantity,
    );
  }
}

@HiveType(typeId: 5)
class ItemListHive extends HiveObject {
  @HiveField(0)
  late String size;

  @HiveField(1)
  late int price;

  @HiveField(2)
  late int quantity;

  ItemListHive();

  ItemListHive.fromModel(ItemList model) {
    size = model.size;
    price = model.price;
    quantity = model.quantity;
  }

  ItemList toModel() {
    return ItemList(size: size, price: price, quantity: quantity);
  }
}

@HiveType(typeId: 6)
class OrderInclusionHive extends HiveObject {
  @HiveField(0)
  late String productId;

  @HiveField(1)
  late String name;

  @HiveField(2)
  late int quantity;

  OrderInclusionHive();

  OrderInclusionHive.fromModel(OrderInclusion model) {
    productId = model.productId;
    name = model.name;
    quantity = model.quantity;
  }

  OrderInclusion toModel() {
    return OrderInclusion(productId: productId, name: name, quantity: quantity);
  }
}
