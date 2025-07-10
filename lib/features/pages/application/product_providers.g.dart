// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$productRepositoryHash() => r'fadddd21d5f9fee5a8e1e22ab93de919dfd371e9';

/// See also [productRepository].
@ProviderFor(productRepository)
final productRepositoryProvider =
    AutoDisposeProvider<ProductRepository>.internal(
  productRepository,
  name: r'productRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$productRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ProductRepositoryRef = AutoDisposeProviderRef<ProductRepository>;
String _$productServicesHash() => r'26cd969c535e6cd623f936fefc68666000fca452';

/// See also [productServices].
@ProviderFor(productServices)
final productServicesProvider = AutoDisposeProvider<ProductServices>.internal(
  productServices,
  name: r'productServicesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$productServicesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ProductServicesRef = AutoDisposeProviderRef<ProductServices>;
String _$createProductHash() => r'ceebc7c82cdcaceee7c6d5a6afa5fb449d60d6c0';

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

/// See also [createProduct].
@ProviderFor(createProduct)
const createProductProvider = CreateProductFamily();

/// See also [createProduct].
class CreateProductFamily extends Family<AsyncValue<void>> {
  /// See also [createProduct].
  const CreateProductFamily();

  /// See also [createProduct].
  CreateProductProvider call({
    required ProductModel product,
    File? imageFile,
  }) {
    return CreateProductProvider(
      product: product,
      imageFile: imageFile,
    );
  }

  @override
  CreateProductProvider getProviderOverride(
    covariant CreateProductProvider provider,
  ) {
    return call(
      product: provider.product,
      imageFile: provider.imageFile,
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
  String? get name => r'createProductProvider';
}

/// See also [createProduct].
class CreateProductProvider extends AutoDisposeFutureProvider<void> {
  /// See also [createProduct].
  CreateProductProvider({
    required ProductModel product,
    File? imageFile,
  }) : this._internal(
          (ref) => createProduct(
            ref as CreateProductRef,
            product: product,
            imageFile: imageFile,
          ),
          from: createProductProvider,
          name: r'createProductProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$createProductHash,
          dependencies: CreateProductFamily._dependencies,
          allTransitiveDependencies:
              CreateProductFamily._allTransitiveDependencies,
          product: product,
          imageFile: imageFile,
        );

  CreateProductProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.product,
    required this.imageFile,
  }) : super.internal();

  final ProductModel product;
  final File? imageFile;

  @override
  Override overrideWith(
    FutureOr<void> Function(CreateProductRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CreateProductProvider._internal(
        (ref) => create(ref as CreateProductRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        product: product,
        imageFile: imageFile,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _CreateProductProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CreateProductProvider &&
        other.product == product &&
        other.imageFile == imageFile;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, product.hashCode);
    hash = _SystemHash.combine(hash, imageFile.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CreateProductRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `product` of this provider.
  ProductModel get product;

  /// The parameter `imageFile` of this provider.
  File? get imageFile;
}

class _CreateProductProviderElement
    extends AutoDisposeFutureProviderElement<void> with CreateProductRef {
  _CreateProductProviderElement(super.provider);

  @override
  ProductModel get product => (origin as CreateProductProvider).product;
  @override
  File? get imageFile => (origin as CreateProductProvider).imageFile;
}

String _$fetchAllProductsHash() => r'a98713c23665207ee25fb681721f7b3f01449b8e';

/// See also [fetchAllProducts].
@ProviderFor(fetchAllProducts)
final fetchAllProductsProvider =
    AutoDisposeFutureProvider<List<ProductModel>>.internal(
  fetchAllProducts,
  name: r'fetchAllProductsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchAllProductsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FetchAllProductsRef = AutoDisposeFutureProviderRef<List<ProductModel>>;
String _$fetchProductHash() => r'2c38b9e744d65db25523ddf3ce99497dc570ad16';

/// See also [fetchProduct].
@ProviderFor(fetchProduct)
const fetchProductProvider = FetchProductFamily();

/// See also [fetchProduct].
class FetchProductFamily extends Family<AsyncValue<ProductModel?>> {
  /// See also [fetchProduct].
  const FetchProductFamily();

  /// See also [fetchProduct].
  FetchProductProvider call({
    required String productId,
  }) {
    return FetchProductProvider(
      productId: productId,
    );
  }

  @override
  FetchProductProvider getProviderOverride(
    covariant FetchProductProvider provider,
  ) {
    return call(
      productId: provider.productId,
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
  String? get name => r'fetchProductProvider';
}

/// See also [fetchProduct].
class FetchProductProvider extends AutoDisposeFutureProvider<ProductModel?> {
  /// See also [fetchProduct].
  FetchProductProvider({
    required String productId,
  }) : this._internal(
          (ref) => fetchProduct(
            ref as FetchProductRef,
            productId: productId,
          ),
          from: fetchProductProvider,
          name: r'fetchProductProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchProductHash,
          dependencies: FetchProductFamily._dependencies,
          allTransitiveDependencies:
              FetchProductFamily._allTransitiveDependencies,
          productId: productId,
        );

  FetchProductProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.productId,
  }) : super.internal();

  final String productId;

  @override
  Override overrideWith(
    FutureOr<ProductModel?> Function(FetchProductRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchProductProvider._internal(
        (ref) => create(ref as FetchProductRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        productId: productId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<ProductModel?> createElement() {
    return _FetchProductProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchProductProvider && other.productId == productId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, productId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FetchProductRef on AutoDisposeFutureProviderRef<ProductModel?> {
  /// The parameter `productId` of this provider.
  String get productId;
}

class _FetchProductProviderElement
    extends AutoDisposeFutureProviderElement<ProductModel?>
    with FetchProductRef {
  _FetchProductProviderElement(super.provider);

  @override
  String get productId => (origin as FetchProductProvider).productId;
}

String _$updateProductHash() => r'17bd67b588ac9ebd4f664c00048780663d8689d1';

/// See also [updateProduct].
@ProviderFor(updateProduct)
const updateProductProvider = UpdateProductFamily();

/// See also [updateProduct].
class UpdateProductFamily extends Family<AsyncValue<void>> {
  /// See also [updateProduct].
  const UpdateProductFamily();

  /// See also [updateProduct].
  UpdateProductProvider call({
    required ProductModel product,
    File? imageFile,
  }) {
    return UpdateProductProvider(
      product: product,
      imageFile: imageFile,
    );
  }

  @override
  UpdateProductProvider getProviderOverride(
    covariant UpdateProductProvider provider,
  ) {
    return call(
      product: provider.product,
      imageFile: provider.imageFile,
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
  String? get name => r'updateProductProvider';
}

/// See also [updateProduct].
class UpdateProductProvider extends AutoDisposeFutureProvider<void> {
  /// See also [updateProduct].
  UpdateProductProvider({
    required ProductModel product,
    File? imageFile,
  }) : this._internal(
          (ref) => updateProduct(
            ref as UpdateProductRef,
            product: product,
            imageFile: imageFile,
          ),
          from: updateProductProvider,
          name: r'updateProductProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updateProductHash,
          dependencies: UpdateProductFamily._dependencies,
          allTransitiveDependencies:
              UpdateProductFamily._allTransitiveDependencies,
          product: product,
          imageFile: imageFile,
        );

  UpdateProductProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.product,
    required this.imageFile,
  }) : super.internal();

  final ProductModel product;
  final File? imageFile;

  @override
  Override overrideWith(
    FutureOr<void> Function(UpdateProductRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdateProductProvider._internal(
        (ref) => create(ref as UpdateProductRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        product: product,
        imageFile: imageFile,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _UpdateProductProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateProductProvider &&
        other.product == product &&
        other.imageFile == imageFile;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, product.hashCode);
    hash = _SystemHash.combine(hash, imageFile.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UpdateProductRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `product` of this provider.
  ProductModel get product;

  /// The parameter `imageFile` of this provider.
  File? get imageFile;
}

class _UpdateProductProviderElement
    extends AutoDisposeFutureProviderElement<void> with UpdateProductRef {
  _UpdateProductProviderElement(super.provider);

  @override
  ProductModel get product => (origin as UpdateProductProvider).product;
  @override
  File? get imageFile => (origin as UpdateProductProvider).imageFile;
}

String _$deleteProductHash() => r'7fc93279f04e81beca50c7251aaf66470e601e29';

/// See also [deleteProduct].
@ProviderFor(deleteProduct)
const deleteProductProvider = DeleteProductFamily();

/// See also [deleteProduct].
class DeleteProductFamily extends Family<AsyncValue<void>> {
  /// See also [deleteProduct].
  const DeleteProductFamily();

  /// See also [deleteProduct].
  DeleteProductProvider call({
    required String productId,
  }) {
    return DeleteProductProvider(
      productId: productId,
    );
  }

  @override
  DeleteProductProvider getProviderOverride(
    covariant DeleteProductProvider provider,
  ) {
    return call(
      productId: provider.productId,
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
  String? get name => r'deleteProductProvider';
}

/// See also [deleteProduct].
class DeleteProductProvider extends AutoDisposeFutureProvider<void> {
  /// See also [deleteProduct].
  DeleteProductProvider({
    required String productId,
  }) : this._internal(
          (ref) => deleteProduct(
            ref as DeleteProductRef,
            productId: productId,
          ),
          from: deleteProductProvider,
          name: r'deleteProductProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$deleteProductHash,
          dependencies: DeleteProductFamily._dependencies,
          allTransitiveDependencies:
              DeleteProductFamily._allTransitiveDependencies,
          productId: productId,
        );

  DeleteProductProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.productId,
  }) : super.internal();

  final String productId;

  @override
  Override overrideWith(
    FutureOr<void> Function(DeleteProductRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DeleteProductProvider._internal(
        (ref) => create(ref as DeleteProductRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        productId: productId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _DeleteProductProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteProductProvider && other.productId == productId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, productId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin DeleteProductRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `productId` of this provider.
  String get productId;
}

class _DeleteProductProviderElement
    extends AutoDisposeFutureProviderElement<void> with DeleteProductRef {
  _DeleteProductProviderElement(super.provider);

  @override
  String get productId => (origin as DeleteProductProvider).productId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
