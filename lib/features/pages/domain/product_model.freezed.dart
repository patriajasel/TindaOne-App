// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) {
  return _ProductModel.fromJson(json);
}

/// @nodoc
mixin _$ProductModel {
  String get productId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  bool get isInclusion => throw _privateConstructorUsedError;
  String get priceType => throw _privateConstructorUsedError;
  ProductSizes? get productSizes => throw _privateConstructorUsedError;
  int? get price => throw _privateConstructorUsedError;
  int? get supply => throw _privateConstructorUsedError;
  String? get size => throw _privateConstructorUsedError;
  String? get barCode => throw _privateConstructorUsedError;

  /// Serializes this ProductModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductModelCopyWith<ProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductModelCopyWith<$Res> {
  factory $ProductModelCopyWith(
          ProductModel value, $Res Function(ProductModel) then) =
      _$ProductModelCopyWithImpl<$Res, ProductModel>;
  @useResult
  $Res call(
      {String productId,
      String name,
      String image,
      bool isInclusion,
      String priceType,
      ProductSizes? productSizes,
      int? price,
      int? supply,
      String? size,
      String? barCode});

  $ProductSizesCopyWith<$Res>? get productSizes;
}

/// @nodoc
class _$ProductModelCopyWithImpl<$Res, $Val extends ProductModel>
    implements $ProductModelCopyWith<$Res> {
  _$ProductModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? name = null,
    Object? image = null,
    Object? isInclusion = null,
    Object? priceType = null,
    Object? productSizes = freezed,
    Object? price = freezed,
    Object? supply = freezed,
    Object? size = freezed,
    Object? barCode = freezed,
  }) {
    return _then(_value.copyWith(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      isInclusion: null == isInclusion
          ? _value.isInclusion
          : isInclusion // ignore: cast_nullable_to_non_nullable
              as bool,
      priceType: null == priceType
          ? _value.priceType
          : priceType // ignore: cast_nullable_to_non_nullable
              as String,
      productSizes: freezed == productSizes
          ? _value.productSizes
          : productSizes // ignore: cast_nullable_to_non_nullable
              as ProductSizes?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      supply: freezed == supply
          ? _value.supply
          : supply // ignore: cast_nullable_to_non_nullable
              as int?,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as String?,
      barCode: freezed == barCode
          ? _value.barCode
          : barCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductSizesCopyWith<$Res>? get productSizes {
    if (_value.productSizes == null) {
      return null;
    }

    return $ProductSizesCopyWith<$Res>(_value.productSizes!, (value) {
      return _then(_value.copyWith(productSizes: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProductModelImplCopyWith<$Res>
    implements $ProductModelCopyWith<$Res> {
  factory _$$ProductModelImplCopyWith(
          _$ProductModelImpl value, $Res Function(_$ProductModelImpl) then) =
      __$$ProductModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String productId,
      String name,
      String image,
      bool isInclusion,
      String priceType,
      ProductSizes? productSizes,
      int? price,
      int? supply,
      String? size,
      String? barCode});

  @override
  $ProductSizesCopyWith<$Res>? get productSizes;
}

/// @nodoc
class __$$ProductModelImplCopyWithImpl<$Res>
    extends _$ProductModelCopyWithImpl<$Res, _$ProductModelImpl>
    implements _$$ProductModelImplCopyWith<$Res> {
  __$$ProductModelImplCopyWithImpl(
      _$ProductModelImpl _value, $Res Function(_$ProductModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? name = null,
    Object? image = null,
    Object? isInclusion = null,
    Object? priceType = null,
    Object? productSizes = freezed,
    Object? price = freezed,
    Object? supply = freezed,
    Object? size = freezed,
    Object? barCode = freezed,
  }) {
    return _then(_$ProductModelImpl(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      isInclusion: null == isInclusion
          ? _value.isInclusion
          : isInclusion // ignore: cast_nullable_to_non_nullable
              as bool,
      priceType: null == priceType
          ? _value.priceType
          : priceType // ignore: cast_nullable_to_non_nullable
              as String,
      productSizes: freezed == productSizes
          ? _value.productSizes
          : productSizes // ignore: cast_nullable_to_non_nullable
              as ProductSizes?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      supply: freezed == supply
          ? _value.supply
          : supply // ignore: cast_nullable_to_non_nullable
              as int?,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as String?,
      barCode: freezed == barCode
          ? _value.barCode
          : barCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductModelImpl implements _ProductModel {
  const _$ProductModelImpl(
      {required this.productId,
      required this.name,
      required this.image,
      required this.isInclusion,
      required this.priceType,
      this.productSizes = null,
      this.price = null,
      this.supply = null,
      this.size = null,
      this.barCode = null});

  factory _$ProductModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductModelImplFromJson(json);

  @override
  final String productId;
  @override
  final String name;
  @override
  final String image;
  @override
  final bool isInclusion;
  @override
  final String priceType;
  @override
  @JsonKey()
  final ProductSizes? productSizes;
  @override
  @JsonKey()
  final int? price;
  @override
  @JsonKey()
  final int? supply;
  @override
  @JsonKey()
  final String? size;
  @override
  @JsonKey()
  final String? barCode;

  @override
  String toString() {
    return 'ProductModel(productId: $productId, name: $name, image: $image, isInclusion: $isInclusion, priceType: $priceType, productSizes: $productSizes, price: $price, supply: $supply, size: $size, barCode: $barCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductModelImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.isInclusion, isInclusion) ||
                other.isInclusion == isInclusion) &&
            (identical(other.priceType, priceType) ||
                other.priceType == priceType) &&
            (identical(other.productSizes, productSizes) ||
                other.productSizes == productSizes) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.supply, supply) || other.supply == supply) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.barCode, barCode) || other.barCode == barCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, productId, name, image,
      isInclusion, priceType, productSizes, price, supply, size, barCode);

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductModelImplCopyWith<_$ProductModelImpl> get copyWith =>
      __$$ProductModelImplCopyWithImpl<_$ProductModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductModelImplToJson(
      this,
    );
  }
}

abstract class _ProductModel implements ProductModel {
  const factory _ProductModel(
      {required final String productId,
      required final String name,
      required final String image,
      required final bool isInclusion,
      required final String priceType,
      final ProductSizes? productSizes,
      final int? price,
      final int? supply,
      final String? size,
      final String? barCode}) = _$ProductModelImpl;

  factory _ProductModel.fromJson(Map<String, dynamic> json) =
      _$ProductModelImpl.fromJson;

  @override
  String get productId;
  @override
  String get name;
  @override
  String get image;
  @override
  bool get isInclusion;
  @override
  String get priceType;
  @override
  ProductSizes? get productSizes;
  @override
  int? get price;
  @override
  int? get supply;
  @override
  String? get size;
  @override
  String? get barCode;

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductModelImplCopyWith<_$ProductModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProductSizes _$ProductSizesFromJson(Map<String, dynamic> json) {
  return _ProductSizes.fromJson(json);
}

/// @nodoc
mixin _$ProductSizes {
  String get size => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  int get supply => throw _privateConstructorUsedError;
  String? get barCode => throw _privateConstructorUsedError;

  /// Serializes this ProductSizes to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductSizes
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductSizesCopyWith<ProductSizes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductSizesCopyWith<$Res> {
  factory $ProductSizesCopyWith(
          ProductSizes value, $Res Function(ProductSizes) then) =
      _$ProductSizesCopyWithImpl<$Res, ProductSizes>;
  @useResult
  $Res call({String size, int price, int supply, String? barCode});
}

/// @nodoc
class _$ProductSizesCopyWithImpl<$Res, $Val extends ProductSizes>
    implements $ProductSizesCopyWith<$Res> {
  _$ProductSizesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductSizes
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? size = null,
    Object? price = null,
    Object? supply = null,
    Object? barCode = freezed,
  }) {
    return _then(_value.copyWith(
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      supply: null == supply
          ? _value.supply
          : supply // ignore: cast_nullable_to_non_nullable
              as int,
      barCode: freezed == barCode
          ? _value.barCode
          : barCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductSizesImplCopyWith<$Res>
    implements $ProductSizesCopyWith<$Res> {
  factory _$$ProductSizesImplCopyWith(
          _$ProductSizesImpl value, $Res Function(_$ProductSizesImpl) then) =
      __$$ProductSizesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String size, int price, int supply, String? barCode});
}

/// @nodoc
class __$$ProductSizesImplCopyWithImpl<$Res>
    extends _$ProductSizesCopyWithImpl<$Res, _$ProductSizesImpl>
    implements _$$ProductSizesImplCopyWith<$Res> {
  __$$ProductSizesImplCopyWithImpl(
      _$ProductSizesImpl _value, $Res Function(_$ProductSizesImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductSizes
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? size = null,
    Object? price = null,
    Object? supply = null,
    Object? barCode = freezed,
  }) {
    return _then(_$ProductSizesImpl(
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      supply: null == supply
          ? _value.supply
          : supply // ignore: cast_nullable_to_non_nullable
              as int,
      barCode: freezed == barCode
          ? _value.barCode
          : barCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductSizesImpl implements _ProductSizes {
  const _$ProductSizesImpl(
      {required this.size,
      required this.price,
      required this.supply,
      this.barCode = null});

  factory _$ProductSizesImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductSizesImplFromJson(json);

  @override
  final String size;
  @override
  final int price;
  @override
  final int supply;
  @override
  @JsonKey()
  final String? barCode;

  @override
  String toString() {
    return 'ProductSizes(size: $size, price: $price, supply: $supply, barCode: $barCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductSizesImpl &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.supply, supply) || other.supply == supply) &&
            (identical(other.barCode, barCode) || other.barCode == barCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, size, price, supply, barCode);

  /// Create a copy of ProductSizes
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductSizesImplCopyWith<_$ProductSizesImpl> get copyWith =>
      __$$ProductSizesImplCopyWithImpl<_$ProductSizesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductSizesImplToJson(
      this,
    );
  }
}

abstract class _ProductSizes implements ProductSizes {
  const factory _ProductSizes(
      {required final String size,
      required final int price,
      required final int supply,
      final String? barCode}) = _$ProductSizesImpl;

  factory _ProductSizes.fromJson(Map<String, dynamic> json) =
      _$ProductSizesImpl.fromJson;

  @override
  String get size;
  @override
  int get price;
  @override
  int get supply;
  @override
  String? get barCode;

  /// Create a copy of ProductSizes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductSizesImplCopyWith<_$ProductSizesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
