import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:searchfield/searchfield.dart';
import 'package:tinda_one_app/features/pages/application/product_providers.dart';
import 'package:tinda_one_app/features/pages/domain/product_model.dart';
import 'package:tinda_one_app/features/pages/presentation/inventory/add_product_dialog/add_product_dialog.dart';
import 'package:tinda_one_app/features/pages/presentation/inventory/view_product_dialog/view_product_dialog.dart';
import 'package:tinda_one_app/shared/common/product_card.dart';
import 'package:tinda_one_app/shared/themes/app_colors.dart';
import 'package:tinda_one_app/shared/themes/app_theme_config.dart';

class InventoryPage extends ConsumerWidget {
  const InventoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final suggestions = [
      SearchFieldListItem('Blue Blouse'),
      SearchFieldListItem('Red Shirt'),
      SearchFieldListItem('Green Skirt'),
      SearchFieldListItem('Yellow Pants'),
      SearchFieldListItem('Black Jacket'),
    ];

    final productsAsync = ref.watch(fetchAllProductsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventory'),
        actions: [_buildAddButton(context)],
      ),
      body: _buildMainContent(
        context,
        suggestions,
        productsAsync: productsAsync,
      ),
    );
  }

  Widget _buildMainContent(
    BuildContext context,
    List<SearchFieldListItem<dynamic>> suggestions, {
    required AsyncValue<List<ProductModel>> productsAsync,
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
            child: _buildProductList(context, productsAsync: productsAsync),
          ),
        ],
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

  Widget _buildAddButton(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: IconButton(
        icon: const Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => AddProductDialog(),
          );
        },
      ),
    );
  }

  Widget _buildProductList(
    BuildContext context, {
    required AsyncValue<List<ProductModel>> productsAsync,
  }) {
    return productsAsync.when(
      data: (products) {
        // If products is empty
        if (products.isEmpty) {
          return Center(
            child: Text(
              'No products have been added yet.',
              style: context.labelSmall,
            ),
          );
        }

        return GridView.builder(
          itemCount: products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.65,
          ),
          itemBuilder: (context, index) {
            final product = products[index];

            return ProductCard(
              productId: product.productId,
              name: product.name,
              photo: product.image,
              supply: product.supply ?? getTotalSupply(product.productSizes!),
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => ViewProductDialog(product: product),
                );
              },
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

  int getTotalSupply(List<ProductSizes> productSizes) {
    return productSizes.fold(0, (sum, sizes) => sum + sizes.supply);
  }
}
