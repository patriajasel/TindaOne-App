// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductModelHiveAdapter extends TypeAdapter<ProductModelHive> {
  @override
  final int typeId = 1;

  @override
  ProductModelHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductModelHive()
      ..productId = fields[0] as String
      ..name = fields[1] as String
      ..image = fields[2] as String?
      ..isInclusion = fields[3] as bool
      ..priceType = fields[4] as String
      ..productSizes = (fields[5] as List?)?.cast<ProductSizesHive>()
      ..price = fields[6] as int?
      ..supply = fields[7] as int?
      ..barCode = fields[8] as String?;
  }

  @override
  void write(BinaryWriter writer, ProductModelHive obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.productId)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.image)
      ..writeByte(3)
      ..write(obj.isInclusion)
      ..writeByte(4)
      ..write(obj.priceType)
      ..writeByte(5)
      ..write(obj.productSizes)
      ..writeByte(6)
      ..write(obj.price)
      ..writeByte(7)
      ..write(obj.supply)
      ..writeByte(8)
      ..write(obj.barCode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductModelHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ProductSizesHiveAdapter extends TypeAdapter<ProductSizesHive> {
  @override
  final int typeId = 2;

  @override
  ProductSizesHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductSizesHive()
      ..size = fields[0] as String
      ..price = fields[1] as int
      ..supply = fields[2] as int
      ..barCode = fields[3] as String?;
  }

  @override
  void write(BinaryWriter writer, ProductSizesHive obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.size)
      ..writeByte(1)
      ..write(obj.price)
      ..writeByte(2)
      ..write(obj.supply)
      ..writeByte(3)
      ..write(obj.barCode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductSizesHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductModelImpl _$$ProductModelImplFromJson(Map<String, dynamic> json) =>
    _$ProductModelImpl(
      productId: json['productId'] as String,
      name: json['name'] as String,
      image: json['image'] as String?,
      isInclusion: json['isInclusion'] as bool,
      priceType: json['priceType'] as String,
      productSizes: (json['productSizes'] as List<dynamic>?)
          ?.map((e) => ProductSizes.fromJson(e as Map<String, dynamic>))
          .toList(),
      price: (json['price'] as num?)?.toInt(),
      supply: (json['supply'] as num?)?.toInt(),
      barCode: json['barCode'] as String?,
    );

Map<String, dynamic> _$$ProductModelImplToJson(_$ProductModelImpl instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'name': instance.name,
      'image': instance.image,
      'isInclusion': instance.isInclusion,
      'priceType': instance.priceType,
      'productSizes': instance.productSizes,
      'price': instance.price,
      'supply': instance.supply,
      'barCode': instance.barCode,
    };

_$ProductSizesImpl _$$ProductSizesImplFromJson(Map<String, dynamic> json) =>
    _$ProductSizesImpl(
      size: json['size'] as String,
      price: (json['price'] as num).toInt(),
      supply: (json['supply'] as num).toInt(),
      barCode: json['barCode'] as String?,
    );

Map<String, dynamic> _$$ProductSizesImplToJson(_$ProductSizesImpl instance) =>
    <String, dynamic>{
      'size': instance.size,
      'price': instance.price,
      'supply': instance.supply,
      'barCode': instance.barCode,
    };
