// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OrderModelHiveAdapter extends TypeAdapter<OrderModelHive> {
  @override
  final int typeId = 3;

  @override
  OrderModelHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OrderModelHive()
      ..orderId = fields[0] as String
      ..date = fields[1] as DateTime
      ..items = (fields[2] as List).cast<OrderItemsHive>()
      ..totalAmount = fields[4] as int
      ..discount = fields[5] as int?
      ..inclusion = (fields[6] as List?)?.cast<OrderInclusionHive>();
  }

  @override
  void write(BinaryWriter writer, OrderModelHive obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.orderId)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.items)
      ..writeByte(4)
      ..write(obj.totalAmount)
      ..writeByte(5)
      ..write(obj.discount)
      ..writeByte(6)
      ..write(obj.inclusion);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderModelHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class OrderItemsHiveAdapter extends TypeAdapter<OrderItemsHive> {
  @override
  final int typeId = 4;

  @override
  OrderItemsHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OrderItemsHive()
      ..productId = fields[0] as String
      ..name = fields[1] as String
      ..itemList = (fields[2] as List?)?.cast<ItemListHive>()
      ..price = fields[3] as int?
      ..quantity = fields[4] as int?;
  }

  @override
  void write(BinaryWriter writer, OrderItemsHive obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.productId)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.itemList)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.quantity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderItemsHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ItemListHiveAdapter extends TypeAdapter<ItemListHive> {
  @override
  final int typeId = 5;

  @override
  ItemListHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ItemListHive()
      ..size = fields[0] as String
      ..price = fields[1] as int
      ..quantity = fields[2] as int;
  }

  @override
  void write(BinaryWriter writer, ItemListHive obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.size)
      ..writeByte(1)
      ..write(obj.price)
      ..writeByte(2)
      ..write(obj.quantity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemListHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class OrderInclusionHiveAdapter extends TypeAdapter<OrderInclusionHive> {
  @override
  final int typeId = 6;

  @override
  OrderInclusionHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OrderInclusionHive()
      ..productId = fields[0] as String
      ..name = fields[1] as String
      ..quantity = fields[2] as int;
  }

  @override
  void write(BinaryWriter writer, OrderInclusionHive obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.productId)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.quantity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderInclusionHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderModelImpl _$$OrderModelImplFromJson(Map<String, dynamic> json) =>
    _$OrderModelImpl(
      orderId: json['orderId'] as String,
      date: DateTime.parse(json['date'] as String),
      items: (json['items'] as List<dynamic>)
          .map((e) => OrderItems.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalAmount: (json['totalAmount'] as num).toInt(),
      discount: (json['discount'] as num?)?.toInt(),
      inclusion: (json['inclusion'] as List<dynamic>?)
          ?.map((e) => OrderInclusion.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$OrderModelImplToJson(_$OrderModelImpl instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'date': instance.date.toIso8601String(),
      'items': instance.items,
      'totalAmount': instance.totalAmount,
      'discount': instance.discount,
      'inclusion': instance.inclusion,
    };

_$OrderItemsImpl _$$OrderItemsImplFromJson(Map<String, dynamic> json) =>
    _$OrderItemsImpl(
      productId: json['productId'] as String,
      name: json['name'] as String,
      itemList: (json['itemList'] as List<dynamic>?)
          ?.map((e) => ItemList.fromJson(e as Map<String, dynamic>))
          .toList(),
      price: (json['price'] as num?)?.toInt(),
      quantity: (json['quantity'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$OrderItemsImplToJson(_$OrderItemsImpl instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'name': instance.name,
      'itemList': instance.itemList,
      'price': instance.price,
      'quantity': instance.quantity,
    };

_$ItemListImpl _$$ItemListImplFromJson(Map<String, dynamic> json) =>
    _$ItemListImpl(
      size: json['size'] as String,
      price: (json['price'] as num).toInt(),
      quantity: (json['quantity'] as num).toInt(),
    );

Map<String, dynamic> _$$ItemListImplToJson(_$ItemListImpl instance) =>
    <String, dynamic>{
      'size': instance.size,
      'price': instance.price,
      'quantity': instance.quantity,
    };

_$OrderInclusionImpl _$$OrderInclusionImplFromJson(Map<String, dynamic> json) =>
    _$OrderInclusionImpl(
      productId: json['productId'] as String,
      name: json['name'] as String,
      quantity: (json['quantity'] as num).toInt(),
    );

Map<String, dynamic> _$$OrderInclusionImplToJson(
        _$OrderInclusionImpl instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'name': instance.name,
      'quantity': instance.quantity,
    };
