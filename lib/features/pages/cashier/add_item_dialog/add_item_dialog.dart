import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:tinda_one_app/shared/common/item_counter.dart';
import 'package:tinda_one_app/shared/themes/app_colors.dart';

class AddItemDialog extends HookWidget {
  final String productId;
  final String name;
  final List<String> sizes;

  const AddItemDialog({
    super.key,
    required this.productId,
    required this.name,
    required this.sizes,
  });

  @override
  Widget build(BuildContext context) {
    final selectedSizes = useState<List<String>>([]);
    // Map to store individual counts for each size
    final sizeCounts = useState<Map<String, int>>({});

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDialogHeader(context),

          const SizedBox(height: 10),
          _buildAvailableSizes(
            context,
            selectedSizes: selectedSizes,
            sizeCounts: sizeCounts,
          ),

          if (selectedSizes.value.isNotEmpty) ...[
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Selected: ${selectedSizes.value.length} size${selectedSizes.value.length == 1 ? '' : 's'}',
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(color: AppColors.appPrimary),
              ),
            ),
            const SizedBox(height: 10),
            _buildSelectedSizes(selectedSizes, context, sizeCounts),

            const SizedBox(height: 10),
            _buildActionButtons(context),
          ],
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton.icon(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(AppColors.appSecondary),
              ),
              onPressed: () {
                context.pop();
              },
              icon: Icon(Icons.cancel, color: AppColors.lightBackground),
              label: Text('Cancel'),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: ElevatedButton.icon(
              icon: Icon(Icons.shopping_cart_checkout),
              onPressed: () {
                context.pop();
              },
              label: Text('Add to Cart'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSelectedSizes(
    ValueNotifier<List<String>> selectedSizes,
    BuildContext context,
    ValueNotifier<Map<String, int>> sizeCounts,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: List.generate(selectedSizes.value.length, (index) {
          final size = selectedSizes.value[index];
          final countNotifier = useState<int>(sizeCounts.value[size] ?? 1);

          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              children: [
                // Selected Size
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Theme.of(context).dividerColor,
                        width: 2,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        size,
                        style: Theme.of(context).textTheme.displaySmall!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),

                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(FontAwesomeIcons.pesoSign),
                      Text(
                        '500',
                        style: Theme.of(context).textTheme.displaySmall!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),

                // Item Counter
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: ItemCounter(count: countNotifier),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _buildDialogHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: AppColors.appTertiary.withValues(alpha: 0.2),
      child: Row(
        children: [
          Icon(Icons.sell, color: AppColors.appSecondary),
          const SizedBox(width: 10),
          Text(
            name,
            style: Theme.of(
              context,
            ).textTheme.titleMedium!.copyWith(color: AppColors.appPrimary),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              context.pop();
            },
            icon: Icon(Icons.close),
          ),
        ],
      ),
    );
  }

  Widget _buildAvailableSizes(
    BuildContext context, {
    required ValueNotifier<List<String>> selectedSizes,
    required ValueNotifier<Map<String, int>> sizeCounts,
  }) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Available Sizes:',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          const SizedBox(height: 20),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: sizes.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              childAspectRatio: 1.5,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
            ),
            itemBuilder: (context, index) {
              final size = sizes[index];
              return ChoiceChip(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                visualDensity: VisualDensity.compact,
                label: Text(size),
                selected: selectedSizes.value.contains(size),
                onSelected: (bool selected) {
                  if (selected) {
                    // Create a new list with the added item
                    selectedSizes.value = [...selectedSizes.value, size];
                    // Initialize count for this size
                    sizeCounts.value = {...sizeCounts.value, size: 1};
                  } else {
                    // Create a new list without the removed item
                    selectedSizes.value = selectedSizes.value
                        .where((selectedSize) => selectedSize != size)
                        .toList();
                    // Remove count for this size
                    final newCounts = Map<String, int>.from(sizeCounts.value);
                    newCounts.remove(size);
                    sizeCounts.value = newCounts;
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
