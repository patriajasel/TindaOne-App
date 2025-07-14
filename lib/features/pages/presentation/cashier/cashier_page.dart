import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:searchfield/searchfield.dart';
import 'package:tinda_one_app/features/pages/application/product_providers.dart';
import 'package:tinda_one_app/features/pages/domain/order_model.dart';
import 'package:tinda_one_app/features/pages/domain/product_model.dart';
import 'package:tinda_one_app/features/pages/presentation/cashier/add_item_dialog/add_item_dialog.dart';
import 'package:tinda_one_app/features/pages/presentation/cashier/create_order/create_order_dialog.dart';
import 'package:tinda_one_app/shared/common/item_card.dart';
import 'package:tinda_one_app/shared/themes/app_colors.dart';
import 'package:tinda_one_app/shared/themes/app_theme_config.dart';

class CashierPage extends HookConsumerWidget {
  const CashierPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final suggestions = [
      SearchFieldListItem('Blue Blouse'),
      SearchFieldListItem('Red Shirt'),
      SearchFieldListItem('Green Skirt'),
      SearchFieldListItem('Yellow Pants'),
      SearchFieldListItem('Black Jacket'),
    ];

    final productAsync = ref.watch(fetchAllProductsProvider);

    final cart = useState<List<OrderItems>>([]);

    useEffect(() {
      void listener() {
        print('Cart updated: ${cart.value}');
      }

      cart.addListener(listener);

      return () => cart.removeListener(listener);
    }, [cart]);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cashier'),
        actions: [_buildCartButton(context, cart: cart)],
      ),
      body: _buildMainContent(
        context,
        suggestions,
        productAsync: productAsync,
        cart: cart,
      ),
    );
  }

  Widget _buildMainContent(
    BuildContext context,
    List<SearchFieldListItem<dynamic>> suggestions, {
    required AsyncValue<List<ProductModel>> productAsync,
    required ValueNotifier<List<OrderItems>> cart,
  }) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Section Title
          _buildSectionTitle(context),

          const SizedBox(height: 10),
          Divider(color: Theme.of(context).dividerColor, thickness: 1.5),

          // Search Field
          const SizedBox(height: 16),
          _buildSearchField(suggestions),
          const SizedBox(height: 16),

          // Product List
          Expanded(
            child: _buildProductList(
              context,
              productAsync: productAsync,
              cart: cart,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductList(
    BuildContext context, {
    required AsyncValue<List<ProductModel>> productAsync,
    required ValueNotifier<List<OrderItems>> cart,
  }) {
    return productAsync.when(
      data: (products) {
        if (products.isEmpty) {
          return Center(
            child: Text(
              'No products have been added yet.',
              style: context.labelSmall,
            ),
          );
        }

        return ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];

            return ItemCard(
              productId: product.productId,
              name: product.name,
              imageUrl: product.image,
              productSizes: product.productSizes,
              supply: product.supply,
              onPressed: () => showModalBottomSheet(
                context: context,
                builder: (context) =>
                    AddItemDialog(product: product, cart: cart),
              ),
            );
          },
        );
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator(color: AppColors.appPrimary),
        );
      },
      error: (err, stack) {
        return Center(
          child: Text(
            'Error loading products: ${err.toString()}',
            style: const TextStyle(color: Colors.red),
          ),
        );
      },
    );
  }

  Widget _buildSearchField(List<SearchFieldListItem<dynamic>> suggestions) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: SearchField(
        suggestions: suggestions,
        suggestionState: Suggestion.expand,
        maxSuggestionsInViewPort: 5,
        itemHeight: 50,
        searchInputDecoration: SearchInputDecoration(
          hintText: 'Search products...',
          prefixIcon: const Icon(Icons.search),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.inventory_2_outlined,
          color: Theme.of(context).colorScheme.secondary,
        ),
        const SizedBox(width: 10),
        Text(
          'Product Catalog',
          style: Theme.of(
            context,
          ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildCartButton(
    BuildContext context, {
    required ValueNotifier<List<OrderItems>> cart,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) => CreateOrderDialog(),
              );
            },
          ),
          Positioned(
            top: 6,
            right: 6,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: Text(
                cart.value.length.toString(),
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
