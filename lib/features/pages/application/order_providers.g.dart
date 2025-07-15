// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$orderRepositoryHash() => r'45e43c25b02718319449911db7dc1d584c48246a';

/// See also [orderRepository].
@ProviderFor(orderRepository)
final orderRepositoryProvider = AutoDisposeProvider<OrderRepository>.internal(
  orderRepository,
  name: r'orderRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$orderRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef OrderRepositoryRef = AutoDisposeProviderRef<OrderRepository>;
String _$orderServicesHash() => r'bbd88beaf49002af9995676ce3dddda9669d8529';

/// See also [orderServices].
@ProviderFor(orderServices)
final orderServicesProvider = AutoDisposeProvider<OrderServices>.internal(
  orderServices,
  name: r'orderServicesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$orderServicesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef OrderServicesRef = AutoDisposeProviderRef<OrderServices>;
String _$createOrderHash() => r'f7c1e449027deeaedb3ad0f8195c5521a8e53cf3';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [createOrder].
@ProviderFor(createOrder)
const createOrderProvider = CreateOrderFamily();

/// See also [createOrder].
class CreateOrderFamily extends Family<AsyncValue<void>> {
  /// See also [createOrder].
  const CreateOrderFamily();

  /// See also [createOrder].
  CreateOrderProvider call({
    required OrderModel order,
  }) {
    return CreateOrderProvider(
      order: order,
    );
  }

  @override
  CreateOrderProvider getProviderOverride(
    covariant CreateOrderProvider provider,
  ) {
    return call(
      order: provider.order,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'createOrderProvider';
}

/// See also [createOrder].
class CreateOrderProvider extends AutoDisposeFutureProvider<void> {
  /// See also [createOrder].
  CreateOrderProvider({
    required OrderModel order,
  }) : this._internal(
          (ref) => createOrder(
            ref as CreateOrderRef,
            order: order,
          ),
          from: createOrderProvider,
          name: r'createOrderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$createOrderHash,
          dependencies: CreateOrderFamily._dependencies,
          allTransitiveDependencies:
              CreateOrderFamily._allTransitiveDependencies,
          order: order,
        );

  CreateOrderProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.order,
  }) : super.internal();

  final OrderModel order;

  @override
  Override overrideWith(
    FutureOr<void> Function(CreateOrderRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CreateOrderProvider._internal(
        (ref) => create(ref as CreateOrderRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        order: order,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _CreateOrderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CreateOrderProvider && other.order == order;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, order.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CreateOrderRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `order` of this provider.
  OrderModel get order;
}

class _CreateOrderProviderElement extends AutoDisposeFutureProviderElement<void>
    with CreateOrderRef {
  _CreateOrderProviderElement(super.provider);

  @override
  OrderModel get order => (origin as CreateOrderProvider).order;
}

String _$fetchAllOrdersHash() => r'a6d7c0520c6ef0304019ddc3795e6e87746b8151';

/// See also [fetchAllOrders].
@ProviderFor(fetchAllOrders)
final fetchAllOrdersProvider =
    AutoDisposeFutureProvider<List<OrderModel>>.internal(
  fetchAllOrders,
  name: r'fetchAllOrdersProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchAllOrdersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FetchAllOrdersRef = AutoDisposeFutureProviderRef<List<OrderModel>>;
String _$fetchOrderHash() => r'238596a1be09d7f3f3e8eeff06a34f4e886d0d6f';

/// See also [fetchOrder].
@ProviderFor(fetchOrder)
const fetchOrderProvider = FetchOrderFamily();

/// See also [fetchOrder].
class FetchOrderFamily extends Family<AsyncValue<OrderModel?>> {
  /// See also [fetchOrder].
  const FetchOrderFamily();

  /// See also [fetchOrder].
  FetchOrderProvider call({
    required String orderId,
  }) {
    return FetchOrderProvider(
      orderId: orderId,
    );
  }

  @override
  FetchOrderProvider getProviderOverride(
    covariant FetchOrderProvider provider,
  ) {
    return call(
      orderId: provider.orderId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'fetchOrderProvider';
}

/// See also [fetchOrder].
class FetchOrderProvider extends AutoDisposeFutureProvider<OrderModel?> {
  /// See also [fetchOrder].
  FetchOrderProvider({
    required String orderId,
  }) : this._internal(
          (ref) => fetchOrder(
            ref as FetchOrderRef,
            orderId: orderId,
          ),
          from: fetchOrderProvider,
          name: r'fetchOrderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchOrderHash,
          dependencies: FetchOrderFamily._dependencies,
          allTransitiveDependencies:
              FetchOrderFamily._allTransitiveDependencies,
          orderId: orderId,
        );

  FetchOrderProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.orderId,
  }) : super.internal();

  final String orderId;

  @override
  Override overrideWith(
    FutureOr<OrderModel?> Function(FetchOrderRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchOrderProvider._internal(
        (ref) => create(ref as FetchOrderRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        orderId: orderId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<OrderModel?> createElement() {
    return _FetchOrderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchOrderProvider && other.orderId == orderId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, orderId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FetchOrderRef on AutoDisposeFutureProviderRef<OrderModel?> {
  /// The parameter `orderId` of this provider.
  String get orderId;
}

class _FetchOrderProviderElement
    extends AutoDisposeFutureProviderElement<OrderModel?> with FetchOrderRef {
  _FetchOrderProviderElement(super.provider);

  @override
  String get orderId => (origin as FetchOrderProvider).orderId;
}

String _$updateOrderHash() => r'6b2293b9530b6094b742a2bdee9a33cbfedf1844';

/// See also [updateOrder].
@ProviderFor(updateOrder)
const updateOrderProvider = UpdateOrderFamily();

/// See also [updateOrder].
class UpdateOrderFamily extends Family<AsyncValue<void>> {
  /// See also [updateOrder].
  const UpdateOrderFamily();

  /// See also [updateOrder].
  UpdateOrderProvider call({
    required OrderModel order,
  }) {
    return UpdateOrderProvider(
      order: order,
    );
  }

  @override
  UpdateOrderProvider getProviderOverride(
    covariant UpdateOrderProvider provider,
  ) {
    return call(
      order: provider.order,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'updateOrderProvider';
}

/// See also [updateOrder].
class UpdateOrderProvider extends AutoDisposeFutureProvider<void> {
  /// See also [updateOrder].
  UpdateOrderProvider({
    required OrderModel order,
  }) : this._internal(
          (ref) => updateOrder(
            ref as UpdateOrderRef,
            order: order,
          ),
          from: updateOrderProvider,
          name: r'updateOrderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updateOrderHash,
          dependencies: UpdateOrderFamily._dependencies,
          allTransitiveDependencies:
              UpdateOrderFamily._allTransitiveDependencies,
          order: order,
        );

  UpdateOrderProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.order,
  }) : super.internal();

  final OrderModel order;

  @override
  Override overrideWith(
    FutureOr<void> Function(UpdateOrderRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdateOrderProvider._internal(
        (ref) => create(ref as UpdateOrderRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        order: order,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _UpdateOrderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateOrderProvider && other.order == order;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, order.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UpdateOrderRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `order` of this provider.
  OrderModel get order;
}

class _UpdateOrderProviderElement extends AutoDisposeFutureProviderElement<void>
    with UpdateOrderRef {
  _UpdateOrderProviderElement(super.provider);

  @override
  OrderModel get order => (origin as UpdateOrderProvider).order;
}

String _$deleteOrderHash() => r'e5dcdd1ba05c07ab73c9661baa0c614c1edce845';

/// See also [deleteOrder].
@ProviderFor(deleteOrder)
const deleteOrderProvider = DeleteOrderFamily();

/// See also [deleteOrder].
class DeleteOrderFamily extends Family<AsyncValue<void>> {
  /// See also [deleteOrder].
  const DeleteOrderFamily();

  /// See also [deleteOrder].
  DeleteOrderProvider call({
    required String orderId,
  }) {
    return DeleteOrderProvider(
      orderId: orderId,
    );
  }

  @override
  DeleteOrderProvider getProviderOverride(
    covariant DeleteOrderProvider provider,
  ) {
    return call(
      orderId: provider.orderId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'deleteOrderProvider';
}

/// See also [deleteOrder].
class DeleteOrderProvider extends AutoDisposeFutureProvider<void> {
  /// See also [deleteOrder].
  DeleteOrderProvider({
    required String orderId,
  }) : this._internal(
          (ref) => deleteOrder(
            ref as DeleteOrderRef,
            orderId: orderId,
          ),
          from: deleteOrderProvider,
          name: r'deleteOrderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$deleteOrderHash,
          dependencies: DeleteOrderFamily._dependencies,
          allTransitiveDependencies:
              DeleteOrderFamily._allTransitiveDependencies,
          orderId: orderId,
        );

  DeleteOrderProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.orderId,
  }) : super.internal();

  final String orderId;

  @override
  Override overrideWith(
    FutureOr<void> Function(DeleteOrderRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DeleteOrderProvider._internal(
        (ref) => create(ref as DeleteOrderRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        orderId: orderId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _DeleteOrderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteOrderProvider && other.orderId == orderId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, orderId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin DeleteOrderRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `orderId` of this provider.
  String get orderId;
}

class _DeleteOrderProviderElement extends AutoDisposeFutureProviderElement<void>
    with DeleteOrderRef {
  _DeleteOrderProviderElement(super.provider);

  @override
  String get orderId => (origin as DeleteOrderProvider).orderId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
