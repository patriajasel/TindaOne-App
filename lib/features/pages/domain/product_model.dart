import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

// Pure Freezed classes for JSON serialization and business logic
@freezed
class ProductModel with _$ProductModel {
  const factory ProductModel({
    required String productId,
    required String name,
    String? image,
    required bool isInclusion,
    required String priceType,
    List<ProductSizes>? productSizes,
    int? price,
    int? supply,
    String? barCode,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}

@freezed
class ProductSizes with _$ProductSizes {
  const factory ProductSizes({
    required String size,
    required int price,
    required int supply,
    String? barCode,
  }) = _ProductSizes;

  factory ProductSizes.fromJson(Map<String, dynamic> json) =>
      _$ProductSizesFromJson(json);
}

// Separate Hive adapters with unique typeIds
@HiveType(typeId: 1)
class ProductModelHive extends HiveObject {
  @HiveField(0)
  late String productId;

  @HiveField(1)
  late String name;

  @HiveField(2)
  String? image;

  @HiveField(3)
  late bool isInclusion;

  @HiveField(4)
  late String priceType;

  @HiveField(5)
  List<ProductSizesHive>? productSizes;

  @HiveField(6)
  int? price;

  @HiveField(7)
  int? supply;

  @HiveField(8)
  String? barCode;

  ProductModelHive();

  ProductModelHive.fromModel(ProductModel model) {
    productId = model.productId;
    name = model.name;
    image = model.image;
    isInclusion = model.isInclusion;
    priceType = model.priceType;

    if (model.priceType == "Fixed Price") {
      price = model.price;
      supply = model.supply;
      barCode = model.barCode;
      productSizes = null;
    } else {
      productSizes = model.productSizes
          ?.map((productSize) => ProductSizesHive.fromModel(productSize))
          .toList();
    }
  }

  ProductModel toModel() {
    if (priceType == "Fixed Price") {
      return ProductModel(
        productId: productId,
        name: name,
        image: image,
        isInclusion: isInclusion,
        priceType: priceType,
        price: price,
        supply: supply,
        barCode: barCode,
      );
    }

    return ProductModel(
      productId: productId,
      name: name,
      image: image,
      isInclusion: isInclusion,
      priceType: priceType,
      productSizes: productSizes
          ?.map((productSizeHive) => productSizeHive.toModel())
          .toList(),
    );
  }
}

@HiveType(typeId: 2)
class ProductSizesHive extends HiveObject {
  @HiveField(0)
  late String size;

  @HiveField(1)
  late int price;

  @HiveField(2)
  late int supply;

  @HiveField(3)
  String? barCode;

  ProductSizesHive();

  ProductSizesHive.fromModel(ProductSizes model) {
    size = model.size;
    price = model.price;
    supply = model.supply;
    barCode = model.barCode;
  }

  ProductSizes toModel() {
    return ProductSizes(
      size: size,
      price: price,
      supply: supply,
      barCode: barCode,
    );
  }
}
