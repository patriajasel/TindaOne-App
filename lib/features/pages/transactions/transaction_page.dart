import 'package:flutter/material.dart';
import 'package:searchfield/searchfield.dart';
import 'package:tinda_one_app/features/pages/transactions/view_order_details/view_order_details.dart';
import 'package:tinda_one_app/shared/common/order_card.dart';
import 'package:tinda_one_app/shared/themes/app_colors.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({super.key});

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
      appBar: AppBar(title: const Text('Transaction')),
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

          // Order List
          Expanded(child: _buildOrderList()),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.receipt, color: Theme.of(context).colorScheme.secondary),
        const SizedBox(width: 10),
        Text(
          'Order List',
          style: Theme.of(
            context,
          ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        InkWell(
          onTap: () {},
          child: Icon(Icons.filter_alt_outlined, color: AppColors.appSecondary),
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

  Widget _buildOrderList() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return OrderCard(
          orderId: '00001',
          amount: 750,
          orderDate: DateTime.now(),
          onViewItems: () => showModalBottomSheet(
            context: context,
            builder: (context) => ViewOrderDetails(),
          ),
        );
      },
    );
  }
}
