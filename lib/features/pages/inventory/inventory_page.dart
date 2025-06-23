import 'package:flutter/material.dart';
import 'package:searchfield/searchfield.dart';
import 'package:tinda_one_app/features/pages/inventory/add_product_dialog/add_product_dialog.dart';
import 'package:tinda_one_app/shared/common/product_card.dart';

class InventoryPage extends StatelessWidget {
  const InventoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final suggestions = [
      SearchFieldListItem('Blue Blouse'),
      SearchFieldListItem('Red Shirt'),
      SearchFieldListItem('Green Skirt'),
      SearchFieldListItem('Yellow Pants'),
      SearchFieldListItem('Black Jacket'),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventory'),
        actions: [_buildAddButton(context)],
      ),
      body: _buildMainContent(context, suggestions),
    );
  }

  Widget _buildMainContent(
    BuildContext context,
    List<SearchFieldListItem<dynamic>> suggestions,
  ) {
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
          Expanded(child: _buildProductList()),
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

  Widget _buildProductList() {
    return GridView.builder(
      itemCount: 10,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.65,
      ),
      itemBuilder: (context, index) => ProductCard(
        productId: '1',
        name: 'Product Name',
        photo: 'https://picsum.photos/200/300',
        sizes: ['S', 'M', 'L'],
        supply: 1,
        onSizesTap: () {},
        onTap: () {},
      ),
    );
  }
}
