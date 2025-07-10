// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) {
  return _OrderModel.fromJson(json);
}

/// @nodoc
mixin _$OrderModel {
  String get orderId => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  List<OrderItems> get items => throw _privateConstructorUsedError;
  int get totalAmount => throw _privateConstructorUsedError;
  int? get discount => throw _privateConstructorUsedError;
  List<OrderInclusion>? get inclusion => throw _privateConstructorUsedError;

  /// Serializes this OrderModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderModelCopyWith<OrderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderModelCopyWith<$Res> {
  factory $OrderModelCopyWith(
          OrderModel value, $Res Function(OrderModel) then) =
      _$OrderModelCopyWithImpl<$Res, OrderModel>;
  @useResult
  $Res call(
      {String orderId,
      DateTime date,
      List<OrderItems> items,
      int totalAmount,
      int? discount,
      List<OrderInclusion>? inclusion});
}

/// @nodoc
class _$OrderModelCopyWithImpl<$Res, $Val extends OrderModel>
    implements $OrderModelCopyWith<$Res> {
  _$OrderModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? date = null,
    Object? items = null,
    Object? totalAmount = null,
    Object? discount = freezed,
    Object? inclusion = freezed,
  }) {
    return _then(_value.copyWith(
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<OrderItems>,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as int,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as int?,
      inclusion: freezed == inclusion
          ? _value.inclusion
          : inclusion // ignore: cast_nullable_to_non_nullable
              as List<OrderInclusion>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderModelImplCopyWith<$Res>
    implements $OrderModelCopyWith<$Res> {
  factory _$$OrderModelImplCopyWith(
          _$OrderModelImpl value, $Res Function(_$OrderModelImpl) then) =
      __$$OrderModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String orderId,
      DateTime date,
      List<OrderItems> items,
      int totalAmount,
      int? discount,
      List<OrderInclusion>? inclusion});
}

/// @nodoc
class __$$OrderModelImplCopyWithImpl<$Res>
    extends _$OrderModelCopyWithImpl<$Res, _$OrderModelImpl>
    implements _$$OrderModelImplCopyWith<$Res> {
  __$$OrderModelImplCopyWithImpl(
      _$OrderModelImpl _value, $Res Function(_$OrderModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? date = null,
    Object? items = null,
    Object? totalAmount = null,
    Object? discount = freezed,
    Object? inclusion = freezed,
  }) {
    return _then(_$OrderModelImpl(
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<OrderItems>,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as int,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as int?,
      inclusion: freezed == inclusion
          ? _value._inclusion
          : inclusion // ignore: cast_nullable_to_non_nullable
              as List<OrderInclusion>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderModelImpl with DiagnosticableTreeMixin implements _OrderModel {
  const _$OrderModelImpl(
      {required this.orderId,
      required this.date,
      required final List<OrderItems> items,
      required this.totalAmount,
      this.discount,
      final List<OrderInclusion>? inclusion})
      : _items = items,
        _inclusion = inclusion;

  factory _$OrderModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderModelImplFromJson(json);

  @override
  final String orderId;
  @override
  final DateTime date;
  final List<OrderItems> _items;
  @override
  List<OrderItems> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final int totalAmount;
  @override
  final int? discount;
  final List<OrderInclusion>? _inclusion;
  @override
  List<OrderInclusion>? get inclusion {
    final value = _inclusion;
    if (value == null) return null;
    if (_inclusion is EqualUnmodifiableListView) return _inclusion;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'OrderModel(orderId: $orderId, date: $date, items: $items, totalAmount: $totalAmount, discount: $discount, inclusion: $inclusion)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'OrderModel'))
      ..add(DiagnosticsProperty('orderId', orderId))
      ..add(DiagnosticsProperty('date', date))
      ..add(DiagnosticsProperty('items', items))
      ..add(DiagnosticsProperty('totalAmount', totalAmount))
      ..add(DiagnosticsProperty('discount', discount))
      ..add(DiagnosticsProperty('inclusion', inclusion));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderModelImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            const DeepCollectionEquality()
                .equals(other._inclusion, _inclusion));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      orderId,
      date,
      const DeepCollectionEquality().hash(_items),
      totalAmount,
      discount,
      const DeepCollectionEquality().hash(_inclusion));

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderModelImplCopyWith<_$OrderModelImpl> get copyWith =>
      __$$OrderModelImplCopyWithImpl<_$OrderModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderModelImplToJson(
      this,
    );
  }
}

abstract class _OrderModel implements OrderModel {
  const factory _OrderModel(
      {required final String orderId,
      required final DateTime date,
      required final List<OrderItems> items,
      required final int totalAmount,
      final int? discount,
      final List<OrderInclusion>? inclusion}) = _$OrderModelImpl;

  factory _OrderModel.fromJson(Map<String, dynamic> json) =
      _$OrderModelImpl.fromJson;

  @override
  String get orderId;
  @override
  DateTime get date;
  @override
  List<OrderItems> get items;
  @override
  int get totalAmount;
  @override
  int? get discount;
  @override
  List<OrderInclusion>? get inclusion;

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderModelImplCopyWith<_$OrderModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderItems _$OrderItemsFromJson(Map<String, dynamic> json) {
  return _OrderItems.fromJson(json);
}

/// @nodoc
mixin _$OrderItems {
  String get productId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<ItemList>? get itemList => throw _privateConstructorUsedError;
  int? get price => throw _privateConstructorUsedError;
  int? get quantity => throw _privateConstructorUsedError;

  /// Serializes this OrderItems to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderItems
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderItemsCopyWith<OrderItems> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderItemsCopyWith<$Res> {
  factory $OrderItemsCopyWith(
          OrderItems value, $Res Function(OrderItems) then) =
      _$OrderItemsCopyWithImpl<$Res, OrderItems>;
  @useResult
  $Res call(
      {String productId,
      String name,
      List<ItemList>? itemList,
      int? price,
      int? quantity});
}

/// @nodoc
class _$OrderItemsCopyWithImpl<$Res, $Val extends OrderItems>
    implements $OrderItemsCopyWith<$Res> {
  _$OrderItemsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderItems
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? name = null,
    Object? itemList = freezed,
    Object? price = freezed,
    Object? quantity = freezed,
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
      itemList: freezed == itemList
          ? _value.itemList
          : itemList // ignore: cast_nullable_to_non_nullable
              as List<ItemList>?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderItemsImplCopyWith<$Res>
    implements $OrderItemsCopyWith<$Res> {
  factory _$$OrderItemsImplCopyWith(
          _$OrderItemsImpl value, $Res Function(_$OrderItemsImpl) then) =
      __$$OrderItemsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String productId,
      String name,
      List<ItemList>? itemList,
      int? price,
      int? quantity});
}

/// @nodoc
class __$$OrderItemsImplCopyWithImpl<$Res>
    extends _$OrderItemsCopyWithImpl<$Res, _$OrderItemsImpl>
    implements _$$OrderItemsImplCopyWith<$Res> {
  __$$OrderItemsImplCopyWithImpl(
      _$OrderItemsImpl _value, $Res Function(_$OrderItemsImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderItems
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? name = null,
    Object? itemList = freezed,
    Object? price = freezed,
    Object? quantity = freezed,
  }) {
    return _then(_$OrderItemsImpl(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      itemList: freezed == itemList
          ? _value._itemList
          : itemList // ignore: cast_nullable_to_non_nullable
              as List<ItemList>?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderItemsImpl with DiagnosticableTreeMixin implements _OrderItems {
  const _$OrderItemsImpl(
      {required this.productId,
      required this.name,
      final List<ItemList>? itemList,
      this.price,
      this.quantity})
      : _itemList = itemList;

  factory _$OrderItemsImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderItemsImplFromJson(json);

  @override
  final String productId;
  @override
  final String name;
  final List<ItemList>? _itemList;
  @override
  List<ItemList>? get itemList {
    final value = _itemList;
    if (value == null) return null;
    if (_itemList is EqualUnmodifiableListView) return _itemList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? price;
  @override
  final int? quantity;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'OrderItems(productId: $productId, name: $name, itemList: $itemList, price: $price, quantity: $quantity)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'OrderItems'))
      ..add(DiagnosticsProperty('productId', productId))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('itemList', itemList))
      ..add(DiagnosticsProperty('price', price))
      ..add(DiagnosticsProperty('quantity', quantity));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderItemsImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._itemList, _itemList) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, productId, name,
      const DeepCollectionEquality().hash(_itemList), price, quantity);

  /// Create a copy of OrderItems
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderItemsImplCopyWith<_$OrderItemsImpl> get copyWith =>
      __$$OrderItemsImplCopyWithImpl<_$OrderItemsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderItemsImplToJson(
      this,
    );
  }
}

abstract class _OrderItems implements OrderItems {
  const factory _OrderItems(
      {required final String productId,
      required final String name,
      final List<ItemList>? itemList,
      final int? price,
      final int? quantity}) = _$OrderItemsImpl;

  factory _OrderItems.fromJson(Map<String, dynamic> json) =
      _$OrderItemsImpl.fromJson;

  @override
  String get productId;
  @override
  String get name;
  @override
  List<ItemList>? get itemList;
  @override
  int? get price;
  @override
  int? get quantity;

  /// Create a copy of OrderItems
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderItemsImplCopyWith<_$OrderItemsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ItemList _$ItemListFromJson(Map<String, dynamic> json) {
  return _ItemList.fromJson(json);
}

/// @nodoc
mixin _$ItemList {
  String get size => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;

  /// Serializes this ItemList to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ItemList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ItemListCopyWith<ItemList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemListCopyWith<$Res> {
  factory $ItemListCopyWith(ItemList value, $Res Function(ItemList) then) =
      _$ItemListCopyWithImpl<$Res, ItemList>;
  @useResult
  $Res call({String size, int price, int quantity});
}

/// @nodoc
class _$ItemListCopyWithImpl<$Res, $Val extends ItemList>
    implements $ItemListCopyWith<$Res> {
  _$ItemListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ItemList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? size = null,
    Object? price = null,
    Object? quantity = null,
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
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ItemListImplCopyWith<$Res>
    implements $ItemListCopyWith<$Res> {
  factory _$$ItemListImplCopyWith(
          _$ItemListImpl value, $Res Function(_$ItemListImpl) then) =
      __$$ItemListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String size, int price, int quantity});
}

/// @nodoc
class __$$ItemListImplCopyWithImpl<$Res>
    extends _$ItemListCopyWithImpl<$Res, _$ItemListImpl>
    implements _$$ItemListImplCopyWith<$Res> {
  __$$ItemListImplCopyWithImpl(
      _$ItemListImpl _value, $Res Function(_$ItemListImpl) _then)
      : super(_value, _then);

  /// Create a copy of ItemList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? size = null,
    Object? price = null,
    Object? quantity = null,
  }) {
    return _then(_$ItemListImpl(
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ItemListImpl with DiagnosticableTreeMixin implements _ItemList {
  const _$ItemListImpl(
      {required this.size, required this.price, required this.quantity});

  factory _$ItemListImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemListImplFromJson(json);

  @override
  final String size;
  @override
  final int price;
  @override
  final int quantity;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ItemList(size: $size, price: $price, quantity: $quantity)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ItemList'))
      ..add(DiagnosticsProperty('size', size))
      ..add(DiagnosticsProperty('price', price))
      ..add(DiagnosticsProperty('quantity', quantity));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemListImpl &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, size, price, quantity);

  /// Create a copy of ItemList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemListImplCopyWith<_$ItemListImpl> get copyWith =>
      __$$ItemListImplCopyWithImpl<_$ItemListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemListImplToJson(
      this,
    );
  }
}

abstract class _ItemList implements ItemList {
  const factory _ItemList(
      {required final String size,
      required final int price,
      required final int quantity}) = _$ItemListImpl;

  factory _ItemList.fromJson(Map<String, dynamic> json) =
      _$ItemListImpl.fromJson;

  @override
  String get size;
  @override
  int get price;
  @override
  int get quantity;

  /// Create a copy of ItemList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ItemListImplCopyWith<_$ItemListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderInclusion _$OrderInclusionFromJson(Map<String, dynamic> json) {
  return _OrderInclusion.fromJson(json);
}

/// @nodoc
mixin _$OrderInclusion {
  String get productId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;

  /// Serializes this OrderInclusion to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderInclusion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderInclusionCopyWith<OrderInclusion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderInclusionCopyWith<$Res> {
  factory $OrderInclusionCopyWith(
          OrderInclusion value, $Res Function(OrderInclusion) then) =
      _$OrderInclusionCopyWithImpl<$Res, OrderInclusion>;
  @useResult
  $Res call({String productId, String name, int quantity});
}

/// @nodoc
class _$OrderInclusionCopyWithImpl<$Res, $Val extends OrderInclusion>
    implements $OrderInclusionCopyWith<$Res> {
  _$OrderInclusionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderInclusion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? name = null,
    Object? quantity = null,
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
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderInclusionImplCopyWith<$Res>
    implements $OrderInclusionCopyWith<$Res> {
  factory _$$OrderInclusionImplCopyWith(_$OrderInclusionImpl value,
          $Res Function(_$OrderInclusionImpl) then) =
      __$$OrderInclusionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String productId, String name, int quantity});
}

/// @nodoc
class __$$OrderInclusionImplCopyWithImpl<$Res>
    extends _$OrderInclusionCopyWithImpl<$Res, _$OrderInclusionImpl>
    implements _$$OrderInclusionImplCopyWith<$Res> {
  __$$OrderInclusionImplCopyWithImpl(
      _$OrderInclusionImpl _value, $Res Function(_$OrderInclusionImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderInclusion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? name = null,
    Object? quantity = null,
  }) {
    return _then(_$OrderInclusionImpl(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderInclusionImpl
    with DiagnosticableTreeMixin
    implements _OrderInclusion {
  const _$OrderInclusionImpl(
      {required this.productId, required this.name, required this.quantity});

  factory _$OrderInclusionImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderInclusionImplFromJson(json);

  @override
  final String productId;
  @override
  final String name;
  @override
  final int quantity;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'OrderInclusion(productId: $productId, name: $name, quantity: $quantity)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'OrderInclusion'))
      ..add(DiagnosticsProperty('productId', productId))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('quantity', quantity));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderInclusionImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, productId, name, quantity);

  /// Create a copy of OrderInclusion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderInclusionImplCopyWith<_$OrderInclusionImpl> get copyWith =>
      __$$OrderInclusionImplCopyWithImpl<_$OrderInclusionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderInclusionImplToJson(
      this,
    );
  }
}

abstract class _OrderInclusion implements OrderInclusion {
  const factory _OrderInclusion(
      {required final String productId,
      required final String name,
      required final int quantity}) = _$OrderInclusionImpl;

  factory _OrderInclusion.fromJson(Map<String, dynamic> json) =
      _$OrderInclusionImpl.fromJson;

  @override
  String get productId;
  @override
  String get name;
  @override
  int get quantity;

  /// Create a copy of OrderInclusion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderInclusionImplCopyWith<_$OrderInclusionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
