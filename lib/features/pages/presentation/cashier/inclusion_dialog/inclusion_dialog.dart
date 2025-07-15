import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tinda_one_app/features/pages/application/product_providers.dart';
import 'package:tinda_one_app/features/pages/domain/order_model.dart';
import 'package:tinda_one_app/features/pages/domain/product_model.dart';
import 'package:tinda_one_app/shared/common/item_counter.dart';
import 'package:tinda_one_app/shared/themes/app_colors.dart';
import 'package:tinda_one_app/shared/themes/app_theme_config.dart';

class InclusionDialog extends HookConsumerWidget {
  final ValueNotifier<List<OrderInclusion>?> orderInclusions;
  const InclusionDialog({super.key, required this.orderInclusions});

  void _confirmInclusions(
    BuildContext context,
    ValueNotifier<Map<String, int>> inclusionCounts,
    List<ProductModel> inclusions,
  ) {
    // Convert the counts map to OrderInclusion objects
    final List<OrderInclusion> selectedInclusions = [];

    inclusionCounts.value.forEach((productId, count) {
      if (count > 0) {
        // Find the product to get its name
        final product = inclusions.firstWhere((p) => p.productId == productId);

        selectedInclusions.add(
          OrderInclusion(
            productId: productId,
            name: product.name,
            quantity: count,
          ),
        );
      }
    });

    // Update the orderInclusions ValueNotifier
    orderInclusions.value = selectedInclusions;

    // Close the dialog
    context.pop();
  }

  // Helper method to convert existing orderInclusions to counts map
  Map<String, int> _getInitialCounts() {
    if (orderInclusions.value == null) return {};

    final Map<String, int> counts = {};
    for (final inclusion in orderInclusions.value!) {
      counts[inclusion.productId] = inclusion.quantity;
    }
    return counts;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inclusionAsync = ref.watch(fetchAllInclusionProductProvider);

    // Initialize with existing values from orderInclusions
    final inclusionCounts = useState<Map<String, int>>(_getInitialCounts());

    return Dialog(
      child: Container(
        constraints: BoxConstraints(maxHeight: 400),
        child: Column(
          children: [
            _buildHeader(context),
            Expanded(
              child: _buildInclusionList(
                context,
                inclusionAsync: inclusionAsync,
                inclusionCounts: inclusionCounts,
              ),
            ),
            const SizedBox(height: 20),
            inclusionAsync.maybeWhen(
              data: (inclusions) => _buildActionButtons(
                context,
                inclusionCounts: inclusionCounts,
                inclusions: inclusions,
              ),
              orElse: () => const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: AppColors.appTertiary.withValues(alpha: 0.2),
      child: Row(
        children: [
          Icon(Icons.extension, color: AppColors.appSecondary),
          const SizedBox(width: 10),
          Text(
            'Inclusions',
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

  Widget _buildInclusionList(
    BuildContext context, {
    required AsyncValue<List<ProductModel>> inclusionAsync,
    required ValueNotifier<Map<String, int>> inclusionCounts,
  }) {
    return inclusionAsync.when(
      data: (inclusions) {
        if (inclusions.isEmpty) {
          return SizedBox(
            height: 200,
            child: Center(
              child: Text(
                'No Inclusion Products have been added yet.',
                style: context.labelSmall,
              ),
            ),
          );
        }

        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: List.generate(inclusions.length, (index) {
              final inclusion = inclusions[index];

              return _buildInclusionItem(
                context,
                inclusion: inclusion,
                inclusionCounts: inclusionCounts,
              );
            }),
          ),
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
            'Error loading inclusions: ${err.toString()}',
            style: const TextStyle(color: Colors.red),
          ),
        );
      },
    );
  }

  Widget _buildInclusionItem(
    BuildContext context, {
    required ProductModel inclusion,
    required ValueNotifier<Map<String, int>> inclusionCounts,
  }) {
    // Create a ValueNotifier for this specific item's count
    final countNotifier = useMemoized(
      () => ValueNotifier<int>(inclusionCounts.value[inclusion.productId] ?? 0),
      [inclusion.productId],
    );

    // Update the main inclusionCounts map when this item's count changes
    useEffect(() {
      void updateInclusionCounts() {
        final newCounts = Map<String, int>.from(inclusionCounts.value);
        if (countNotifier.value > 0) {
          newCounts[inclusion.productId] = countNotifier.value;
        } else {
          newCounts.remove(inclusion.productId);
        }
        inclusionCounts.value = newCounts;
      }

      countNotifier.addListener(updateInclusionCounts);
      return () => countNotifier.removeListener(updateInclusionCounts);
    }, [inclusion.productId]);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                inclusion.name,
                style: context.textTheme.displaySmall,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: ItemCounter(count: countNotifier),
            ),
          ],
        ),
        Divider(),
      ],
    );
  }

  Widget _buildActionButtons(
    BuildContext context, {
    required ValueNotifier<Map<String, int>> inclusionCounts,
    required List<ProductModel> inclusions,
  }) {
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
              icon: Icon(Icons.check_circle),
              onPressed: () =>
                  _confirmInclusions(context, inclusionCounts, inclusions),
              label: Text('Confirm'),
            ),
          ),
        ],
      ),
    );
  }
}
