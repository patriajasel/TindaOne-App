import 'package:flutter/material.dart';
import 'package:searchfield/searchfield.dart';
import 'package:tinda_one_app/features/pages/cashier/add_item_dialog/add_item_dialog.dart';
import 'package:tinda_one_app/features/pages/cashier/create_order/create_order_dialog.dart';
import 'package:tinda_one_app/shared/common/item_card.dart';

class CashierPage extends StatelessWidget {
  const CashierPage({super.key});

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
        title: const Text('Cashier'),
        actions: [_buildCartButton(context)],
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

  Widget _buildProductList() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return ItemCard(
          productId: '1',
          name: 'Blue Blouse',
          imageUrl: 'https://picsum.photos/200/300',
          sizes: ['S', 'M', 'L', '16', '18', '20'],
          onPressed: () => showModalBottomSheet(
            context: context,
            builder: (context) => AddItemDialog(
              productId: '1',
              name: 'Blue Blouse',
              sizes: [
                '8',
                '10',
                '12',
                '14',
                '16',
                '18',
                '20',
                '22',
                '24',
                'XS',
                'S',
                'M',
                'L',
                'XL',
              ],
            ),
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

  Widget _buildCartButton(BuildContext context) {
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
              child: const Text(
                '3',
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
